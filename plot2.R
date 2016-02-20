# Read the data
data <- read.csv("household_power_consumption.txt", 
                 header = TRUE, sep = ";", stringsAsFactors = F)

# subset the data for the desired dates
data <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")

# check if there are missing values
data[!complete.cases(data),]

# convert to numeric
data$Global_active_power <- as.numeric(data$Global_active_power)

# combine date and time and convert
data$date_time <- paste(data$Date, data$Time, " ")
data$date_time <- strptime(data$date_time, "%d/%m/%Y %H:%M:%S")

# plot
plot(data$date_time,data$Global_active_powe,type="l",col="black", 
     ylab = "Global Active Power (kilowatts)", xlab="")

dev.copy(png, file = "plot2.png")
dev.off()