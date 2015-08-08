setwd("C:/R_arquivos");
library(data.table);
library(lubridate);

if (!file.exists('plots1')) {
  dir.create('plots1')
}

dataFile <- "household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,];

#str(subSetData)
globalActivePower <- as.numeric(subSetData$Global_active_power);


hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)");

png(filename='plots1/plot1.png',width=480, height=480, units='px');

x<-dev.off();

