library(testthat)

test_that("Multiserver works with 1 server", {
  arrival_time <- cumsum(rexp(10, 1/60))
  service_time <- rexp(10, 1/150) + 20

  result <- Multiserver(arrival_time, service_time, NumServers = 1)

  expect_equal(ncol(result), 4)  # Check if the result has 4 columns
  expect_equal(nrow(result), length(arrival_time))  # Check if the number of rows matches the input
})

test_that("Multiserver works with multiple servers", {
  arrival_time <- cumsum(rexp(10, 1/60))
  service_time <- rexp(10, 1/150) + 20

  result <- Multiserver(arrival_time, service_time, NumServers = 3)

  expect_equal(ncol(result), 4)  # Check if the result has 4 columns
  expect_true(all(result$ChosenServer <= 3))  # Check if no server index exceeds the number of servers
})



