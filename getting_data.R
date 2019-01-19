## Estimate memory requirement
# data-set rows:    2075259
# data-set columns:       9
# cell estimated:         8 bytes
print(paste("estimated memory size:", round(2075259 * 9 * 8 / 1024 / 1024), "MB"))

## Getting & processing data
f <- "household_power_consumption.zip"
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile = f)
unzip(f)
df <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

# Convert date column
library(dplyr)
df <- df %>% dplyr::mutate(Date = as.Date(Date, format = "%d/%m/%Y"))
# filter data-set for 2007-02-01 and 2007-02-02
targetDates <- { df$Date %in% c(as.Date("2007-02-01"), as.Date("2007-02-02")) }
df <- df[targetDates,]
