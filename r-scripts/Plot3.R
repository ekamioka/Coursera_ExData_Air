library(ggplot2)

NEI <- readRDS("summarySCC_PM25.rds")
sub <- NEI[which(NEI$fips == 24510),]

png(file = "Plot3.png", bg = "transparent")
plot <- ggplot(sub, aes(factor(year), Emissions, fill=type))
plot +  geom_bar(stat="identity") + facet_grid(.~type) +  guides(fill=FALSE) + labs(title="Baltimore PM2.5 Emissions/Source Type") + labs(x="Years", y="PM2.5-Total Emission (Tons)")
dev.off()
