epc <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)

x <- paste(epc$Date, epc$Time)

epc$DateTime <- strptime(x, "%d/%m/%Y %H:%M:%S")

epc2 <- subset(epc, Date == "1/2/2007" | Date == "2/2/2007")

epc2$Global_active_power <- as.numeric(epc2$Global_active_power)
epc2$Global_reactive_power <- as.numeric(epc2$Global_reactive_power)
epc2$Global_intensity <- as.numeric(epc2$Global_intensity)
epc2$Voltage <- as.numeric(epc2$Voltage)
epc2$Sub_metering_1 <- as.numeric(epc2$Sub_metering_1)
epc2$Sub_metering_2 <- as.numeric(epc2$Sub_metering_2)
epc2$Sub_metering_3 <- as.numeric(epc2$Sub_metering_3)

plot(epc2$DateTime, epc2$Sub_metering_1, type="l", ylab = "Energy sub metering", xlab="")
lines(epc2$DateTime, epc2$Sub_metering_2, col = "red")
lines(epc2$DateTime, epc2$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lwd = 1, cex=0.75)

dev.copy(png, file="plot4.png", width=480, height=480)
dev.off()