devtools::document()      # Re-docummenting the function (updating)

test_that("Output is a tibble", {
  expect_true(inherits(result, "tbl_df"))
})    # testing the package again

