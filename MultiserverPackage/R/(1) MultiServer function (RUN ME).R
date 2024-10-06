#' Multiserver Queue Simulation
#'
#' This function simulates a multiserver queuing system for customers arriving
#' at random intervals with varying service times.
#'
#' @param Arrivals A numeric vector indicating the arrival times of customers in seconds.
#' @param ServiceTimes A numeric vector indicating the service times for each customer in seconds.
#' @param NumServers An integer indicating the number of servers (default is 1).
#'
#' @return A tibble containing the arrival times, service begin times,
#'         chosen server, and service end times for each customer.
#' @examples
#' set.seed(123)
#' arrival_time <- cumsum(rexp(10, 1/60))
#' service_time <- rexp(10, 1/150) + 20
#' result <- Multiserver(arrival_time, service_time, NumServers = 2)
#' print(result)
#' @export
library(tibble)


# This output is updated to tibble() not data.frame()
Multiserver <- function(Arrivals, ServiceTimes, NumServers = 1) {
  if (any(Arrivals <= 0 | ServiceTimes <= 0) || NumServers <= 0) {
    stop("Arrivals, ServiceTimes must be positive & NumServers must be positive")
  }
  if (length(Arrivals) != length(ServiceTimes)) {
    stop("Arrivals and ServiceTimes must have the same length")
  }

  NumCust <- length(Arrivals)                # Number of customers
  AvailableFrom <- rep(0, NumServers)        # When each server is available
  ChosenServer <- ServiceBegins <- ServiceEnds <- rep(0, NumCust)  # Initialize vectors

  # Loop over each customer to assign servers and calculate times
  for (i in seq_along(Arrivals)) {
    avail <- min(AvailableFrom)
    ChosenServer[i] <- which.min(AvailableFrom)
    ServiceBegins[i] <- max(avail, Arrivals[i])
    ServiceEnds[i] <- ServiceBegins[i] + ServiceTimes[i]
    AvailableFrom[ChosenServer[i]] <- ServiceEnds[i]
  }

  # Output result as tibble (updated from data.frame)
  out <- tibble(Arrivals, ServiceBegins, ChosenServer, ServiceEnds)
  return(out)
}



# you can use this to try the function
# Example usage:
set.seed(123)
arrival_time <- cumsum(rexp(10, 1/60))
service_time <- rexp(10, 1/150) + 20
result <- Multiserver(arrival_time, service_time, NumServers = 2)

print(result)
