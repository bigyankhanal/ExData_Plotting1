#plot1
#setting the directory in the file location
setwd("D:/BIGYAN/Coursera/ExploratoryDataAnalysis/Asgnment1/household_power_consumption")
#reading the table from the location
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";")
#subsetting the required data from 1/2/07 to 2/2/07
RequiredData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
#Only taking global active power from the required data
globalActivePower <- as.numeric(RequiredData$Global_active_power)
# creating plot1.png with required dimension
png("plot1.png", width=480, height=480)
#Create the histogram for global active power
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (KW)")
dev.off()
