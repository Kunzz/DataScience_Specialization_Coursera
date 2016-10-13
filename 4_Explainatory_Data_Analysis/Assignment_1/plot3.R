
## convert the Date and Time variables to Date/Time classes in R
## put household_power_consumption.txt in the working directory
dataFile <- "household_power_consumption.txt"
fulldata <- read.table(dataFile, header=T, sep=';', na.strings="?",nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
fulldata$Date <- as.Date(fulldata$Date, format="%d/%m/%Y")

## select the dates of interest
subSetData1 <- fulldata[which(fulldata$Date =="2007-02-01"),]
subSetData2 <- fulldata[which(fulldata$Date =="2007-02-02"),]
subSetData <- rbind(subSetData1, subSetData2)

## plot 3 - energy submetering 1,2,3 v.s. time
png("plot3.png", width=480, height=480)
plot(subSetData$Sub_metering_1,type= "l",xaxt="n", xlab = "", ylab = "Energy sub metering")
lines(subSetData$Sub_metering_2,type= "l",xaxt="n", col="red", ylab = "Energy sub metering")
lines(subSetData$Sub_metering_3,type= "l", col="blue", xaxt="n", ylab = "Energy sub metering")
axis(side=1, labels=c("Thu", "Fri", "Sat"), at =c(1,1440,2879))
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c('black','red','blue'), lty = 1, lwd=2.5,
       merge = TRUE)
dev.off()