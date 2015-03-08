# Read data
dataFile <- "./Data/household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", nrows=2075259, stringsAsFactors=FALSE, dec=".")
# Subset the data
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
# Convert variables
GlobalActivePower <- as.numeric(subSetData$Global_active_power)
# Draw a new plot
hist(GlobalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency")
png("plot1.png", width=480, height=480)
dev.off()
