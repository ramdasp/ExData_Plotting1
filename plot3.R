## plot3.R

## Download the data file
## Set the Current Directory

## Common Routine used by all the plots
library(sqldf)
data <- read.csv.sql("household_power_consumption.txt", sql = "select * from file where Date IN( '1/2/2007', '2/2/2007' ) ",  header = TRUE, sep = ";")
data$DateTime <- strptime(paste(data$Date, data$Time, sep=' '), format="%d/%m/%Y %H:%M:%S")

## Plot 3
xrange <- range(data$DateTime) 
yrange <- range(data$Sub_metering_1) 
png("plot3.png", width=480, height=480)
plot(xrange, yrange, type="n", xlab="datetime", ylab="Energy sub metering")
lines(data$DateTime, data$Sub_metering_1, col="black")
lines(data$DateTime, data$Sub_metering_2, col="red")
lines(data$DateTime, data$Sub_metering_3, col="blue")
legend("topright",                       # x-y coordinates for location of the legend  
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),      # Legend labels  
       col=c("black", "red", "blue"),   # Color of points or lines  
       lty=c(1,1,1),                    # Line type  
       lwd=c(1,1,1)                     # Line width  
)
dev.off()
