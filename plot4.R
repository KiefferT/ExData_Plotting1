plot4 <- function() {
    library(dplyr)

    ## Read in data and name columns    
    data <- read.table("household_power_consumption.txt", header = T, sep = ";", skip = 66636, nrows = 2880)
    colnames(data) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

    ## Get Date and Time into POSIXct
    data$Date <- as.Date(data$Date, "%d/%m/%Y")
    data <- transform(data, fulldate = paste(Date, Time, sep = " "))
    data$fulldate <- as.POSIXct(as.character(data$fulldate))
    
    
    ## Create device    
    png(file = "plot4.png", width = 480, height = 480)

    ## Specify 4 plots with mfrow
    par(mfrow = c(2,2))
    
    ## Plot 1
    plot(data$fulldate, data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
    
    ## Plot 2
    plot(data$fulldate, data$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
    
    ## Plot 3
    plot(data$fulldate, data$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
    par(new = T)
    plot(data$fulldate, data$Sub_metering_2, type = "l", col = "red", xlab = "", ylab = "", ylim = c(0, 40), yaxt = "n")
    par(new = T)
    plot(data$fulldate, data$Sub_metering_3, type = "l", col = "blue", xlab = "", ylab = "", ylim = c(0, 40), yaxt = "n")
    legend("topright", lty=c(1,1,1), col = c("black", "red", "blue"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    
    ##Plot4
    plot(data$fulldate, data$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
    
    ## Close device
    dev.off()
}
