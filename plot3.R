plot3 <- function() {
    library(dplyr)

    ## Read in data and name columns    
    data <- read.table("household_power_consumption.txt", header = T, sep = ";", skip = 66636, nrows = 2880)
    colnames(data) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

    ## Get Date and Time into POSIXct
    data$Date <- as.Date(data$Date, "%d/%m/%Y")
    data <- transform(data, fulldate = paste(Date, Time, sep = " "))
    data$fulldate <- as.POSIXct(as.character(data$fulldate))
    
    
    ## Create device    
    png(file = "plot3.png", width = 480, height = 480)

    ## Create plot
    plot(data3$fulldate, data3$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
    par(new = T)
    plot(data3$fulldate, data3$Sub_metering_2, type = "l", col = "red", xlab = "", ylab = "", ylim = c(0, 40), yaxt = "n")
    par(new = T)
    plot(data3$fulldate, data3$Sub_metering_3, type = "l", col = "blue", xlab = "", ylab = "", ylim = c(0, 40), yaxt = "n")
    
    ## Add legend
    legend("topright", lty=c(1,1,1), col = c("black", "red", "blue"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    
    ## Close device
    dev.off()
   
}
