#' Bank Customers' Arrival and Service Times
#'
#' This dataset contains simulated data on 100 customers, their arrival times, and their service times in a
#' first-come, first-served queuing system.
#'
#' @format A tibble with 100 rows and 2 variables:
#' \describe{
#'   \item{arrival_time}{Customer arrival time, in seconds (since the start).}
#'   \item{service_time}{Service time for each customer, in seconds.}
#' }
#' @source Simulated data generated using a Poisson process.
#' @examples
#' head(bank)
#' @export

# To generate the dataset
set.seed(2048)
arrival_time <- cumsum(rexp(100, 1/60))
service_time <- rexp(length(arrival_time), 1/150) + 20
bank <- data.frame(arrival_time, service_time)

# Save as .rda
save(bank, file = "data/bank.rda")
