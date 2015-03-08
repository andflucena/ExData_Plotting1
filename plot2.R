# Read data
dataFile <- "./Data/household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", nrows=2075259, stringsAsFactors=FALSE, dec=".")
# Subset the data
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
# Convert variables
Datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
GlobalActivePower <- as.numeric(subSetData$Global_active_power)
# Draw a new plot 
plot(Datetime, GlobalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()