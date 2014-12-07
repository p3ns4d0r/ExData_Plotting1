# Exploratory data analysys - week1 - plot4

library(lubridate)


# Load the data
data <- read.csv("household_power_consumption.txt", sep=";", na.strings="?")
data$datetime <- dmy_hms(paste(data$Date, data$Time))

# Filter data
filtered.data <- data[year(data$datetime) == 2007 &
                          month(data$datetime) == 2 &
                          day(data$datetime) %in% c(1,2), ]

# PNG device
png(filename = "plot4.png",
    width = 480, height = 480, units = "px")

# Plot 4
par(mfrow = c(2,2))
with(filtered.data, plot(x = datetime, 
                         y = Global_active_power, 
                         type = "l",
                         xlab = "",
                         ylab = "Global Active Power"))
with(filtered.data, plot(x = datetime,
                         y = Voltage,
                         type = "l",
                         xlab = "datetime"))
with(filtered.data, plot(x = datetime, 
                         y = Sub_metering_1, 
                         type = "l",
                         xlab = "",
                         ylab = "Energy sub metering"))
with(filtered.data, lines(x = datetime, 
                          y = Sub_metering_2, 
                          col = "red"))
with(filtered.data, lines(x = datetime, 
                          y = Sub_metering_3, 
                          col = "blue"))
legend(x = "topright", 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty = 1, 
       col = c("black", "blue", "red"))

with(filtered.data, plot(x = datetime,
                         y = Global_reactive_power,
                         type = "l"))

dev.off()

