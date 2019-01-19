#
# plot3
#

# Getting & processing data
f <- "household_power_consumption.zip"
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile = f)
unzip(f)
df <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

library(dplyr)
# Convert date column
df <- df %>% dplyr::mutate(Date = as.Date(Date, format = "%d/%m/%Y"))
# filter Date for '2007-02-01' and '2007-02-02'
targetDates <- { df$Date %in% c(as.Date("2007-02-01"), as.Date("2007-02-02")) }
df <- df[targetDates,]

#
# Plotting
#

# TODO

dev.copy(png, file = "plot3.png")  ## Copy my plot to a PNG file
dev.off()   ## Don't forget to close the PNG device!
