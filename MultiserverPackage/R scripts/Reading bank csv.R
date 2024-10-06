bank <- read.csv("bank.csv")
usethis::use_data(bank, overwrite = TRUE)

data("bank")
head(bank)
