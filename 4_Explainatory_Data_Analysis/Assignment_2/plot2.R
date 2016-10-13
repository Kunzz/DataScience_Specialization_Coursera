# plot 2
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# subset NEI by selecting data from Baltimore
Baltimore_NEI <- NEI[which(NEI$fips == "24510"),]

# calculate Baltimore total emission on an annual basis
Baltimore_total  <- tapply(Baltimore_NEI$Emissions, Baltimore_NEI$year, sum)

# base plot
png("plot2.png", width=480, height=480)
barplot(Baltimore_total, col = "orange", main = "Baltimore Total Emissions from PM2.5", xlab="year", ylab="tons")
dev.off()