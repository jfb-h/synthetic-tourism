library(tidyverse)
library(readxl)
library(arrow)

# Imports list with configuration options and file names
source("scripts/config.R")

read_overnight_stays <- function(CONF) {
  read_xlsx(CONF$files$overnight_stays) |>
  # column art identifies cities/periods with yearly data (Munich, Nuremberg and Frankfurt)
    select(year=Jahr, month=Monat, city=Stadt, total=GAST02__Gaesteuebernachtungen__Anzahl, art)
}

extend_to_month_city_grid <- function(data, CONF) {
  expand.grid(
    year = seq(CONF$minyear, CONF$maxyear),
    month = seq(1, 12),
    city = CONF$cities
  ) |>
  filter(!(year == CONF$maxyear & month > 9)) |>
  arrange(year, month, city) |>
  tibble() |>
  left_join(data, by = c("year", "month", "city"))
}

add_quarters <- function(data) {
    data |> mutate(quarter = case_when(
      month %in% c(1, 2, 3) ~ 1,
      month %in% c(4, 5, 6) ~ 2,
      month %in% c(7, 8, 9) ~ 3,
      month %in% c(10, 11, 12) ~ 4
    ))
}

aggregate_by_quarter <- function(data) {
  data |>
    summarise(
      total = sum(total),
      .by = c(year, city, quarter)
    )
}

quarterly_interpolation_proportions <- function(data, cities, period) {
  data |>
    filter(city %in% cities & year %in% period) |>
    mutate(proportion = total / sum(total), .by = c(city, year)) |>
    summarise(proportion = mean(proportion), .by = c(city, quarter))
}

interpolate_quarterly_from_yearly_data <- function(data, proportions) {
      data |> left_join(
        proportions,
        by = c("city", "quarter")) |>
      mutate(total = total * proportion) |>
      select(year, city, quarter, total)
}

add_date_from_quarter <- function(df) {
  df |> mutate(date = as.Date(paste(year, (quarter - 1) * 3 + 1, 1, sep = "-")))
}

read_and_prepare_overnight_stays <- function(CONF) {
  data <- read_overnight_stays(CONF) |>
    extend_to_month_city_grid(CONF) |>
    add_quarters()

  cities = c("München", "Nürnberg", "Frankfurt")
  period = c(2008:2018)
  proportions <- quarterly_interpolation_proportions(aggregate_by_quarter(data), cities, period)
  lookup_yearly <- enframe(CONF$interpolate_quarters, name = "city", value = "year") |> unnest(year)

  data_no_interpolation <- data |>
    anti_join(lookup_yearly, by = c("city", "year")) |>
    aggregate_by_quarter()

  data_interpolation <- data |>
    inner_join(lookup_yearly, by = c("city", "year")) |>
    summarize(total = first(total), .by = c("city", "quarter", "year")) |>
    interpolate_quarterly_from_yearly_data(proportions)

  data_combined <- data_no_interpolation |>
    bind_rows(data_interpolation) |>
    arrange(year, city, quarter)

  data_combined
}

read_and_prepare_pop <- function(CONF) {
  read_csv2(CONF$files$population) |>
    janitor::clean_names() |>
    pivot_longer(cols = starts_with("x"), names_to = "Year") |>
    mutate(Year = as.numeric(gsub("[^0-9.-]", "", Year))) |>
    select(geo_labels, Year, value) |>
    rename(pop = value)
}

read_and_prepare_gdp <- function(CONF) {
  read_csv2(CONF$files$gdp) |>
    janitor::clean_names() |>
    pivot_longer(cols = starts_with("x"), names_to = "Year") |>
    mutate(Year = as.numeric(gsub("[^0-9.-]", "", Year))) |>
    select(geo_labels, Year, value) |>
    rename(gdp = value)
}

combine_datasets <- function(overnight_stays, gdp, pop) {
  overnight_stays |>
    rename(stays = total) |>
    arrange(year, quarter) |>
    mutate(i = cur_group_id(), .by = c(year, quarter)) |>
    left_join(gdp, by = c("year" = "Year", "city" = "geo_labels")) |>
    left_join(pop, by = c("year" = "Year", "city" = "geo_labels")) |>
    mutate(gdp = as.numeric(gdp), pop = as.numeric(pop)) |>
    filter(city != "Oslo") |>
    tibble()
}

main <- function(CONF) {
  ons <- read_and_prepare_overnight_stays(CONF)
  pop <- read_and_prepare_pop(CONF)
  gdp <- read_and_prepare_gdp(CONF)
  com <- combine_datasets(ons, gdp, pop)
  write_parquet(com, "data/processed/data.parquet")
}

main(CONF)

