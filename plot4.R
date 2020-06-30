rdata <- read.table("household_power_consumption.txt", 
                    na.strings = "?", sep = ";", header = T)
data <- subset(rdata, Date == "1/2/2007" | Date == "2/2/2007")

png(filename = "plot4.png")

par(mfrow = c(2,2), mar = .1+ c(2,2,3,1))
#plot1
plot(strptime(data$Time, format = "%H:%M:%S"),
     data$Global_active_power, type = "l", xlab = "",
     ylab = "Global Active Power (kilowatts)")

#plot2
plot(strptime(data$Time, format = "%H:%M:%S"),
     data$Voltage, type = "l", xlab = "",
     ylab = "Voltage")

#plot3
plot(strptime(data$Time, format = "%H:%M:%S"),
     data$Sub_metering_1, type = "l", xlab = "",
     ylab = "Energy sub metering")
lines(strptime(data$Time, format = "%H:%M:%S"),
      data$Sub_metering_2, col = "red")
lines(strptime(data$Time, format = "%H:%M:%S"),
      data$Sub_metering_3, col = "blue")
legend("topright", legend = c("sub_metering_1",
                              "sub_metering_2",
                              "sub_metering_3")
       ,pch = "_" ,col = c("black","red","blue"))

#plot4
plot(strptime(data$Time, format = "%H:%M:%S"),
     data$Global_reactive_power, type = "l", xlab = "",
     ylab = "Global rective Power")

dev.off()