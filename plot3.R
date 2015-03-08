# Read data
dataFile <- ".Data/household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", nrows=2075259, stringsAsFactors=FALSE, dec=".")
# Subset the data
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
# Convert variables
Datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
SubMetering1 <- as.numeric(subSetData$Sub_metering_1)
SubMetering2 <- as.numeric(subSetData$Sub_metering_2)
SubMetering3 <- as.numeric(subSetData$Sub_metering_3)
# Draw a new plot
plot(Datetime, Submetering1, type="l", xlab="", ylab="Energy Sub metering")
lines(Datetime, Submetering2, col="Red")
lines(Datetime, Submetering3, col="Blue")
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=3, 
legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
png("plot3.png", width=480, height=480)
dev.off()
