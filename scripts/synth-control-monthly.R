library(tidysynth)
library(patchwork)

# dat <- arr |>
#   filter(
#     year(date) > 1995,
#     year(date) < 2024
#   ) |>
#   filter(
#     # TODO: Don't throw away data (due to missing stays)
#     !(city %in% c("Flensburg", "Nürnberg", "München", "Frankfurt", "Kiel"))
#   ) |>
#   filter(
#     # TODO: Don't throw away data (due to missing gdp)
#     !(city %in% c("Hannover", "Bremerhaven"))
#   ) |>
#   mutate(year = year(date), quarter = quarter(date)) |>
#   summarize(
#     stays = sum(stays, na.rm = TRUE),
#     .by = c(city, year, quarter)
#   ) |>
#   arrange(year, quarter) |>
#   mutate(i = cur_group_id(), .by = c(quarter, year)) |>
#   left_join(
#     select(gdp, time, place, gdp),
#     by = c("year" = "time", "city" = "place")
#   ) |>
#   left_join(
#     select(pop, time, place, pop),
#     by = c("year" = "time", "city" = "place")
#   )

quartermonth <- function(x) c(1, 4, 7, 10)[x]

# dat |>
#   distinct(city, year, gdp) |>
#   ggplot(aes(
#     x = year,
#     y = gdp,
#     color = city
#   )) +
#   geom_line() +
#   scale_y_log10()

qids <- function(years, quarter, start = 1996) {
  if (years[1] < start) stop("start outside of period")
  s <- (years[1] - start) * 4 + quarter
  seq(s, s + length(years) * 4 - 1, by = 4)
}

yids <- function(years, start = 1996) {
  s <- (first(years) - start) * 4 + 1
  e <- s + 3 + (last(years) - first(years)) * 4
  s:e
}

synth_out <-
  dat |>
  synthetic_control(
    outcome = stays,
    unit = city,
    time = i,
    i_unit = "Hamburg",
    i_time = 77,
    generate_placebos = TRUE
  ) |>
  # quarterly stays by 5 year periods
  generate_predictor(
    time_window = qids(1998:2001, 1),
    stays_1998_2001_1 = mean(stays, na.rm = TRUE)
  ) |>
  generate_predictor(
    time_window = qids(1998:2001, 2),
    stays_1998_2001_2 = mean(stays, na.rm = TRUE)
  ) |>
  generate_predictor(
    time_window = qids(1998:2001, 3),
    stays_1998_2001_3 = mean(stays, na.rm = TRUE)
  ) |>
  generate_predictor(
    time_window = qids(1998:2001, 4),
    stays_1998_2001_4 = mean(stays, na.rm = TRUE)
  ) |>
  generate_predictor(
    time_window = qids(2002:2006, 1),
    stays_2002_2006_1 = mean(stays, na.rm = TRUE)
  ) |>
  generate_predictor(
    time_window = qids(2002:2006, 2),
    stays_2002_2006_2 = mean(stays, na.rm = TRUE)
  ) |>
  generate_predictor(
    time_window = qids(2002:2006, 3),
    stays_2002_2006_3 = mean(stays, na.rm = TRUE)
  ) |>
  generate_predictor(
    time_window = qids(2002:2006, 4),
    stays_2002_2006_4 = mean(stays, na.rm = TRUE)
  ) |>
  generate_predictor(
    time_window = qids(2007:2011, 1),
    stays_2007_2011_1 = mean(stays, na.rm = TRUE)
  ) |>
  generate_predictor(
    time_window = qids(2007:2011, 2),
    stays_2007_2011_2 = mean(stays, na.rm = TRUE)
  ) |>
  generate_predictor(
    time_window = qids(2007:2011, 3),
    stays_2007_2011_3 = mean(stays, na.rm = TRUE)
  ) |>
  generate_predictor(
    time_window = qids(2007:2011, 4),
    stays_2007_2011_4 = mean(stays, na.rm = TRUE)
  ) |>
  generate_predictor(
    time_window = qids(2012:2016, 1),
    stays_2012_2016_1 = mean(stays, na.rm = TRUE)
  ) |>
  generate_predictor(
    time_window = qids(2012:2016, 2),
    stays_2012_2016_2 = mean(stays, na.rm = TRUE)
  ) |>
  generate_predictor(
    time_window = qids(2012:2016, 3),
    stays_2012_2016_3 = mean(stays, na.rm = TRUE)
  ) |>
  generate_predictor(
    time_window = qids(2012:2016, 4),
    stays_2012_2016_4 = mean(stays, na.rm = TRUE)
  ) |>
  # gdp
  generate_predictor(
    time_window = yids(2000:2004),
    gdp_2000_2004 = mean(gdp, na.rm = TRUE)
  ) |>
  generate_predictor(
    time_window = yids(2005:2009),
    gdp_2005_2009 = mean(gdp, na.rm = TRUE)
  ) |>
  generate_predictor(
    time_window = yids(2010:2014),
    gdp_2010_2014 = mean(gdp, na.rm = TRUE)
  ) |>
  generate_predictor(
    time_window = yids(2015:2016),
    gdp_2015_2016 = mean(gdp, na.rm = TRUE)
  ) |>
  # ew
  generate_predictor(
    time_window = yids(2014:2016),
    ew_2014_2016 = mean(ew, na.rm = TRUE)
  ) |>
  generate_control()



p2 <- synth_out |> plot_differences()
p3 <- synth_out |> plot_weights()
p4 <- synth_out |> plot_placebos()
(p1 / p2) | (p3 / p4)
ggsave("plot-results.png")

synth_out |> plot_mspe_ratio()
synth_out |> grab_significance()
synth_out |> grab_balance_table()
