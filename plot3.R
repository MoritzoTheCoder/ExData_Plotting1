setwd("~/Desktop/Coursera_DataScience/4_ExploratoryDataAnalysis/ExData_Plotting1")

## READING IN DATA
#Define of which type each column is
cClasses <- c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric")

data <- read.table("household_power_consumption.txt", header=T, sep=';', na.strings="?", colClasses=cClasses)

#Add column which combines Date and Time:
data$DateTime <- as.POSIXct(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")

#Subsetting the data to the two days according to what the assignment requires
data.subset <- subset(data,Date == "1/2/2007" | Date == "2/2/2007")


## PLOT 3
#Create an empty Plot
plot(data.subset$DateTime, data.subset$Sub_metering_1, type="n", main="Plot 3", xlab="", ylab="Energy submetering")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black", "red", "blue"), lty = 1)
#Add three different graphs according to the three submetering variables
lines(data.subset$DateTime, data.subset$Sub_metering_1, type="l")
lines(data.subset$DateTime, data.subset$Sub_metering_2, type="l", col="red")
lines(data.subset$DateTime, data.subset$Sub_metering_3, type="l", col="blue")