# plot 3
library(ggplot2)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# subset NEI by selecting data from Baltimore
Baltimore_NEI <- NEI[which(NEI$fips == "24510"),]

# ggplot
png("plot3.png", width=480, height=480)
g <- ggplot(Baltimore_NEI, aes(year, Emissions, colour = type)) + theme(legend.position="none")
g <- g + geom_line(stat = "summary", fun.y = "sum", size = 1.5) 
g <- g + geom_point(stat = "summary", fun.y = "sum", colour = "red", size=4) 
g <- g + labs(title = "Baltimore Total Emissions") + ylab(expression('PM'[2.5])) 
g <- g + facet_grid(type~., scales = "free") 
g <- g+ scale_x_continuous(breaks = seq(1, 2008, 3))
g
dev.off()