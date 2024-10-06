Exercise 3 - Submission Comments
Student: Wynston Toby
Course: STAT1378 - Assignment 2
Exercise: Exercise 3
Repository Link: GitHub Repository

This submission includes the creation of an R package called MultiServerPackage which implements the Multiserver function. The function is designed to simulate how customers will go through a first come, first serve queuing system as long as
“fate” has already decided when each customer will arrive and their service times.


Files to Review
1. Multiserver Function
Location: R/Multiserver.R
Comments:
The function has been rewritten to use tibble() instead of data.frame().

2. Documentation (Roxygen)
Location: R/Multiserver.R and man/Multiserver.Rd
Comments:
roxygen2 comments are used to generate the documentation.
The generated .Rd file for the Multiserver function can be found in man/.

3. Data (bank)
Location: data/bank.rda
Comments:
A sample bank dataset is included in the package for testing the function.
The data has been correctly formatted and saved using usethis::use_data().


Testing
The package has been tested using the following commands:

Installation:
devtools::install_github("Wynston-Toby/MultiServerPackage/MultiserverPackage")

Load the package:
library(MultiServerPackage)

Run an example:
result <- Multiserver(c(1, 2, 3), c(4, 5, 6), NumServers = 2)
print(result)

