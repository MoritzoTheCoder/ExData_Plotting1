setwd("~/Desktop/Coursera_DataScience/4_ExploratoryDataAnalysis/ExData_Plotting1")

## READING IN DATA
#Define of which type each column is
cClasses <- c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric")

data <- read.table("household_power_consumption.txt", header=T, sep=';', na.strings="?", colClasses=cClasses)

#Add column which combines Date and Time:
data$DateTime <- as.POSIXct(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")

#Subsetting the data to the two days according to what the assignment requires
data.subset <- subset(data,Date == "1/2/2007" | Date == "2/2/2007")


## PLOT 2
png("plot2.png", width = 480, height = 480, res = 72)
#Create an empty Plot
plot(data.subset$DateTime, data.subset$Global_active_power, type="n", main="Plot 2", xlab="", ylab="Global Active Power (killowatts)")
#Add the graph
lines(data.subset$DateTime, data.subset$Global_active_power, type="l")

dev.off()
