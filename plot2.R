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
# plot 2
#
png("plot2.png")
plot(mydata$DateTime, mydata$Global_active_power, type = "n", ylab = "Global Active Power (kilowatts)", xlab = "")
lines(mydata$DateTime, mydata$Global_active_power)
dev.off()
