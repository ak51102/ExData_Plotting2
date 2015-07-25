#Read PM25 data from rds file
neiData <- readRDS("../Data/exdata-data-NEI_data/summarySCC_PM25.rds")

#Read Source Classification data from rds file
sccData <- readRDS("../Data/exdata-data-NEI_data/Source_Classification_Code.rds")

subset <- neiData[neiData$fips == "24510", ]

library(ggplot2)

par("mar"=c(5.1, 4.5, 4.1, 2.1))
png(filename = "./figure/plot3.png", 
    width = 480, height = 480, 
    units = "px")

g <- ggplot(subset,aes(year,Emissions,color=type))

g + geom_line(stat = "summary", fun.y = "sum") +
  ylab(expression('Total PM'[2.5]*" Emissions")) +
  ggtitle("Total Emissions in Baltimore City from 1999 to 2008")

dev.off()