library(tidyverse)
library(tidysynth)
library(arrow)
library(tinytable)

source("scripts/run_scm.R")

dat <- read_parquet("data/processed/data.parquet")

cities <- filter(dat, city != "Hamburg") |> pull(city) |> unique()

i_observed <- 77

synth_out_loo <- lapply(cities, function(c) {
  print(c)
  d <- filter(dat, city != c)
  run_scm(d, i_observed, generate_placebos = FALSE)
})

loo_mspe <- sapply(synth_out_loo, function(s) {
  sqrt(grab_loss(s)$variable_mspe[1])
})

loo_treatment_effect <- sapply(synth_out_loo, function(s) {
  r <- grab_synthetic_control(s)
  mean(r$real_y - r$synth_y)
})

treatment_effect_baseline <- grab_synthetic_control(synth_out) |>
  summarize(avg = mean(real_y - synth_y))

loo <- tibble(
  unit = cities,
  loo_pretreatment_mspe = loo_mspe,
  avg_loo_treatment_effect = loo_treatment_effect,
  relative_to_baseline = avg_loo_treatment_effect / treatment_effect_baseline$avg - 1
)

p1 <- loo |> ggplot(aes(unit, loo_pretreatment_mspe)) +
  geom_point() + lims(y = c(0, 250000))

p2 <- loo |> ggplot(aes(unit, avg_loo_treatment_effect)) +
  geom_point() + lims(y = c(0, 250000))

p1 / p2


## TODO: Berlin distorts everything? ############

no_berlin <- filter(dat, city != "Berlin")

synth_out_no_berlin <- run_scm(no_berlin, i_observed)
