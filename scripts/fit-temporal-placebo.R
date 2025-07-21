library(tidyverse)
library(tidysynth)
library(patchwork)
library(arrow)
library(scales)

dat <- read_parquet("data/processed/data.parquet")

quartermonth <- function(x) c(1, 4, 7, 10)[x]

qids <- function(years, quarter, start = 1998) {
  if (years[1] < start) stop("start outside of period")
  s <- (years[1] - start) * 4 + quarter
  seq(s, s + length(years) * 4 - 1, by = 4)
}

yids <- function(years, start = 1998) {
  s <- (first(years) - start) * 4 + 1
  e <- s + 3 + (last(years) - first(years)) * 4
  s:e
}

i_observed <- 77
i_placebo <- 49

synth_out_placebo <-
  dat |>
  synthetic_control(
    outcome = stays,
    unit = city,
    time = i,
    i_unit = "Hamburg",
    i_time = i_placebo,
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
    time_window = qids(2007:2010, 1),
    stays_2007_2011_1 = mean(stays, na.rm = TRUE)
  ) |>
  generate_predictor(
    time_window = qids(2007:2010, 2),
    stays_2007_2011_2 = mean(stays, na.rm = TRUE)
  ) |>
  generate_predictor(
    time_window = qids(2007:2010, 3),
    stays_2007_2011_3 = mean(stays, na.rm = TRUE)
  ) |>
  generate_predictor(
    time_window = qids(2007:2010, 4),
    stays_2007_2011_4 = mean(stays, na.rm = TRUE)
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
  generate_weights(
    optimization_window = yids(1998:2010),
    margin_ipop = .02, sigf_ipop = 7, bound_ipop = 6
  ) |>
  generate_control()

# p1 <- synth_out |> plot_trends()
# p2 <- synth_out |> plot_differences()
# p3 <- synth_out |> plot_weights()
# p4 <- synth_out |> plot_placebos()
# p_combined <- (p1 / p2) | (p3 / p4)

quarter_numbers <- 1:106
years <- 1998 + floor((quarter_numbers - 1) / 4)
quarters <- ((quarter_numbers - 1) %% 4) + 1
dates <- lubridate::ymd(paste(years, c(1,4,7,10)[quarters], "01", sep = "-"))

# Difference plot

d_diff <- synth_out |>
 grab_synthetic_control(placebo = FALSE) |>
  rename(synthetic = synth_y, observed = real_y) |>
  mutate(dates = dates)

p1 <- d_diff |>
  pivot_longer(cols = c(observed, synthetic)) |>
  ggplot(aes(dates, value, color = name)) + 
    geom_rect(
      aes(xmin = ymd("2020-03-01"), xmax = ymd("2020-05-31"), ymin = -Inf, ymax = Inf),
      color = "grey90", fill = "grey90", alpha = 0.5
    ) +
    geom_rect(
      aes(xmin = ymd("2020-11-01"), xmax = ymd("2020-12-31"), ymin = -Inf, ymax = Inf),
      color = "grey90", fill = "grey90", alpha = 0.5
    ) +
    geom_rect(
      aes(xmin = ymd("2020-12-01"), xmax = ymd("2021-05-31"), ymin = -Inf, ymax = Inf),
      color = "grey90", fill = "grey90", alpha = 0.5
    ) +
    geom_ribbon(
      data = filter(d_diff, dates >= ymd("2010-01-01")),
      mapping = aes(x = dates, ymin = pmin(observed, synthetic), ymax = pmax(observed, synthetic)),
      inherit.aes = FALSE,
      fill = "#00aeff", alpha = 0.3
    ) +
    geom_vline(xintercept = ymd("2010-01-01"), color = "black", linetype = 2) + 
    geom_vline(xintercept = ymd("2017-01-01"), color = "grey70", linetype = 2) + 
    annotate("text", x = ymd("2008-01-01"), y = 4500000, label = "placebo\nintervention") +
    annotate("text", x = ymd("2015-01-01"), y = 4500000, label = "real\nintervention", color = "grey70") +
    geom_line(linewidth = 0.8, alpha = 0.7) + 
    scale_color_manual(values = c("grey60", "black")) + 
    scale_linetype_manual(values = c(1, 4)) + 
    scale_y_continuous(labels = scales::comma) +
    scale_x_date(
      breaks = seq(ymd("1998-01-01"), ymd("2025-01-01"), by = "2 years"),
      date_labels = "%Y"
    ) +
    labs(y = "Observed and synthetic\novernight stays", x = NULL, color = NULL) +
    theme_minimal() +
    guides(linetype = FALSE) +
    theme(legend.position = "top", legend.justification = "left")

ggsave("documents/papers/figures/plot-robustness-temporal.png", p1, height = 6, width = 10)
