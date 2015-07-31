library(ggplot2)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

subscc <- SCC$SCC[grepl("veh", SCC$SCC.Level.Two, ignore.case = TRUE)]

subnei <- NEI[which(NEI$fips == 24510),]
subnei <- subnei[which(subnei$SCC %in% subscc),]

png(file = "Plot5.png", bg = "transparent")
plot <- ggplot(subnei, aes(factor(year), Emissions/10^6))
plot +  geom_bar(stat="identity") +  guides(fill=FALSE) + labs(title="Baltimore - Motor Vehicle PM2.5 Emissions/Year") + labs(x="Years", y="PM2.5-Total Emission (Million Tons)")
dev.off()
