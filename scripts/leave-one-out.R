library(tidyverse)
library(tidysynth)
library(arrow)
library(tinytable)

source("scripts/run_scm.R")

dat <- read_parquet("data/processed/data.parquet")

i_observed <- 77

# baseline result with full donor pool
synth_out <- run_scm(dat, i_observed)

treatment_effect_baseline <- grab_synthetic_control(synth_out) |>
  summarize(avg = sum(real_y - synth_y))

rmspe_baseline <- synth_out |>
  grab_loss() |>
  pull(variable_mspe) |>
  first() |>
  sqrt()

# all cities in the donor pool
cities <- filter(dat, city != "Hamburg") |> pull(city) |> unique()

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
  sum(r$real_y - r$synth_y, na.rm = TRUE)
})

loo <- tibble(
  unit = cities,
  loo_pretreatment_rmspe = loo_mspe,
  loo_treatment_effect = loo_treatment_effect
)

table_rmspe_loo <- synth_out |>
  grab_significance(time_window = time_window) |>
  mutate(
    unit_name = fct_reorder(as.character(unit_name), mspe_ratio),
  ) |> 
  left_join(
    loo,
    by = c("unit_name" = "unit")
  ) |>
  select(
   City = unit_name,
   `RMSPE ratio` = mspe_ratio,
   `Pre-intervetion RMSPE` = loo_pretreatment_rmspe,
   `Treatment effect` = loo_treatment_effect
)
  
table_rmspe_loo[1, 4] <- treatment_effect_baseline[1,1]
table_rmspe_loo[1, 3] <- rmspe_baseline 

table_rmspe_loo |> tt(
    notes = "Note: Pre-intervention RMSPE and treatment effect for Hamburg refer to the baseline estimate."
  ) |>
  format_tt(
    replace = "-",
    digits = 2,
    num_mark_big = ","
  ) |>
  style_tt(
    align = "lrrr"
  ) |>
  group_tt(
    j = list(
      "Pre / post intervention comparison" = 2,
      "Leave-one-out test (LOO)" = 3:4
    )
  ) |>
  style_tt(
    i = 17, j = 1:4,
    background = "grey90",
  ) |>
  save_tt(
    "documents/papers/figures/table-rmspe-loo.typ",
    overwrite = TRUE
  )


## Dependence on Berlin ############

source("scripts/run_scm.R")

no_berlin <- filter(dat, city != "Berlin")

synth_out_no_berlin <- run_scm(no_berlin, i_observed)

p1 <- synth_out_no_berlin |> plot_trends()
p2 <- synth_out_no_berlin |> plot_differences()
p3 <- synth_out_no_berlin |> plot_weights()
p4 <- synth_out_no_berlin |> plot_placebos()
(p1 / p2) | (p3 / p4)
