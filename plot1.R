

data <- read.table(file="household_power_consumption.txt", header = T, sep = ";", as.is = T)[,1]
data <- as.Date(data, "%d/%m/%Y")
selection <- data == as.Date("2007-02-01") | data == as.Date("2007-02-02")

rawdata <- read.table(file="household_power_consumption.txt", header = T, sep = ";", stringsAsFactors=F, na.strings="?")[selection,]
rawdata[,1] <- as.Date(rawdata[,1], "%d/%m/%Y")
## rawdata[,2] <- strptime(rawdata[,2], "%H:%M:%S")

hist(rawdata$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.copy(png,"plot1.png", width=504, height=504)
dev.off()
