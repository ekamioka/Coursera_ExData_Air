library(data.table)

NEI <- readRDS("summarySCC_PM25.rds")

sub = NEI[which(NEI$fips == 24510),]

pm <- aggregate(Emissions ~ year,sub, FUN = sum)

png(file = "Plot2.png", bg = "transparent")
barplot((pm$Emissions)/10^3, pm$year, col=c("black","red","yellow","green"), names.arg=pm$year, ylab="Total Emissions (kilo Tons PM2.5)",xlab="Year",)
dev.off()