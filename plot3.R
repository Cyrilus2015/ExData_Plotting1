Sys.setlocale(locale = "USA")
fn <- "./data/household_power_consumption.txt"
data <- read.table(fn, header = T, sep = ";", stringsAsFactors = F)
dfr <- subset(data, (data$Date == "1/2/2007") | (data$Date == "2/2/2007"))
dfr$DateTime <- paste(dfr$Date, dfr$Time)
dfr$DateTime <- strptime(dfr$DateTime,"%d/%m/%Y %H:%M:%S") 
par(mfrow=c(1,1))
dfr$Sub_metering_1 <- as.numeric(dfr$Sub_metering_1)
dfr$Sub_metering_2 <- as.numeric(dfr$Sub_metering_2)
dfr$Sub_metering_3 <- as.numeric(dfr$Sub_metering_3)
plot(dfr$DateTime,dfr$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(dfr$DateTime,dfr$Sub_metering_2,col="red")
lines(dfr$DateTime,dfr$Sub_metering_3,col="blue")
ns <- "                           "
legend("topright", lwd=3, col=c("black","red","blue"), legend = c(paste("Sub_metering_1",ns),
                                                                  paste("Sub_metering_2",ns), 
                                                                  paste("Sub_metering_3",ns)))
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()