## plot2.R

## Download the data file
## Set the Current Directory

## Common Routine used by all the plots
library(sqldf)
data <- read.csv.sql("household_power_consumption.txt", sql = "select * from file where Date IN( '1/2/2007', '2/2/2007' ) ",  header = TRUE, sep = ";")
data$DateTime <- strptime(paste(data$Date, data$Time, sep=' '), format="%d/%m/%Y %H:%M:%S")

## Plot 2
xrange <- range(data$DateTime) 
yrange <- range(data$Global_active_power) 
png("plot2.png", width=480, height=480)
plot(xrange, yrange, type="n", xlab="datetime", ylab="Global Active Power (kilowatts)")
lines(data$DateTime, data$Global_active_power)
dev.off()

