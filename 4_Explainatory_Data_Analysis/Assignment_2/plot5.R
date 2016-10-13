# plot 5
library(ggplot2)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# subset SCC with keywords "Vehicles" in SCC.Level.Two
MC <- SCC[grep("Vehicles", SCC$SCC.Level.Two, ignore.case = T),]

# subset NEI by selecting data from Baltimore
Baltimore_NEI <- NEI[which(NEI$fips == "24510"),]
Baltimore_MC<- Baltimore_NEI[Baltimore_NEI$SCC %in% MC$SCC, ]

# ggplot
png("plot5.png", width=480, height=480)
gg <- ggplot(Baltimore_MC, aes(year, Emissions))
gg <- gg + geom_line(stat = "summary", fun.y = "sum", colour = "blue", size = 1.5)
gg <- gg + geom_point(stat = "summary", fun.y = "sum", colour = "red", size=4) 
gg <- gg + labs(title = "Baltimore Total Emissions from Motor Vehicles") + ylab(expression('PM'[2.5])) 
gg <- gg+ scale_x_continuous(breaks = seq(1, 2008, 3))
gg
dev.off()