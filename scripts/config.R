CONF <- {
  # files containing the data for the analysis
  files <- list(
    overnight_stays = "data/intermediate/tourism.xlsx",
    population = "data/intermediate/population.csv",
    gdp = "data/intermediate/gdp.csv"
  )

  # For some cities and periods, only yearly data is available which we interpolate
  interpolate_quarters <- list(
    München = 1995:2005,
    Nürnberg = 1995:2005,
    Frankfurt = 2006:2008
  )

  # The earliest / latest year that should be considered in the prediction
  minyear <- 1998
  maxyear <- 2025

  # The cities making up the donor pool
  cities <- c(
    "Amsterdam",
    "Berlin",
    "Bielefeld",
    "Bochum",
    "Bonn",
    "Bremen",
    "Bremerhaven",
    # "Brussels",
    "Dortmund",
    "Duisburg",
    "Düsseldorf",
    "Essen",
    # "Flensburg",
    # "Frankfurt",
    # "Göteborg",
    "Hamburg",
    "Hannover",
    "Helsinki",
    # "Kiel",
    "Kopenhagen",
    "Köln",
    "München",
    "Münster",
    "Nürnberg",
    "Oslo",
    "Rotterdam",
    # "Stockholm",
    "Stuttgart",
    # "Tallinn",
    # "Uusimaa (Region Helsinki)",
    # "Vienna",
    "Wuppertal"
    # "Zurich"
  )

  list(
    files = files,
    maxyear = maxyear,
    minyear = minyear,
    interpolate_quarters = interpolate_quarters,
    cities = cities
  )
}
