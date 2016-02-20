# Read the data
data <- read.csv("household_power_consumption.txt", 
                 header = TRUE, sep = ";", stringsAsFactors = F)

# subset the data for the desired dates
data <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")

# check if there are missing values
data[!complete.cases(data),]

# combine date and time and convert
data$date_time <- paste(data$Date, data$Time, " ")
data$date_time <- strptime(data$date_time, "%d/%m/%Y %H:%M:%S")

# convert to numeric
data$Sub_metering_1 <- as.numeric(actualdata$Sub_metering_1)
data$Sub_metering_2 <- as.numeric(actualdata$Sub_metering_2)
data$Sub_metering_3 <- as.numeric(actualdata$Sub_metering_3)

# plot
plot(data$date_time,data$Sub_metering_1,type="l", xlab = "",
     ylab = "Energy sub metering", col = "black")
points(data$date_time,data$Sub_metering_2,type="l", col = "red")
points(data$date_time,data$Sub_metering_3,type="l", col = "blue")
legend("topright",
       legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"),
       lty = 1, col = c("black", "red", "blue"))

dev.copy(png, file = "plot3.png")
dev.off()