file.url<-'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip'
download.file(file.url,destfile='power_consumption.zip')
unzip('power_consumption.zip',overwrite=TRUE)

library(dplyr)
library(lubridate)


# The following function will plot the PLOT 1

plot1 <- function(datafile) {
    # Read the data
    data <- read.table(datafile, sep = ";", header = TRUE, na.strings = "?",colClasses = c(rep("character", 2), rep("numeric", 7)))
    
    data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
    
    subdata <- subset(data, data$Date == "2007-02-01" | data$Date == "2007-02-02")
    
    png(filename = "plot1.png")
        
    hist(subdata$Global_active_power, col = "red", main = "Global Active Power",xlab = "Global Active Power (kilowatts)")
            
    dev.off()

}

plot1('household_power_consumption.txt')
