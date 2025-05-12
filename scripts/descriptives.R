library(tidyverse)
library(patchwork)
library(arrow)
library(scales)

dat <- read_parquet("data/processed/data.parquet") |>
    mutate(date = lubridate::ymd(paste(year, c(1,4,7,10)[quarter], "01", sep="-")))

dat |>
    ggplot(aes(date, stays, group = city)) +
    geom_line(color = "grey70") +
    geom_line(
        data = filter(dat, city %in% c("Hamburg", "Berlin", "München", "Amsterdam")), 
        mapping = aes(date, stays, color = city), 
        lwd = 1
    ) +
    scale_y_continuous(labels = scales::comma) +
    #scale_y_log10() +
    scale_color_brewer(palette="Dark2") +
    labs(x = NULL, y = "Overnight stays", color = NULL) +
    theme_minimal() +
    theme(legend.position = "bottom")

ggsave("documents/papers/figures/plot-descriptive.png", height = 8, width = 12)

