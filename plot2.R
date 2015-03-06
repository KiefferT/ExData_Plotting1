plot2 <- function() {
    library(dplyr)

    ## Read in data and name columns    
    data <- read.table("household_power_consumption.txt", header = T, sep = ";", skip = 66636, nrows = 2880)
    colnames(data) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

    ## Get Date and Time into POSIXct
    data$Date <- as.Date(data$Date, "%d/%m/%Y")
    data <- transform(data, fulldate = paste(Date, Time, sep = " "))
    data$fulldate <- as.POSIXct(as.character(data$fulldate))
    
    
    ## Create device    
    png(file = "plot2.png", width = 480, height = 480)

    ## Create plot
    plot(data$fulldate, data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

    ## Close device
    dev.off()
}
