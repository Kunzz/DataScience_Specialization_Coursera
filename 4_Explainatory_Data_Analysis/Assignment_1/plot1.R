
## convert the Date and Time variables to Date/Time classes in R
## put household_power_consumption.txt in the working directory
dataFile <- "household_power_consumption.txt"
fulldata <- read.table(dataFile, header=T, sep=';', na.strings="?",nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
fulldata$Date <- as.Date(fulldata$Date, format="%d/%m/%Y")

## select the dates of interest
subSetData1 <- fulldata[which(fulldata$Date =="2007-02-01"),]
subSetData2 <- fulldata[which(fulldata$Date =="2007-02-02"),]
subSetData <- rbind(subSetData1, subSetData2)

## plot 1
globalActivePower <- as.numeric(subSetData$Global_active_power)
png("plot1.png", width=480, height=480)
hist(globalActivePower, col="blue", main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.off()