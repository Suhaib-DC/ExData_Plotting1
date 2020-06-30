rdata <- read.table("household_power_consumption.txt", 
                    na.strings = "?", sep = ";", header = T)
data <- subset(rdata, Date == "1/2/2007" | Date == "2/2/2007")

png(filename = "plot3.png")
par(mfrow = c(1,1))
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
dev.off()
