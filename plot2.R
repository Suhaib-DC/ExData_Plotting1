rdata <- read.table("household_power_consumption.txt", 
                    na.strings = "?", sep = ";", header = T)
data <- subset(rdata, Date == "1/2/2007" | Date == "2/2/2007")
datetime <- strptime(paste(data$Date,data$Time), 
                     format = "%d/%m/%Y %H:%M:%S")
png(filename = "plot2.png")
plot(datetime,
     as.numeric(data$Global_active_power), type = "l", xlab = "",
     ylab = "Global Active Power (kilowatts)")
dev.off()
