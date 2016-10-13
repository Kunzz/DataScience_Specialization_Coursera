
## convert the Date and Time variables to Date/Time classes in R
## put household_power_consumption.txt in the working directory
dataFile <- "household_power_consumption.txt"
fulldata <- read.table(dataFile, header=T, sep=';', na.strings="?",nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
fulldata$Date <- as.Date(fulldata$Date, format="%d/%m/%Y")

## select the dates of interest
subSetData1 <- fulldata[which(fulldata$Date =="2007-02-01"),]
subSetData2 <- fulldata[which(fulldata$Date =="2007-02-02"),]
subSetData <- rbind(subSetData1, subSetData2)

##  plot 2 - active power v.s. datetime
datetime <- paste(subSetData$Date,subSetData$Time)
stripped_dt <- strptime(datetime, format="%Y-%m-%d %H:%M:%S")
dt_lab <- weekdays(stripped_dt, abbreviate = TRUE)
dt_lab_reduced <- unique(dt_lab)
dt_lab_ind_1 <- which (dt_lab==dt_lab_reduced[1])[1]
dt_lab_ind_2 <- which (dt_lab==dt_lab_reduced[2])[1]
dt_lab_ind_3 <- weekdays(stripped_dt[length(stripped_dt)]+60, abbreviate = TRUE)
  
globalActivePower <- as.numeric(subSetData$Global_active_power)
png("plot2.png", width=480, height=480)
plot(globalActivePower,type= "l",xaxt="n", xlab = "", ylab = "Global Active Power (kilowatts)")
axis(side=1, labels=c(dt_lab_reduced,dt_lab_ind_3), at =c(dt_lab_ind_1,dt_lab_ind_2, length(stripped_dt)))
dev.off()
