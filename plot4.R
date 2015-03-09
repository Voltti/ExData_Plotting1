

data <- read.table(file="household_power_consumption.txt", header = T, sep = ";", as.is = T)[,1]
data <- as.Date(data, "%d/%m/%Y")
selection <- data == as.Date("2007-02-01") | data == as.Date("2007-02-02")

rawdata <- read.table(file="household_power_consumption.txt", header = T, sep = ";", stringsAsFactors=F, na.strings="?")[selection,]
rawdata[,1] <- as.POSIXct(strptime(paste(rawdata[,1], rawdata[,2]), format="%d/%m/%Y %H:%M:%S"))
colnames(rawdata)[1] <- "Date_Time"

par(mfrow = c(2,2))

plot(rawdata$Date_Time, rawdata$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")

plot(rawdata$Date_Time, rawdata$Global_reactive_power, type="l", ylab="Voltage", xlab="datetime")

plot(rawdata$Date_Time, rawdata$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="", col="black")
lines(rawdata$Sub_metering_2, type="l", col="red")
lines(rawdata$Date_Time,rawdata$Sub_metering_2, type="l", col="red")
lines(rawdata$Date_Time,rawdata$Sub_metering_3, type="l", col="blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black","red","blue"), lty="solid", pch=" ", bty="n")

plot(rawdata$Date_Time, rawdata$Global_reactive_power, type="l", ylab="Global_reactive_power", xlab="datetime")


dev.copy(png,"plot4.png", width=504, height=504)
dev.off()