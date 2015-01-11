setwd("~/Desktop/Coursera_DataScience/4_ExploratoryDataAnalysis/ExData_Plotting1")

## READING IN DATA
data <- read.table("household_power_consumption.txt", header=T, sep=';', nrow=10)
head(data, 10)
str(data)
cClasses <- sapply(data, class)
cClasses <- c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric")
data <- read.table("household_power_consumption.txt", header=T, sep=';', na.strings="?", colClasses=cClasses)
#Add column which combines Date and Time:
data$DateTime <- as.POSIXct(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")

data.subset <- subset(data,Date == "1/2/2007" | Date == "2/2/2007")
head(data.subset, 10)
tail(data.subset, 10)

## PLOT1
png("plot1.png", width = 480, height = 480, res = 72)
#Create Plot
plot1 <- hist(data.subset$Global_active_power, main="Global Active Power", xlab="Global Active Power (killowatts)", col="red")

dev.off()
