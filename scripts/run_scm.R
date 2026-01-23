library(tidysynth)
library(dplyr)

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

run_scm <- function(dat, i_time, generate_placebos = TRUE) {
  dat |>
    synthetic_control(
      outcome = stays,
      unit = city,
      time = i,
      i_unit = "Hamburg",
      i_time = i_observed,
      generate_placebos = generate_placebos
    ) |>
    # quarterly stays by 5 year periods
    generate_predictor(
      time_window = qids(1998:1999, 1),
      stays_1998_1999_1 = mean(stays, na.rm = TRUE)
    ) |>
    generate_predictor(
      time_window = qids(1998:1999, 2),
      stays_1998_1999_2 = mean(stays, na.rm = TRUE)
    ) |>
    generate_predictor(
      time_window = qids(1998:1999, 3),
      stays_1998_1999_3 = mean(stays, na.rm = TRUE)
    ) |>
    generate_predictor(
      time_window = qids(1998:1999, 4),
      stays_1998_1999_4 = mean(stays, na.rm = TRUE)
    ) |>

    generate_predictor(
      time_window = qids(2000:2001, 1),
      stays_2000_2001_1 = mean(stays, na.rm = TRUE)
    ) |>
    generate_predictor(
      time_window = qids(2000:2001, 2),
      stays_2000_2001_2 = mean(stays, na.rm = TRUE)
    ) |>
    generate_predictor(
      time_window = qids(2000:2001, 3),
      stays_2000_2001_3 = mean(stays, na.rm = TRUE)
    ) |>
    generate_predictor(
      time_window = qids(2000:2001, 4),
      stays_2000_2001_4 = mean(stays, na.rm = TRUE)
    ) |>

    generate_predictor(
      time_window = qids(2002:2003, 1),
      stays_2002_2003_1 = mean(stays, na.rm = TRUE)
    ) |>
    generate_predictor(
      time_window = qids(2002:2003, 2),
      stays_2002_2003_2 = mean(stays, na.rm = TRUE)
    ) |>
    generate_predictor(
      time_window = qids(2002:2003, 3),
      stays_2002_2003_3 = mean(stays, na.rm = TRUE)
    ) |>
    generate_predictor(
      time_window = qids(2002:2003, 4),
      stays_2002_2003_4 = mean(stays, na.rm = TRUE)
    ) |>

    generate_predictor(
      time_window = qids(2004:2005, 1),
      stays_2004_2005_1 = mean(stays, na.rm = TRUE)
    ) |>
    generate_predictor(
      time_window = qids(2004:2005, 2),
      stays_2004_2005_2 = mean(stays, na.rm = TRUE)
    ) |>
    generate_predictor(
      time_window = qids(2004:2005, 3),
      stays_2004_2005_3 = mean(stays, na.rm = TRUE)
    ) |>
    generate_predictor(
      time_window = qids(2004:2005, 4),
      stays_2004_2005_4 = mean(stays, na.rm = TRUE)
    ) |>

    generate_predictor(
      time_window = qids(2006:2007, 1),
      stays_2006_2007_1 = mean(stays, na.rm = TRUE)
    ) |>
    generate_predictor(
      time_window = qids(2006:2007, 2),
      stays_2006_2007_2 = mean(stays, na.rm = TRUE)
    ) |>
    generate_predictor(
      time_window = qids(2006:2007, 3),
      stays_2006_2007_3 = mean(stays, na.rm = TRUE)
    ) |>
    generate_predictor(
      time_window = qids(2006:2007, 4),
      stays_2006_2007_4 = mean(stays, na.rm = TRUE)
    ) |>

    generate_predictor(
      time_window = qids(2008:2009, 1),
      stays_2008_2009_1 = mean(stays, na.rm = TRUE)
    ) |>
    generate_predictor(
      time_window = qids(2008:2009, 2),
      stays_2008_2009_2 = mean(stays, na.rm = TRUE)
    ) |>
    generate_predictor(
      time_window = qids(2008:2009, 3),
      stays_2008_2009_3 = mean(stays, na.rm = TRUE)
    ) |>
    generate_predictor(
      time_window = qids(2008:2009, 4),
      stays_2008_2009_4 = mean(stays, na.rm = TRUE)
    ) |>

    generate_predictor(
      time_window = qids(2010:2011, 1),
      stays_2010_2011_1 = mean(stays, na.rm = TRUE)
    ) |>
    generate_predictor(
      time_window = qids(2010:2011, 2),
      stays_2010_2011_2 = mean(stays, na.rm = TRUE)
    ) |>
    generate_predictor(
      time_window = qids(2010:2011, 3),
      stays_2010_2011_3 = mean(stays, na.rm = TRUE)
    ) |>
    generate_predictor(
      time_window = qids(2010:2011, 4),
      stays_2010_2011_4 = mean(stays, na.rm = TRUE)
    ) |>

    generate_predictor(
      time_window = qids(2012:2013, 1),
      stays_2012_2013_1 = mean(stays, na.rm = TRUE)
    ) |>
    generate_predictor(
      time_window = qids(2012:2013, 2),
      stays_2012_2013_2 = mean(stays, na.rm = TRUE)
    ) |>
    generate_predictor(
      time_window = qids(2012:2013, 3),
      stays_2012_2013_3 = mean(stays, na.rm = TRUE)
    ) |>
    generate_predictor(
      time_window = qids(2012:2013, 4),
      stays_2012_2013_4 = mean(stays, na.rm = TRUE)
    ) |>

    generate_predictor(
      time_window = qids(2014:2015, 1),
      stays_2014_2015_1 = mean(stays, na.rm = TRUE)
    ) |>
    generate_predictor(
      time_window = qids(2014:2015, 2),
      stays_2014_2015_2 = mean(stays, na.rm = TRUE)
    ) |>
    generate_predictor(
      time_window = qids(2014:2015, 3),
      stays_2014_2015_3 = mean(stays, na.rm = TRUE)
    ) |>
    generate_predictor(
      time_window = qids(2014:2015, 4),
      stays_2014_2015_4 = mean(stays, na.rm = TRUE)
    ) |>

    generate_predictor(
      time_window = qids(2016, 1),
      stays_2016_1 = mean(stays, na.rm = TRUE)
    ) |>
    generate_predictor(
      time_window = qids(2016, 2),
      stays_2016_2 = mean(stays, na.rm = TRUE)
    ) |>
    generate_predictor(
      time_window = qids(2016, 3),
      stays_2016_3 = mean(stays, na.rm = TRUE)
    ) |>
    generate_predictor(
      time_window = qids(2016, 4),
      stays_2016_4 = mean(stays, na.rm = TRUE)
    ) |>

    # # pop
    generate_predictor(
      time_window = yids(1999:2000),
      pop_1999_2000 = mean(pop, na.rm = TRUE)
    ) |>
    generate_predictor(
      time_window = yids(2001:2002),
      pop_2001_2002 = mean(pop, na.rm = TRUE)
    ) |>
    generate_predictor(
      time_window = yids(2003:2004),
      pop_2003_2004 = mean(pop, na.rm = TRUE)
    ) |>
    generate_predictor(
      time_window = yids(2005:2006),
      pop_2005_2006 = mean(pop, na.rm = TRUE)
    ) |>
    generate_predictor(
      time_window = yids(2007:2008),
      pop_2007_2008 = mean(pop, na.rm = TRUE)
    ) |>
    generate_predictor(
      time_window = yids(2009:2010),
      pop_2009_2010 = mean(pop, na.rm = TRUE)
    ) |>
    generate_predictor(
      time_window = yids(2011:2012),
      pop_2011_2012 = mean(pop, na.rm = TRUE)
    ) |>
    generate_predictor(
      time_window = yids(2013:2014),
      pop_2013_2014 = mean(pop, na.rm = TRUE)
    ) |>
    generate_predictor(
      time_window = yids(2015:2016),
      pop_2015_2016 = mean(pop, na.rm = TRUE)
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

    generate_weights(
      optimization_window = yids(1998:2017),
      margin_ipop = .02, sigf_ipop = 7, bound_ipop = 6
    ) |>
    generate_control()
}
