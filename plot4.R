rdata <- read.table("household_power_consumption.txt", 
                    na.strings = "?", sep = ";", header = T)
data <- subset(rdata, Date == "1/2/2007" | Date == "2/2/2007")

datetime <- strptime(paste(data$Date,data$Time), 
                     format = "%d/%m/%Y %H:%M:%S")
png(filename = "plot4.png")

par(mfrow = c(2,2), mar = .1+ c(2,2,3,1))
#plot1
plot(datetime,
     data$Global_active_power, type = "l", xlab = "",
     ylab = "Global Active Power (kilowatts)")

#plot2
plot(datetime,
     data$Voltage, type = "l", xlab = "",
     ylab = "Voltage")

#plot3
plot(datetime,
     data$Sub_metering_1, type = "l", xlab = "",
     ylab = "Energy sub metering")
lines(datetime,
      data$Sub_metering_2, col = "red")
lines(datetime,
      data$Sub_metering_3, col = "blue")
legend("topright", legend = c("sub_metering_1",
                              "sub_metering_2",
                              "sub_metering_3")
       ,pch = "_" ,col = c("black","red","blue"))

#plot4
plot(datetime,
     data$Global_reactive_power, type = "l", xlab = "",
     ylab = "Global rective Power")

dev.off()