# Read data
dataFile <- "C:/Users/Andrea/Desktop/Data/household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", nrows=2075259, stringsAsFactors=FALSE, dec=".")
# Subset the data
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
# Convert variables
Datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
GlobalActivePower <- as.numeric(subSetData$Global_active_power)
GlobalReactivePower <- as.numeric(subSetData$Global_reactive_power)
Voltage <- as.numeric(subSetData$Voltage)
SubMetering1 <- as.numeric(subSetData$Sub_metering_1)
SubMetering2 <- as.numeric(subSetData$Sub_metering_2)
SubMetering3 <- as.numeric(subSetData$Sub_metering_3)
# Draw a new plot
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
plot(Datetime, GlobalActivePower, type="l",  xlab="", ylab="Global Active Power (kilowatts)")
plot(Datetime, Voltage, type="l", xlab="", ylab="voltage (volt)")
plot(Datetime, SubMetering1, type="l", xlab="", ylab="Energy Sub metering")
lines(Datetime, SubMetering2, col="Red")
lines(Datetime, SubMetering3, col="Blue")
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=3, bty="n", 
legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
plot(Datetime, GlobalReactivePower, type="l", xlab="", ylab="Global Rective Power (kilowatts)")
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()