Sys.setlocale(locale = "USA")
fn <- "./data/household_power_consumption.txt"
data <- read.table(fn, header = T, sep = ";", stringsAsFactors = F)
dfr <- subset(data, (data$Date == "1/2/2007") | (data$Date == "2/2/2007"))
dfr$DateTime <- paste(dfr$Date, dfr$Time)
dfr$DateTime <- strptime(dfr$DateTime,"%d/%m/%Y %H:%M:%S") 
par(mfrow=c(2,2), cex=0.8)
dfr$Sub_metering_1 <- as.numeric(dfr$Sub_metering_1)
dfr$Sub_metering_2 <- as.numeric(dfr$Sub_metering_2)
dfr$Sub_metering_3 <- as.numeric(dfr$Sub_metering_3)
dfr$Voltage <- as.numeric(dfr$Voltage)
dfr$Global_active_power <- as.numeric(dfr$Global_active_power)
dfr$Global_reactive_power <- as.numeric(dfr$Global_reactive_power)
# First 
plot(dfr$DateTime, dfr$Global_active_power, type="l", ylab="Global Active Power", xlab="")
# Second
plot(dfr$DateTime, dfr$Voltage, type="l", xlab="datetime", ylab="Voltage")
# Third
ns <- "                       "
plot(dfr$DateTime,dfr$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(dfr$DateTime,dfr$Sub_metering_2,col="red")
lines(dfr$DateTime,dfr$Sub_metering_3,col="blue")
legend("topright", lwd=2, col=c("black","red","blue"), 
   legend = c(paste("Sub_metering_1",ns),paste("Sub_metering_2",ns),paste("Sub_metering_3",ns)), 
   lty=1, bty="n", cex=0.7)
# Forth
plot(dfr$DateTime, dfr$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")


dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()