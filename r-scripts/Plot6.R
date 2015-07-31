library(ggplot2)
library(grid)
library(gridExtra)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

subscc <- SCC$SCC[grepl("veh", SCC$SCC.Level.Two, ignore.case = TRUE)]

subnei <- NEI[NEI$fips == "24510",]
subbalt <- subnei[which(subnei$SCC %in% subscc),]
subnei <- NEI[NEI$fips == "06037",]
sublas <- subnei[which(subnei$SCC %in% subscc),]

png(file = "Plot6.png", bg = "transparent")

pbalt <- ggplot(subbalt, aes(factor(year), Emissions)) +  
        geom_bar(stat="identity") + 
        guides(fill=FALSE) + 
        labs(title="Baltimore") + 
        labs(x="Years", y="PM2.5-Total Emission (Tons)")

plas <- ggplot(sublas, aes(factor(year), Emissions)) + 
        geom_bar(stat="identity") + 
        guides(fill=FALSE) + 
        labs(title="Los Angeles") + 
        labs(x="Years", y="PM2.5-Total Emission (Tons)")

grid.arrange(pbalt, plas, ncol = 2, main = "Motor Vehicle PM2.5 Emissions/Year")
dev.off()
