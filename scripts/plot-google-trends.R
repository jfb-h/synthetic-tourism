library(tidyverse)
library(tidysynth)
library(patchwork)
library(arrow)
library(scales)

dat <- read_csv2("data/support/google-trends.csv") |> select(
  month = Monat, Elbphilharmonie, Speicherstadt
) |> mutate(
  month = lubridate::ym(month),
  Elbphilharmonie = as.numeric(Elbphilharmonie),
  Speicherstadt = as.numeric(Speicherstadt)
  ) |> pivot_longer(-month)

p <- ggplot(dat, aes(month, value, linetype = name)) +
  geom_line() +
  labs(x = "", y = "Google search index", linetype = "") +
  theme_minimal() +
  theme(legend.position = "bottom")

ggsave("documents/papers/figures/google-trends.png", width = 10, heigh = 4)
