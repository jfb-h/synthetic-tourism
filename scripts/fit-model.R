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

synth_out <-
  dat |>
  synthetic_control(
    outcome = stays,
    unit = city,
    time = i,
    i_unit = "Hamburg",
    i_time = i_observed,
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
      data = filter(d_diff, dates >= ymd("2017-01-01")),
      mapping = aes(x = dates, ymin = pmin(observed, synthetic), ymax = pmax(observed, synthetic)),
      inherit.aes = FALSE,
      fill = "#00aeff", alpha = 0.3
    ) +
    geom_vline(xintercept = ymd("2017-01-01"), color = "black", linetype = 2) + 
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

p2 <- synth_out |>
 grab_synthetic_control(placebo = FALSE) |>
 mutate(diff = real_y - synth_y, dates = dates) |>    
    ggplot(aes(dates, diff)) + 
    geom_rect(
      aes(xmin = ymd("2020-03-01"), xmax = ymd("2020-05-31"), ymin = -Inf, ymax = Inf),
      fill = "grey90", alpha = 0.5
    ) +
    geom_rect(
      aes(xmin = ymd("2020-11-01"), xmax = ymd("2020-12-31"), ymin = -Inf, ymax = Inf),
      fill = "grey90", alpha = 0.5
    ) +
    geom_rect(
      aes(xmin = ymd("2020-12-01"), xmax = ymd("2021-05-31"), ymin = -Inf, ymax = Inf),
      fill = "grey90", alpha = 0.5
    ) +
    geom_area(
      data = (\(df) filter(df, dates >= ymd("2017-01-01"))), 
      aes(x = dates, y = diff), 
      fill = "#00aeff", alpha = 0.3
    ) +
    geom_hline(yintercept = 0, color = "black", linetype = 2) + 
    geom_vline(xintercept = ymd("2017-01-01"), color = "black", linetype = 2) + 
    annotate("text", x = ymd("2014-05-01"), y = 850000, label = "Opening of the\nElbphilharmonie") +
    geom_line(linewidth = 1, alpha = 0.75, color = "black") + 
    scale_y_continuous(labels = scales::comma) +
    scale_x_date(
      breaks = seq(ymd("1998-01-01"), ymd("2025-01-01"), by = "2 years"),
      date_labels = "%Y"
    ) +
    theme_minimal() +
    labs(y = "Observed - synthetic \novernight stays", x = NULL)

p_diff <- p1 / p2 + plot_annotation(tag_levels = "a",  tag_prefix = "(", tag_suffix = ")")

ggsave("documents/papers/figures/plot-difference.png", p_diff, height = 6, width = 10)

# difference sum

synth_out |>
 grab_synthetic_control(placebo = FALSE) |>
 mutate(diff = real_y - synth_y, dates = dates) |>
 filter(dates > ymd("2017-01-01")) |>
 pull(diff) |>
 sum()

# Placebo test

time_window <- unique(synth_out$.original_data[[1]][["i"]])
sig_data <- synth_out |> grab_significance(time_window = time_window)
thres <- sig_data |> filter(type == "Treated") |> pull(pre_mspe) |> sqrt()

retain <- sig_data |> 
  select(unit_name, pre_mspe) |> 
  filter(sqrt(pre_mspe) <= thres * 2) |> 
  pull(unit_name)

plot_data <- synth_out |>
 grab_synthetic_control(placebo = TRUE) |>
 mutate(diff = real_y - synth_y) |>
 left_join(tibble(time_unit = 1:length(dates), dates = dates)) |>
 mutate(
      type_text = ifelse(.placebo == 0, "Hamburg", "control units"), 
      type_text = factor(type_text, levels = c("Hamburg", "control units"))
 ) |>
 filter(.id %in% retain)

p_placebo_unit <- plot_data |> 
  ggplot(aes(
    dates, 
    diff, 
    group = .id, 
    color = type_text, 
    alpha = type_text, 
    size = type_text
  )) + 
  geom_hline(yintercept = 0, color = "black", linetype = 2) + 
  geom_vline(xintercept = ymd("2017-01-01"), color = "black", linetype = 2) + 
  annotate("text", x = ymd("2014-05-01"), y = 850000, label = "Opening of the\nElbphilharmonie") +
  geom_line() + 
  scale_color_manual(values = c("black", "grey70")) + 
  scale_alpha_manual(values = c(1, 0.4)) + 
  scale_size_manual(values = c(1, 0.5)) + 
  scale_y_continuous(labels = scales::comma) +
  scale_x_date(
      breaks = seq(ymd("1998-01-01"), ymd("2025-01-01"), by = "2 years"),
      date_labels = "%Y"
    ) +
  labs(
    color = NULL, linetype = NULL, group = NULL, alpha = NULL, size = NULL,
    x = NULL, y = "Observed - synthetic overnight stays"
  ) + 
  guides(linetype = FALSE) +
  theme_minimal() +
  theme(legend.position = "bottom")

# ggsave("documents/papers/figures/plot-placebos.png", p_placebo_unit, height = 6, width = 10)

# MSPE plot

names_new <- c("Essen", "Dusseldorf","Bremerhaven", "Duisburg","Berlin", 
"Stuttgart", "Bielefeld", "Bonn","Wuppertal", "Nuremberg", 
"Hannover","Cologne","Helsinki","Munster", "Copenhagen",
"Munich", "Bochum","Amsterdam", "Dortmund","Bremen",
"Rotterdam", "Hamburg") 

p4 <- synth_out |> 
  grab_significance(time_window = time_window) |> 
    mutate(
      unit_name = fct_reorder(as.character(unit_name), mspe_ratio),
      type = factor(
        type, 
        levels = c("Donor", "Treated"), 
        labels = c("control", "treated")
      ),
    ) |>
    mutate(unit_name = factor(unit_name, labels = names_new)) |>
    ggplot(aes(unit_name, mspe_ratio, fill = type)) + 
    geom_col(alpha = 0.65) + 
    coord_flip() + 
    labs(
      y = "Post-treatment MSPE / pre-treatment MSPE", 
      x = "", 
      fill = "", 
      color = "", 
      title = ""
    ) + 
    scale_fill_manual(values = c("grey70", "black")) + 
    scale_color_manual(values = c("grey70", "black")) + 
    theme_minimal() + 
    theme(legend.position = "bottom")

ggsave("documents/papers/figures/plot-mspe.png", p4, height = 7, width = 5)

# temporal placebo

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


d_diff_placebo <- synth_out_placebo |>
 grab_synthetic_control(placebo = FALSE) |>
  rename(synthetic = synth_y, observed = real_y) |>
  mutate(dates = dates)

p_placebo_backdating <- d_diff_placebo |>
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

# p_placebo_backdating_diff <- synth_out_placebo |>
#  grab_synthetic_control(placebo = FALSE) |>
#  mutate(diff = real_y - synth_y, dates = dates) |>    
#     ggplot(aes(dates, diff)) + 
#     geom_rect(
#       aes(xmin = ymd("2020-03-01"), xmax = ymd("2020-05-31"), ymin = -Inf, ymax = Inf),
#       fill = "grey90", alpha = 0.5
#     ) +
#     geom_rect(
#       aes(xmin = ymd("2020-11-01"), xmax = ymd("2020-12-31"), ymin = -Inf, ymax = Inf),
#       fill = "grey90", alpha = 0.5
#     ) +
#     geom_rect(
#       aes(xmin = ymd("2020-12-01"), xmax = ymd("2021-05-31"), ymin = -Inf, ymax = Inf),
#       fill = "grey90", alpha = 0.5
#     ) +
#     geom_area(
#       data = (\(df) filter(df, dates >= ymd("2017-01-01"))), 
#       aes(x = dates, y = diff), 
#       fill = "#00aeff", alpha = 0.3
#     ) +
#     geom_hline(yintercept = 0, color = "black", linetype = 2) + 
#     geom_vline(xintercept = ymd("2010-01-01"), color = "black", linetype = 2) + 
#     geom_vline(xintercept = ymd("2017-01-01"), color = "grey70", linetype = 2) + 
#     annotate("text", x = ymd("2008-01-01"), y = 850000, label = "placebo\nintervention") +
#     annotate("text", x = ymd("2015-01-01"), y = 850000, label = "real\nintervention", color = "grey70") +
#     geom_line(linewidth = 1, alpha = 0.75, color = "black") + 
#     scale_y_continuous(labels = scales::comma) +
#     scale_x_date(
#       breaks = seq(ymd("1998-01-01"), ymd("2025-01-01"), by = "2 years"),
#       date_labels = "%Y"
#     ) +
#     theme_minimal() +
#     labs(y = "Observed - synthetic \novernight stays", x = NULL)

p_placebos_both <- p_placebo_unit / p_placebo_backdating + plot_annotation(tag_levels = "a",  tag_prefix = "(", tag_suffix = ")")

ggsave("documents/papers/figures/plot-placebos-both.png", p_placebos_both, height = 8, width = 10)

# difference sum

synth_out |>
 grab_synthetic_control(placebo = FALSE) |>

# tables etc.

synth_out |> tidysynth::grab_unit_weights()

synth_out |> grab_balance_table()
# synth_out |> grab_significance()
# synth_out |> grab_balance_table()

plot_data |> 
  filter(year(dates) >= 2017 & type_text == "Hamburg") |>
  select(dates, real_y, synth_y) |>
  mutate(diff = real_y - synth_y) |>
  write_csv("data/intermediate/post-intervention-differences.csv")

