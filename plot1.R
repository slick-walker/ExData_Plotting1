# Load the data table library.
library(data.table)

# Read in the data from the file.
data <- read.table("./household_power_consumption.txt", 
                   sep = ";", 
                   header = TRUE,
                   na.strings = "?")

# Subset the data just for the first two days of Februrary 2007.
newdata <- subset(data, Date == '1/2/2007' | Date == '2/2/2007')

# Convert the subset to a data table.
febData <- as.data.table(newdata)

# Create a histogram of global active power.
hist(febData$Global_active_power,
     xlab = "Global Active Power (kilowatts)",
     main = "Global Active Power",
     col = "red")

# Create the PNG file.
dev.copy(png, file = "./plot1.png")
dev.off()