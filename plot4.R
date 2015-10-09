plot4 <- function() {
    print("Reading data, please wait...")
    data <- read.csv2("household_power_consumption.txt", stringsAsFactors = FALSE)
    data$Date <- as.Date(data$Date, "%d/%m/%Y")
    
    chunk <- data[data$Date == as.Date("2007-02-01") | data$Date == as.Date("2007-02-02"), ]
    
    chunk$FullTime <- strptime(paste(chunk$Date, chunk$Time), "%Y-%m-%d %H:%M:%S")
    
    chunk$Global_active_power <- as.numeric(chunk$Global_active_power)
    chunk$Global_reactive_power <- as.numeric(chunk$Global_reactive_power)
    chunk$Voltage <- as.numeric(chunk$Voltage)
    chunk$Sub_metering_1 <- as.numeric(chunk$Sub_metering_1)
    chunk$Sub_metering_2 <- as.numeric(chunk$Sub_metering_2)
    chunk$Sub_metering_3 <- as.numeric(chunk$Sub_metering_3)
    
    png(file = "plot4.png", width = 480, height = 480)
    op <- par(mfrow = c(2, 2))
    
    with(chunk, plot(FullTime,
                     Global_active_power,
                     col = "black",
                     type = "l",
                     xlab = "",
                     ylab = "Global Active Power"))
    
    with(chunk, plot(FullTime,
                     Voltage,
                     col = "black",
                     type = "l",
                     xlab = "datetime",
                     ylab = "Voltage"))
    
    with(chunk, plot(FullTime,
                     Sub_metering_1,
                     col = "black",
                     type = "l",
                     xlab = "",
                     ylab = "Energy sub metering"))
    with(chunk, lines(FullTime,
                      Sub_metering_2,
                      col = "red"))
    with(chunk, lines(FullTime,
                      Sub_metering_3,
                      col = "blue"))
    legend("topright", 
           lty = 1,
           col = c("black", "red", "blue"), 
           legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
           bty = "n")
    
    with(chunk, plot(FullTime,
                     Global_reactive_power,
                     col = "black",
                     type = "l",
                     xlab = "datetime",
                     ylab = "Global_reactive_power"))
    
    par(op)
    dev.off()
    
    print("Plot 4 created")
}