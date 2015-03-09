
data <- read.table(file="household_power_consumption.txt", header = T, sep = ";", as.is = T)[,1]
data <- as.Date(data, "%d/%m/%Y")
selection <- data == as.Date("2007-02-01") | data == as.Date("2007-02-02")

rawdata <- read.table(file="household_power_consumption.txt", header = T, sep = ";", stringsAsFactors=F, na.strings="?")[selection,]
rawdata[,1] <- as.POSIXct(strptime(paste(rawdata[,1], rawdata[,2]), format="%d/%m/%Y %H:%M:%S"))
colnames(rawdata)[1] <- "Date_Time"

plot(rawdata$Date_Time, rawdata$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")

dev.copy(png,"plot2.png", width=480, height=480)
dev.off()