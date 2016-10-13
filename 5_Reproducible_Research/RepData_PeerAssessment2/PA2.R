library(ggplot2)
library(gridExtra)
stormData <- read.csv("repdata_data_StormData.csv")

stormData$year <- as.numeric(format(as.Date(stormData$BGN_DATE, format = "%m/%d/%Y %H:%M:%S"), "%Y"))
hist(stormData$year, breaks = 60, col= "steelblue", xlab="Year", ylab="Records", main = "Number of Storm Event Record, 1950-2011")

# subset data from the recent 15 years
subsetData <- subset(stormData, year > 1996)

# Data preparation, i.e., aggregate, sort and rearrange
injuriesData <- aggregate(subsetData$INJURIES, by=list(subsetData$EVTYPE), FUN=sum, na.rm=T)
names(injuriesData)[1] <- "Event"
names(injuriesData)[2] <- "Injury"
sortedInjuries <- head(injuriesData[order(-injuriesData$Injury),], 10)
sortedInjuries$Rank <-1:10
sortedInjuries <- sortedInjuries[c(3,1,2)]

fatalitiesData <- aggregate(subsetData$FATALITIES, by=list(subsetData$EVTYPE), FUN=sum, na.rm=T)
names(fatalitiesData)[1] <- "Event"
names(fatalitiesData)[2] <- "Fatality"
sortedFatalities <-head(fatalitiesData[order(-fatalitiesData$Fatality),], 10)
sortedFatalities$Rank <-1:10
sortedFatalities <- sortedFatalities[c(3,1,2)]

# plot
sortedInjuries <- transform(sortedInjuries, Event = reorder(Event, -Injury))
injuryPlot <- ggplot(sortedInjuries, aes(x=Event, y=Injury, fill=Event)) + 
  geom_bar(stat = "identity", width=.8) + 
  theme(axis.text.x=element_blank()) + 
  xlab("Severe Weather Type") + 
  ylab("Num of Injuries") +  
  ggtitle("Total Injuries by Top 10 Severe Weather Events \n in the U.S. from 1996 - 2011")

sortedFatalities <- transform(sortedFatalities, Event = reorder(Event, -Fatality))
fatalityPlot <- ggplot(sortedFatalities, aes(x=Event, y=Fatality, fill=Event)) + 
  geom_bar(stat = "identity", width=.8) + 
  theme(axis.text.x=element_blank()) + 
  xlab("Severe Weather Type") + 
  ylab("Num of Fatalities") +  
  ggtitle("Total Fatalities by Top 10 Severe Weather Events \n in the U.S. from 1996 - 2011")

grid.arrange(injuryPlot, fatalityPlot, nrow = 2)

# Property Damage
unique(subsetData$PROPDMGEXP)
subsetData[subsetData$PROPDMGEXP == "H", ]$PROPDMG <- subsetData[subsetData$PROPDMGEXP == "H", ]$PROPDMG * 10^2
subsetData[subsetData$PROPDMGEXP == "h", ]$PROPDMG <- subsetData[subsetData$PROPDMGEXP == "h", ]$PROPDMG * 10^2
subsetData[subsetData$PROPDMGEXP == "K", ]$PROPDMG <- subsetData[subsetData$PROPDMGEXP == "K", ]$PROPDMG * 10^3
subsetData[subsetData$PROPDMGEXP == "M", ]$PROPDMG <- subsetData[subsetData$PROPDMGEXP == "M", ]$PROPDMG * 10^6
subsetData[subsetData$PROPDMGEXP == "m", ]$PROPDMG <- subsetData[subsetData$PROPDMGEXP == "m", ]$PROPDMG * 10^6
subsetData[subsetData$PROPDMGEXP == "B", ]$PROPDMG <- subsetData[subsetData$PROPDMGEXP == "B", ]$PROPDMG * 10^9

propDmg <- aggregate(subsetData$PROPDMG, by=list(subsetData$EVTYPE), FUN=sum, na.rm=T)
names(propDmg)[1] <- "Event"
names(propDmg)[2] <- "PropDMG"
sortedpropDmg <-head(propDmg[order(-propDmg$PropDMG),], 10)
sortedpropDmg$Rank <-1:10
sortedpropDmg <- sortedpropDmg[c(3,1,2)]

# plot
sortedpropDmg <- transform(sortedpropDmg, Event = reorder(Event, -PropDMG))
propPlot <- ggplot(sortedpropDmg, aes(x=Event, y=PropDMG, fill=Event)) + 
  geom_bar(stat = "identity", width=.8) + 
  theme(axis.text.x=element_blank()) + 
  xlab("Severe Weather Type") + 
  ylab("Property Damage") +  
  ggtitle("Property Damage by Top 10 Severe Weather Events \n in the U.S. from 1996 - 2011")

# Crop Damage
unique(subsetData$CROPDMGEXP)
subsetData[subsetData$CROPDMGEXP == "K", ]$CROPDMG <- subsetData[subsetData$CROPDMGEXP == "K", ]$CROPDMG * 10^3
subsetData[subsetData$CROPDMGEXP == "k", ]$CROPDMG <- subsetData[subsetData$CROPDMGEXP == "k", ]$CROPDMG * 10^3
subsetData[subsetData$CROPDMGEXP == "M", ]$CROPDMG <- subsetData[subsetData$CROPDMGEXP == "M", ]$CROPDMG * 10^6
subsetData[subsetData$CROPDMGEXP == "m", ]$CROPDMG <- subsetData[subsetData$CROPDMGEXP == "m", ]$CROPDMG * 10^6
subsetData[subsetData$CROPDMGEXP == "B", ]$CROPDMG <- subsetData[subsetData$CROPDMGEXP == "B", ]$CROPDMG * 10^9
  
cropDmg <- aggregate(subsetData$CROPDMG, by=list(subsetData$EVTYPE), FUN=sum, na.rm=T)
names(cropDmg)[1] <- "Event"
names(cropDmg)[2] <- "CropDMG"
sortedcropDmg <-head(cropDmg[order(-cropDmg$CropDMG),], 10)
sortedcropDmg$Rank <-1:10
sortedcropDmg <- sortedcropDmg[c(3,1,2)]

# plot
sortedcropDmg <- transform(sortedcropDmg, Event = reorder(Event, -CropDMG))
cropPlot <- ggplot(sortedcropDmg, aes(x=Event, y=CropDMG, fill=Event)) + 
  geom_bar(stat = "identity", width=.8) + 
  theme(axis.text.x=element_blank()) + 
  xlab("Severe Weather Type") + 
  ylab("Crop Damage") +  
  ggtitle("Crop Damage by Top 10 Severe Weather Events \n in the U.S. from 1996 - 2011")

grid.arrange(propPlot, cropPlot, ncol = 2)
