# Package
library(dplyr)

# Read data
dataset <- "household_power_consumption.txt"
dataset <- read.csv(dataset, sep = ";")

# See the variable's name and first lines
names(dataset)
head(dataset)

# Filter data from the dates 2007-02-01 and 2007-02-02 
dataset <- dataset %>%
        mutate(Date = as.Date(Date, "%d/%m/%Y")) %>%
        filter(Date >= as.Date("2007/02/01") & Date <= as.Date("2007/02/02"))

# Put the date in English
Sys.setlocale("LC_TIME","English")

# Convert the data in POSIXct format
dataset$Date <- as.POSIXct(paste(dataset$Date, dataset$Time))

# Create the PNG file
png(filename = "plot3.png", width = 480, height = 480, res = NA)

# Create the graph
plot3 <- plot(dataset$Date, dataset$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "")
points(dataset$Date, dataset$Sub_metering_2, type = "l", col = "red")
points(dataset$Date, dataset$Sub_metering_3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lty=c(1,1,1), col= c(1,2,20))

dev.off()