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

# Create the PNG file
png(filename = "plot1.png", width = 480, height = 480)

# Create a histogram
plot1 <- hist(as.numeric(dataset$Global_active_power), col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

dev.off()
