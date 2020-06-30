rdata <- read.table("household_power_consumption.txt", 
                   na.strings = "?", sep = ";", header = T)
data <- subset(rdata, Date == "1/2/2007" | Date == "2/2/2007")
png(filename = "plot1.png")
hist(data$Global_active_power, 
     xlab = "Global Active Power (kilowatts)",
     main = "Global Active Power", col = "red")
dev.off()
