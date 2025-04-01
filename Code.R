# Set working directory
setwd("/Users/nataliamazzitelli/ExData_Plotting1")

# Load dataset
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", stringsAsFactors = FALSE)

# Convert Date and Time columns to Date/Time format
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data$DateTime <- strptime(paste(data$Date, data$Time), format = "%Y-%m-%d %H:%M:%S")

# Subset data for the dates 2007-02-01 and 2007-02-02
data <- subset(data, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))

# Plot 1: Global Active Power Histogram
png("plot1.png", width = 480, height = 480)
hist(data$Global_active_power, col = "red", main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", ylab = "Frequency")
dev.off()

# Plot 2: Global Active Power Time Series
png("plot2.png", width = 480, height = 480)
plot(data$DateTime, data$Global_active_power, type = "l", 
     xlab = "DateTime", ylab = "Global Active Power (kilowatts)",
     main = "Global Active Power over Time")
dev.off()

# Plot 3: Sub Metering Time Series
png("plot3.png", width = 480, height = 480)
plot(data$DateTime, data$Sub_metering_1, type = "l", col = "black", 
     xlab = "DateTime", ylab = "Energy Sub Metering", main = "Energy Sub Metering")
lines(data$DateTime, data$Sub_metering_2, col = "red")
lines(data$DateTime, data$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"), lty = 1, cex = 0.8)
dev.off()

# Plot 4: Global Reactive Power Time Series
png("plot4.png", width = 480, height = 480)
plot(data$DateTime, data$Global_reactive_power, type = "l", 
     xlab = "DateTime", ylab = "Global Reactive Power (kilowatts)",
     main = "Global Reactive Power over Time")
dev.off()


