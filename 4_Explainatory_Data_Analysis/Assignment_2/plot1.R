# plot 1
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
# calculate US total emission on an annual basis
us_total  <- tapply(NEI$Emissions, NEI$year, sum)
# base plot
png("plot1.png", width=480, height=480)
barplot(us_total, col = "grey", main = "US Total Emissions from PM2.5", xlab="year", ylab="tons")
dev.off()