setwd("C:\\Users\\bauble\\Documents\\ExData_Plotting1")

epc <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)

x <- paste(epc$Date, epc$Time)

epc$DateTime <- strptime(x, "%d/%m/%Y %H:%M:%S")

str(epc) # Check the field types

epc$Global_active_power <- as.numeric(epc$Global_active_power)

#epc2 <- subset(epc, DateTime > "2007-02-01" & DateTime < "2007-02-03")  # This loses one of the observations, likely because the time is bad
epc2 <- subset(epc, Date == "1/2/2007" | Date == "2/2/2007")

hist(epc2$Global_active_power, col="red", xlab = "Global Active Power (kilowatts)", 
     main = "Global Active Power") 

dev.copy(png, file="plot1.png", width=480, height=480)
dev.off()

