#
#
#
household_power_consumption <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = c("?"))
#
#
#
mydata <- subset(household_power_consumption, Date == "1/2/2007" | Date == "2/2/2007")
#
#
#
mydata$DateTime <- as.POSIXct(paste(mydata$Date, mydata$Time), format="%d/%m/%Y %H:%M:%S")
# 
# plot 4
#
png("plot4.png")
par(mfrow=c(2,2))
plot(mydata$DateTime, mydata$Global_active_power, type = "n", ylab = "Global Active Power (kilowatts)", xlab = "")
lines(mydata$DateTime, mydata$Global_active_power)
plot(mydata$DateTime, mydata$Voltage, type = "n", ylab = "Voltage", xlab = "")
lines(mydata$DateTime, mydata$Voltage)
plot(mydata$DateTime, mydata$Sub_metering_1, type = "n", ylab = "Energy Sub Metering", xlab = "")
lines(mydata$DateTime, mydata$Sub_metering_1)
lines(mydata$DateTime, mydata$Sub_metering_2, col = "red")
lines(mydata$DateTime, mydata$Sub_metering_3, col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1, 1, 1), col = c("black", "red", "blue"))
plot(mydata$DateTime, mydata$Global_reactive_power, type = "n", xlab = "", ylab = "Global_reactive_power")
lines(mydata$DateTime, mydata$Global_reactive_power)
dev.off()