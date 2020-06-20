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
png(filename = "plot2.png", width = 480, height = 480, res = NA)

# Create the graph
plot2 <- plot(dataset$Date, dataset$Global_active_power, type = "l", ylab = "Global Active Power (Kilowatts)", xlab = "")

dev.off()