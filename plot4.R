#plot4
#setting the directory in the file location
setwd("D:/BIGYAN/Coursera/ExploratoryDataAnalysis/Asgnment1/household_power_consumption")
#reading the table from the location
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";")
#subsetting the required data from 1/2/07 to 2/2/07
RequiredData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
#converting to suitable day
day_time<-strptime(paste(RequiredData$Date,RequiredData$Time,sep=" "),"%d/%m/%Y %H:%M:%S")
#Only taking global active power from the required data
globalActivePower <- as.numeric(RequiredData$Global_active_power)
#Only taking voltage from the required data
Voltage <- as.numeric(RequiredData$Voltage)
#Only taking energy sub metering data from the required data
Sub_metering_1 <- as.numeric(RequiredData$Sub_metering_1)
Sub_metering_2 <- as.numeric(RequiredData$Sub_metering_2)
Sub_metering_3 <- as.numeric(RequiredData$Sub_metering_3)
#Only taking global reactive power from the required data
globalReactivePower <- as.numeric(RequiredData$Global_reactive_power)
# creating plot4.png with required dimension
png("plot4.png", width=480, height=480)
#making the 4 plots in 2*2 size
par(mfrow=c(2,2))
# 1st plot
plot(day_time,globalActivePower,type="l",ylab="Global Active Power")
#2nd plot
plot(day_time,Voltage,type="l",ylab="Voltage")
# 3rd plot (same as plot3)
plot(day_time,Sub_metering_1,type="l",ylab="Energy sub metering",col="black")
lines(day_time,Sub_metering_2,type="l",ylab="Energy sub metering",col="red")
lines(day_time,Sub_metering_3,type="l",ylab="Energy sub metering",col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
#4th plot
plot(day_time,globalReactivePower,type="l",ylab="Global Reactive Power")
dev.off()