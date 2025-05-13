library(tidyverse)
library(patchwork)
library(arrow)
library(scales)

dat <- read_parquet("data/processed/data.parquet") |>
    mutate(date = lubridate::ymd(paste(year, c(1,4,7,10)[quarter], "01", sep="-")))

dat |>
    ggplot(aes(date, stays, group = city)) +
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
    geom_line(color = "grey70") +
    geom_line(
        data = filter(dat, city %in% c("Hamburg", "Berlin", "München", "Amsterdam")), 
        mapping = aes(date, stays, color = city), 
        lwd = 1
    ) +
    scale_y_continuous(labels = scales::comma) +
    #scale_y_log10() +
    scale_color_brewer(palette="Dark2") +
      scale_x_date(
      breaks = seq(ymd("1998-01-01"), ymd("2025-01-01"), by = "2 years"),
      date_labels = "%Y"
    ) +
    labs(x = NULL, y = "Overnight stays", color = NULL) +
    theme_minimal() +
    theme(legend.position = "bottom")

ggsave("documents/papers/figures/plot-descriptive.png", height = 8, width = 12)

