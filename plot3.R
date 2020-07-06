rdata <- read.table("household_power_consumption.txt", 
                    na.strings = "?", sep = ";", header = T)
data <- subset(rdata, Date == "1/2/2007" | Date == "2/2/2007")

datetime <- strptime(paste(data$Date,data$Time), 
                     format = "%d/%m/%Y %H:%M:%S")
png(filename = "plot3.png")
par(mfrow = c(1,1))
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
dev.off()
