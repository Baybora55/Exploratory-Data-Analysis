#The following function will plot the PLOT 4
plot4 <- function(datafile) {
    #Read data from the file 
    data <- read.table(datafile, sep = ";", header = TRUE,na.strings = "?", colClasses = c(rep("character", 2), rep("numeric", 7)))
    data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
    
    subdata <- subset(data, data$Date == "2007-02-01" | data$Date == "2007-02-02")
    
    subdata <- within(subdata, { datetime=as.POSIXct(paste(subdata$Date, subdata$Time), format = "%Y-%m-%d %H:%M:%S") })
    
    
    png(filename = "plot4.png")
    
    # Create 4 spaces for the plots with margins
	par(mfrow=c(2,2), mar = c(4,4,4,4))
    
    # First
    plot(subdata$datetime, subdata$Global_active_power, type = "l", xlab="", ylab="Global Active Power")
    
    #  Second
    with(subdata, plot(datetime, Voltage, type = "l", xlab = "datetime"))
    
    #   Third
    with(subdata, plot(datetime, Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering"))
    with(subdata, lines(datetime, Sub_metering_1))
    with(subdata, lines(datetime, Sub_metering_2, col = "red"))
    with(subdata, lines(datetime, Sub_metering_3, col = "blue"))
    legend("topright", lty = 1, col = c("black", "red", "blue"),legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty = "n")
    
    #   Fourth
    with(subdata, plot(datetime, Global_reactive_power, type = "l"))
    
    dev.off()
}
plot4('household_power_consumption.txt')
