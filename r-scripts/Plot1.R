NEI <- readRDS("summarySCC_PM25.rds")

pm <- aggregate(Emissions ~ year,NEI, sum)

png(file = "Plot1.png", bg = "transparent")
barplot((pm$Emissions)/10^6, pm$year, col=c("black","red","yellow","green"), names.arg=pm$year, ylab="Total Emissions (Million Tons PM2.5)",xlab="Year",)
dev.off()