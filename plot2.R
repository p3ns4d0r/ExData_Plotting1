# Exploratory data analysys - week1 - plot2

library(lubridate)


# Load the data
data <- read.csv("household_power_consumption.txt", sep=";", na.strings="?")
data$datetime <- dmy_hms(paste(data$Date, data$Time))

# Filter data
filtered.data <- data[year(data$datetime) == 2007 &
                          month(data$datetime) == 2 &
                          day(data$datetime) %in% c(1,2), ]

# PNG device
png(filename = "plot2.png",
    width = 480, height = 480, units = "px")

# Plot 2
plot(x = filtered.data$datetime, 
     y = filtered.data$Global_active_power, 
     type = "l",
     xlab = "",
     ylab = "Global Active Power (kilowatts)")

dev.off()


