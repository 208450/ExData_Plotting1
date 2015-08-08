setwd("C:/R_arquivos");

library(data.table);
library(lubridate);

if (!file.exists('plots1')) {
  dir.create('plots1');
}

File <- "household_power_consumption.txt";
dataFile <- read.table(File, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".");
subData <- data[dataFile$Date %in% c("1/2/2007","2/2/2007") ,];


datetime <- strptime(paste(subData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(subData$Global_active_power)
subMetering1 <- as.numeric(subData$Sub_metering_1)
subMetering2 <- as.numeric(subData$Sub_metering_2)
subMetering3 <- as.numeric(subData$Sub_metering_3)

png("plot3.png", width=480, height=480)
plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
x<- dev.off()
