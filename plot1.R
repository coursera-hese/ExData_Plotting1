#
# plot1
#

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

#
# Plotting
#
png("plot1.png")  ## Instead of `dev.copy`

hist(df$Global_active_power, 
     col = "red",
     xlab = "Global Active Power (kilowatts)", 
     main = "Global Active Power")

#dev.copy(png, file = "plot1.png")  ## Copy my plot to a PNG file
dev.off()   ## Don't forget to close the PNG device!
