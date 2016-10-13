# plot 4
library(ggplot2)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# subset SCC with keywords "Comb" and "Coal" in SCC.EI.Sector
comb_coal_SCC <- SCC[grep("Comb|Coal", SCC$EI.Sector, ignore.case = T),]
comb_coal <- NEI[NEI$SCC %in% comb_coal_SCC$SCC, ]

# calculate US total emission on an annual basis
total  <- tapply(comb_coal$Emissions, comb_coal$year, sum)

# ggplot
png("plot4.png", width=480, height=480)
gg <- ggplot(comb_coal, aes(year, Emissions))
gg <- gg + geom_line(stat = "summary", fun.y = "sum", colour = "blue", size = 1.5)
gg <- gg + geom_point(stat = "summary", fun.y = "sum", colour = "red", size=4) 
gg <- gg + labs(title = "US Total Emissions from Coal Combustion-related Sources") + ylab(expression('PM'[2.5])) 
gg <- gg+ scale_x_continuous(breaks = seq(1, 2008, 3))
gg
dev.off()