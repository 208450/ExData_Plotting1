setwd("C:/R_arquivos");

library(data.table);
library(lubridate);

if (!file.exists('plots1')) {
  dir.create('plots1');
}

File <- "household_power_consumption.txt";
dataFile <- read.table(File, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".");
subData <- data[dataFile$Date %in% c("1/2/2007","2/2/2007") ,];

datetime <- strptime(paste(subData$Date, subData$Time, sep=" "), "%d/%m/%Y %H:%M:%S");

globalActivePower <- as.numeric(subData$Global_active_power);

png(filename='plots1/plot2.png',width=480, height=480, units='px');

plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")

x<-dev.off();

