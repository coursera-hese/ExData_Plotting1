#
# plot4
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
png("plot4.png")  ## Instead of `dev.copy`

par(mfrow = c(2, 2)) # 2 by 2 plotting
with(df, {
    # first plot (upper-left)
    plot(datetime, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")

    
    # second plot (upper-right)
    plot(datetime, Voltage, type = "l")

    # third plot (lower-left)
    plot(datetime, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
    lines(datetime, Sub_metering_2, type = "l", col = "red")
    lines(datetime, Sub_metering_3, type = "l", col = "blue")
    legend("topright", lty = 1, col = c("black", "red", "blue"), legend = names(df[7:9]))
    
    # fourth plot (lower-right)
    plot(datetime, Global_reactive_power, type = "l")
})

## HINT: When copying plots from screen to file with `dev.copy`, it cuts off the legend! 
## Use `png` instead to write plot directly to a file!
dev.off()   ## Don't forget to close the PNG device!
