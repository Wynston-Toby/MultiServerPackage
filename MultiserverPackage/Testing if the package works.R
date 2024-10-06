# A NOTE TO ME: make sure you run the following code if you made changes
devtools::document("C:/Users/Wynston/Documents/stat1378-assignment2-Wynston-Toby/MultiserverPackage")


# testing if the package works (for marker)
library(usethis)
library(devtools)
library(roxygen2)

devtools::install_github("Wynston-Toby/MultiServerPackage")



# Load your package
library(MultiServerPackage)


# Check documentation
?Multiserver


# Test the Multiserver function
arrivals <- c(103, 299, 516, 652, 777)
service_times <- c(10, 20, 15, 25, 30)
result <- Multiserver(arrivals, service_times, NumServers = 3)
print(result)
