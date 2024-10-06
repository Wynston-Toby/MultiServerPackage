#' Multiserver
#' @title Multiserver Function
#' @description A function to simulate a multiserver queue system.
#' @param Arrivals A numeric vector of arrival times.
#' @param ServiceTimes A numeric vector of service times.
#' @param NumServers An integer for the number of servers (default is 1).
#' @return A tibble containing arrival times, service start times, chosen server, and service end times.
#' @export
Multiserver <- function(Arrivals, ServiceTimes, NumServers = 1) {
  if (any(Arrivals <= 0 | ServiceTimes <= 0) || NumServers <= 0) {
    stop("Arrivals, ServiceTimes must be positive & NumServers must be positive")
  }
  if (length(Arrivals) != length(ServiceTimes)) {
    stop("Arrivals and ServiceTimes must have the same length")
  }

  NumCust <- length(Arrivals)
  AvailableFrom <- rep(0, NumServers)
  ChosenServer <- ServiceBegins <- ServiceEnds <- rep(0, NumCust)

  for (i in seq_along(Arrivals)) {
    avail <- min(AvailableFrom)
    ChosenServer[i] <- which.min(AvailableFrom)
    ServiceBegins[i] <- max(avail, Arrivals[i])
    ServiceEnds[i] <- ServiceBegins[i] + ServiceTimes[i]
    AvailableFrom[ChosenServer[i]] <- ServiceEnds[i]
  }

  out <- tibble::tibble(Arrivals, ServiceBegins, ChosenServer, ServiceEnds)
  return(out)
}
