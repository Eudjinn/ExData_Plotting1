plot2 <- function() {
    print("Reading data, please wait...")
    data <- read.csv2("household_power_consumption.txt", stringsAsFactors = FALSE)
    data$Date <- as.Date(data$Date, "%d/%m/%Y")
    
    chunk <- data[data$Date == as.Date("2007-02-01") | data$Date == as.Date("2007-02-02"), ]
    
    chunk$Global_active_power <- as.numeric(chunk$Global_active_power)
    chunk$FullTime <- strptime(paste(chunk$Date, chunk$Time), "%Y-%m-%d %H:%M:%S")
    
    png(file = "plot2.png", width = 480, height = 480)
    op <- par(mfrow = c(1, 1))
    
    with(chunk, plot(FullTime,
                     Global_active_power,
                     col = "black",
                     type = "l",
                     xlab = "",
                     ylab = "Global Active Power (kilowatts)"))
    
    par(op)
    dev.off()
    
    print("Plot 2 created")
}