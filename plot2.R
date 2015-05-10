epc <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)

x <- paste(epc$Date, epc$Time)

epc$DateTime <- strptime(x, "%d/%m/%Y %H:%M:%S")

epc$Global_active_power <- as.numeric(epc$Global_active_power)

epc2 <- subset(epc, Date == "1/2/2007" | Date == "2/2/2007")

plot(epc2$DateTime, epc2$Global_active_power, type="l", ylab = "Global Active Power (kilowatts)", xlab="")

dev.copy(png, file="plot2.png", width=480, height=480)
dev.off()