library(usethis)
library(devtools)
library(roxygen2)


document("C:/Users/Wynston/Documents/stat1378-assignment2-Wynston-Toby/MultiserverPackage")
devtools::document()      # Re-docummenting the function (updating)

test_that("Output is a tibble", {
  expect_true(inherits(result, "tbl_df"))
})    # testing the package again

devtools::test()
