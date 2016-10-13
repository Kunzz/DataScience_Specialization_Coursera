# plot 6
library(ggplot2)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# subset SCC with keywords "Vehicles" in SCC.Level.Two
MC <- SCC[grep("Vehicles", SCC$SCC.Level.Two, ignore.case = T),]

# subset NEI by selecting data from Baltimore and LA
# replace the fips numbers with the corresponding county names
BT_LA_NEI <- NEI[which(NEI$fips == "24510" |  NEI$fips == "06037"),]
BT_LA_MC<- BT_LA_NEI[BT_LA_NEI$SCC %in% MC$SCC, ]
BT_LA_MC$fips[BT_LA_MC$fips == "24510"] <- "Baltimore"
BT_LA_MC$fips[BT_LA_MC$fips == "06037"] <- "Los Angeles"

# ggplot
png("plot6.png", width=480, height=480)
gg <- ggplot(BT_LA_MC, aes(year, Emissions, colour = fips)) + theme(legend.position="none")
gg <- gg + geom_line(stat = "summary", fun.y = "sum", size = 1.5)
gg <- gg + geom_point(stat = "summary", fun.y = "sum", colour = "red", size=4) 
gg <- gg + labs(title = "Total Emissions from Motor Vehicles \n Baltimore and Los Angeles") + ylab(expression('PM'[2.5])) 
gg <- gg + facet_grid(fips~., scales = "free") + scale_x_continuous(breaks = seq(1, 2008, 3))
gg
dev.off()
