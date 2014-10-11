## plot1.R

## Download the data file
## Set the Current Directory

## Common Routine used by all the plots
library(sqldf)
data <- read.csv.sql("household_power_consumption.txt", sql = "select * from file where Date IN( '1/2/2007', '2/2/2007' ) ",  header = TRUE, sep = ";")
data$DateTime <- strptime(paste(data$Date, data$Time, sep=' '), format="%d/%m/%Y %H:%M:%S")

## Plot 1
png("plot1.png", width=480, height=480)
hist(data$Global_active_power, xlab="Global Active Power (kilowatts)", main="Global Active Power", col="red")
dev.off()
