## plot4.R

## Download the data file
## Set the Current Directory

## Common Routine used by all the plots
library(sqldf)
data <- read.csv.sql("household_power_consumption.txt", sql = "select * from file where Date IN( '1/2/2007', '2/2/2007' ) ",  header = TRUE, sep = ";")
data$DateTime <- strptime(paste(data$Date, data$Time, sep=' '), format="%d/%m/%Y %H:%M:%S")

## Plot 4
xrange <- range(data$DateTime) 
png("plot4.png", width=480, height=480)
par( mfrow = c( 2, 2 ), oma = c( 0, 0, 0, 0 ), cex=.64)

## Graph 1
yrange <- range(data$Global_active_power) 
plot(xrange, yrange, type="n", xlab="datetime", ylab="Global Active Power (kilowatts)")
lines(data$DateTime, data$Global_active_power)

## Graph 2
yrange <- range(data$Voltage) 
plot(xrange, yrange, type="n", xlab="datetime", ylab="Voltage")
lines(data$DateTime, data$Voltage)

## Graph 3
yrange <- range(data$Sub_metering_1) 
plot(xrange, yrange, type="n", xlab="datetime", ylab="Energy sub metering")
lines(data$DateTime, data$Sub_metering_1, col="black")
lines(data$DateTime, data$Sub_metering_2, col="red")
lines(data$DateTime, data$Sub_metering_3, col="blue")
legend("topright",                       # x-y coordinates for location of the legend  
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),      # Legend labels  
       col=c("black", "red", "blue"),   # Color of points or lines  
       lty=c(1,1,1),                    # Line type  
       lwd=c(1,1,1)                    # Line width  
	   )

## Graph 4
yrange <- range(data$Global_reactive_power) 
plot(xrange, yrange, type="n", xlab="datetime", ylab="Global Reactive Power")
lines(data$DateTime, data$Global_reactive_power)

dev.off()
