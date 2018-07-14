#The following function will plot the PLOT 2

plot2 <- function(datafile) {
    #Read the data 
    data <- read.table(datafile, sep = ";", header = TRUE,na.strings = "?", colClasses = c(rep("character", 2), rep("numeric", 7)))
    data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
    
    # Subset the part needed
    subdata <- subset(data, data$Date == "2007-02-01" | data$Date == "2007-02-02")
    subdata <- within(subdata, { timestamp=as.POSIXct(paste(subdata$Date, subdata$Time), format = "%Y-%m-%d %H:%M:%S") })
    
	png(filename = "plot2.png")
    
    plot(subdata$timestamp, subdata$Global_active_power, type = "l", xlab="", ylab="Global Active Power (kilowatts)")
            
    dev.off()
    
}
plot2('household_power_consumption.txt')
