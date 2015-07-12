# Load the data table library.
library(data.table)

# Load the datasets library.
library(datasets)

# Read in the data from the file.
data <- read.table("./household_power_consumption.txt", 
                   sep = ";", 
                   header = TRUE,
                   na.strings = "?")

# Subset the data just for the first two days of Februrary 2007.
newdata <- subset(data, Date == '1/2/2007' | Date == '2/2/2007')

# Convert the subset to a data table.
febData <- as.data.table(newdata)

# Copy the dates and times to character vectors.
s1 <- as.character(febData[[1]])
s2 <- as.character(febData[[2]])
s3 <- paste(s1, s2)

# Create a time vector.
t1 <- strptime(s3, "%d/%m/%Y %H:%M:%S")

# Create the plot.
plot(t1, febData$Global_active_power,
     type = "l",
     xlab = "",
     ylab = "Global Active Power (kilowatts)")

# Create the PNG file.
dev.copy(png, file = "./plot2.png")
dev.off()