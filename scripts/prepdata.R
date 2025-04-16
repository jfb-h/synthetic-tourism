library(tidyverse)
library(readxl)

cities <- c(
  "Wuppertal", "Stuttgart", "Rotterdam", "Oslo", "Nürnberg",
  "münster", "münchen", "kopenhagen", "köln", "helsinki", "hannover",
  "hamburg", "essen", "düsseldorf", "duisburg", "dortmund", "bremerhaven",
  "bremen", "bonn", "bochum", "bielefeld", "berlin", "amsterdam"
)

datanew <- read_xlsx("data/raphael/data_ueberblick2.xlsx") |>
  select(Jahr, Monat, Stadt, GAST02__Gaesteuebernachtungen__Anzahl, art)

finalyeargr <- expand.grid(Jahr = seq(1998, 2024), Monat = seq(1, 12), Stadt = cities)

final2 <- left_join(finalyeargr, datanew, by=c("Jahr", "Monat", "Stadt"))

finalq <- final2 |>
  filter(art==FALSE) |>
  mutate(Quarter = case_when(
    Monat %in% c(1, 2, 3)  ~ 1,
    Monat %in% c(4, 5, 6)  ~ 2,
    Monat %in% c(7, 8, 9)  ~ 3,
    Monat %in% c(10, 11, 12) ~ 4
  )) |>
  group_by(Jahr, Stadt, Quarter) |>
  summarise(total = sum(GAST02__Gaesteuebernachtungen__Anzahl), .groups = "drop")

dataq2 <- datanew |>
  select(Jahr, Stadt, Monat, art, GAST02__Gaesteuebernachtungen__Anzahl) |>
  filter(art == FALSE, Stadt %in% c("München", "Nürnberg")) |>
  mutate(Quarter = case_when(
    Monat %in% c(1, 2, 3)  ~ 1,
    Monat %in% c(4, 5, 6)  ~ 2,
    Monat %in% c(7, 8, 9)  ~ 3,
    Monat %in% c(10, 11, 12) ~ 4
  ))

proportions <- dataq2 |> 
  filter(Jahr %in% 2006:2019) |>
  group_by(Jahr, Stadt, Quarter) |>
  summarise(total = sum(GAST02__Gaesteuebernachtungen__Anzahl), .groups = "drop") |>
  group_by(Jahr, Stadt) |>
  mutate(proportion = total / sum(total)) |>
  group_by(Stadt, Quarter) |> summarise(proportion = mean(proportion))


finalj <- final2 |>
  filter(art==TRUE) |>
  mutate(Quarter = case_when(
    Monat %in% c(1, 2, 3)  ~ 1,
    Monat %in% c(4, 5, 6)  ~ 2,
    Monat %in% c(7, 8, 9)  ~ 3,
    Monat %in% c(10, 11, 12) ~ 4
  )) |>
  select(Jahr, Stadt, Quarter, GAST02__Gaesteuebernachtungen__Anzahl) |>
  distinct() |>  
  left_join(proportions, by = c("Stadt", "Quarter")) |>  # Join proportions
  mutate(total = GAST02__Gaesteuebernachtungen__Anzahl * proportion) |> 
  select(Jahr, Stadt, Quarter, total)

finalgr <- expand.grid(Jahr = seq(1998, 2024), Quarter = seq(1,4),
            Stadt = cities)


finaltest <- rbind(finalq, finalj)

final <- left_join(finalgr, finaltest, by=c("Jahr","Quarter","Stadt")) |>
  filter(!(Jahr==2024 & (Quarter == 3 | Quarter == 4)))

ew <- read.csv2("data/raphael/EWdaten.csv") |> janitor::clean_names() |>
  pivot_longer(cols=starts_with("x") ,names_to = "Year") |>
  mutate(Year = as.numeric(gsub("[^0-9.-]", "", Year))) |>
  select(geo_labels,Year,value) |>
  rename(ew=value)

gdp <- read.csv2("data/raphael/GDPdaten.csv") |> janitor::clean_names() |>
  pivot_longer(cols=starts_with("x") ,names_to = "Year") |>
  mutate(Year = as.numeric(gsub("[^0-9.-]", "", Year)))|>
  select(geo_labels,Year,value) |>
  rename(gdp=value)

dat <- final |> rename(city=Stadt,year=Jahr,stays=total, quarter=Quarter) |>
  arrange(year, quarter) |>
  mutate(i = cur_group_id(), .by = c(year, quarter)) |>
  left_join(gdp, by = c("year"="Year", "city"="geo_labels")) |>
  left_join(ew, by = c("year"="Year", "city"="geo_labels")) |>
  mutate(gdp = as.numeric(gdp), ew = as.numeric(ew)) |>
  tibble()


