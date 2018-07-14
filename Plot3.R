
#The following function will plot the PLOT 2

plot3 <- function(datafile) {
  # Read the data
  data <- read.table(datafile, sep = ";", header = TRUE,na.strings = "?", colClasses = c(rep("character", 2), rep("numeric", 7)))
  
  data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
    
  subdata <- subset(data, data$Date == "2007-02-01" | data$Date == "2007-02-02")
  
  subdata <- within(subdata, { timestamp=as.POSIXct(paste(subdata$Date, subdata$Time), format = "%Y-%m-%d %H:%M:%S") })
  
  png(filename = "plot3.png")
  
  with(subdata, plot(timestamp, Sub_metering_1, type = "n", xlab = "", ylab = "Energy Sub Metering"))
  
  with(subdata, lines(timestamp, Sub_metering_1))
    
  with(subdata, lines(timestamp, Sub_metering_2, col = "red"))
  with(subdata, lines(timestamp, Sub_metering_3, col = "blue"))
  
  legend("topright", lty = 1, col = c("black", "red", "blue"),legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  
  dev.off() 
  
}
plot3('household_power_consumption.txt')

