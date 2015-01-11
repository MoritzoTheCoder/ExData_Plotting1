setwd("~/Desktop/Coursera_DataScience/4_ExploratoryDataAnalysis/ExData_Plotting1")

## READING IN DATA
#Define of which type each column is
cClasses <- c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric")

data <- read.table("household_power_consumption.txt", header=T, sep=';', na.strings="?", colClasses=cClasses)

#Add column which combines Date and Time:
data$DateTime <- as.POSIXct(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")

#Subsetting the data to the two days according to what the assignment requires
data.subset <- subset(data,Date == "1/2/2007" | Date == "2/2/2007")

## PLOT 4
png("plot4.png", width = 480, height = 480, res = 72)
# 2x2 grid to put in the following graphs linewise
par(mfrow = c(2, 2))
#upper left graph
plot(data.subset$DateTime, data.subset$Global_active_power, type="n", xlab="", ylab="Global Active Power (killowatts)")
lines(data.subset$DateTime, data.subset$Global_active_power, type="l")
#upper right graph
plot(data.subset$DateTime, data.subset$Voltage, type="n", xlab="datetime", ylab="Voltage")
lines(data.subset$DateTime, data.subset$Voltage, type="l")
#lower left graph
plot(data.subset$DateTime, data.subset$Sub_metering_1, type="n", xlab="", ylab="Energy submetering")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black", "red", "blue"), lty = 1)
lines(data.subset$DateTime, data.subset$Sub_metering_1, type="l")
lines(data.subset$DateTime, data.subset$Sub_metering_2, type="l", col="red")
lines(data.subset$DateTime, data.subset$Sub_metering_3, type="l", col="blue")
#lower right graph
plot(data.subset$DateTime, data.subset$Global_reactive_power, type="n", xlab="datetime", ylab="Global_reactive_power")
lines(data.subset$DateTime, data.subset$Global_reactive_power, type="l")

dev.off()
