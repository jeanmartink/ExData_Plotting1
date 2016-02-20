# Read the data
data <- read.csv("household_power_consumption.txt", 
                 header = TRUE, sep = ";", stringsAsFactors = F)

# subset the data for the desired dates
data <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")

# check if there are missing values
data[!complete.cases(data),]

# convert to numeric
data$Global_active_power <- as.numeric(data$Global_active_power)

# plot the histogram
hist(data$Global_active_power, xlab = "Global Active Power (kilowatts)",
     main = "Global Active Power", col = "red")
dev.copy(png, file = "plot1.png")
dev.off()