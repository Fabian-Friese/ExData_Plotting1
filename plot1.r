library(lubridate)
library(plyr)

setwd("D:/Users/friese/HiDrive/Weiterbildung/DataScience_Coursera/04_Exploratory_Data_Analysis/Assignments/W1/ExData_Plotting1")
headers = read.csv("household_power_consumption.txt", header = F, sep=";", nrows = 1, as.is = T)
data<-read.csv("household_power_consumption.txt", sep=";", skip=66636, nrow=2880, na.string= c("?"))
colnames(data)= headers
data<-mutate(data, Datetime= with(data, dmy(Date) + hms(Time)))

 
         
png('plot1.png')
hist(data$Global_active_power, xlab="Global Active Power (kilowatts)", col="red", main="Global Active Power")
dev.off()
