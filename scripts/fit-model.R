library(tidyverse)
library(tidysynth)
library(patchwork)
library(arrow)

dat <- read_parquet("data/processed/data.parquet")

quartermonth <- function(x) c(1, 4, 7, 10)[x]

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
  generate_weights(
    optimization_window = yids(1998:2017), 
    margin_ipop = .02,sigf_ipop = 7,bound_ipop = 6 
  ) |>
  generate_control()

p1 <- synth_out |> plot_trends()
p2 <- synth_out |> plot_differences()
p3 <- synth_out |> plot_weights()
p4 <- synth_out |> plot_placebos()
p_combined <- (p1 / p2) | (p3 / p4)

ggsave(p_combined, "figures/plot-combined.png", height = 10, width = 15)

synth_out |> plot_mspe_ratio()
synth_out |> grab_significance()
synth_out |> grab_balance_table()
