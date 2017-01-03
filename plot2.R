#plot2
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
# creating plot2.png with required dimension
png("plot2.png", width=480, height=480)
#Create the plot for global active powerwith day time
plot(day_time,globalActivePower,type="l",ylab="Global Active Power")
dev.off()
