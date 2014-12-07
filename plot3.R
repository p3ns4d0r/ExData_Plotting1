# Exploratory data analysys - week1 - plot3

library(lubridate)


# Load the data
data <- read.csv("household_power_consumption.txt", sep=";", na.strings="?")
data$datetime <- dmy_hms(paste(data$Date, data$Time))

# Filter data
filtered.data <- data[year(data$datetime) == 2007 &
                          month(data$datetime) == 2 &
                          day(data$datetime) %in% c(1,2), ]

# PNG device
png(filename = "plot3.png",
    width = 480, height = 480, units = "px")

# Plot 3
plot(x = filtered.data$datetime, 
     y = filtered.data$Sub_metering_1, 
     type = "l",
     xlab = "",
     ylab = "Energy sub metering")
lines(x = filtered.data$datetime, 
      y = filtered.data$Sub_metering_2, 
      col = "red")
lines(x = filtered.data$datetime, 
      y = filtered.data$Sub_metering_3, 
      col = "blue")
legend(x = "topright", 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty = 1, 
       col = c("black", "blue", "red"))

dev.off()
