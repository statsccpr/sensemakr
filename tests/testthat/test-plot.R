context("Checking plots")

test_that("Testing plots", {
  rm(list = ls())

  # library
  library(sensemakr)

  # loads data
  data("darfur")

  # fits model
  model  <- lm(peacefactor ~ directlyharmed + age + farmer_dar + herder_dar +
                 pastvoted + hhsize_darfur + female + village, data = darfur)

  # benchmark variables
  X = c("herder_dar", "female", "age", "pastvoted", "farmer_dar")

  # runs benchmarking etc
  sense <- sensemakr(model=model, treatment="directlyharmed", benchmarks=X)

  # plots

  ## contour plot
  plot1_data <- plot(sense)
  plot(sense, lim=.2)
  plot2_data <- plot(sense, contour = "t-value")
  plot3_data <- plot(sense, contour = "lower bound")
  plot4_data <- plot(sense, contour = "upper bound")
  ## worst-case plot
  plot5_data <- plot(sense, type = "worst-case")
})
