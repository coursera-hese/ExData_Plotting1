## Estimate memory requirement
# data-set rows:    2075259
# data-set columns:       9
# cell estimated:         8 bytes
print(paste("estimated memory size:", round(2075259 * 9 * 8 / 1024 / 1024), "MB"))

# Getting data
f <- "household_power_consumption.zip"
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile = f)
unzip(f)
df <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

# Processing data
library(dplyr)
df <- df %>% 
    mutate(datetime = as.POSIXct( strptime( paste(Date, Time), format = "%d/%m/%Y %H:%M:%S") ) ) %>% 
    filter(datetime >= as.Date("2007-02-01") & datetime < as.Date("2007-02-03"))
