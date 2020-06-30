rdata <- read.table("household_power_consumption.txt", 
                    na.strings = "?", sep = ";", header = T)
data <- subset(rdata, Date == "1/2/2007" | Date == "2/2/2007")

png(filename = "plot2.png")
plot(strptime(data$Time, format = "%H:%M:%S"),
     data$Global_active_power, type = "l", xlab = "",
     ylab = "Global Active Power (kilowatts)")
dev.off()
