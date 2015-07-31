library(ggplot2)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

subscc <- SCC$SCC[grepl("Comb", SCC$SCC.Level.One, ignore.case = TRUE) || grepl("Coal", SCC$SCC.Level.Four, ignore.case = TRUE)]

subnei <- NEI[which(NEI$SCC %in% subscc),]

png(file = "Plot4.png", bg = "transparent")
plot <- ggplot(subnei, aes(factor(year), Emissions/10^6))
plot +  geom_bar(stat="identity") +  guides(fill=FALSE) + labs(title="Coal Combustion PM2.5 Emissions/Year") + labs(x="Years", y="PM2.5-Total Emission (Million Tons)")
dev.off()
