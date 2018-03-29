library(lubridate)
library(plyr)

setwd("D:/Users/friese/HiDrive/Weiterbildung/DataScience_Coursera/04_Exploratory_Data_Analysis/Assignments/W1/ExData_Plotting1")
headers = read.csv("household_power_consumption.txt", header = F, sep=";", nrows = 1, as.is = T)
data<-read.csv("household_power_consumption.txt", sep=";", skip=66636, nrow=2880, na.string= c("?"))
colnames(data)= headers
data<-mutate(data, Datetime= with(data, dmy(Date) + hms(Time)))

 
png('plot3.png')
plot(data$Datetime,data$Sub_metering_1, type="n", xlab="",ylab="Energy sub metering")
lines(data$Datetime,data$Sub_metering_1, col="black" )
lines(data$Datetime,data$Sub_metering_2, col="red" )
lines(data$Datetime,data$Sub_metering_3, col="blue" )
legend(x="topright", legend=c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),col=c("black","red", "blue"), lty=1)
dev.off()
