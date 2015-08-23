library(ggplot2)
## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
# SCC <- readRDS("Source_Classification_Code.rds")

BaltimoreNEI <- NEI[NEI$fips == "24510",]

gb<-group_by(BaltimoreNEI, year, type)

s<-summarize(gb, sum(Emissions))

names(s)<-c("Year", "type", "TotalEmissions")

# png(filename="plot3.png", width = 480, height = 480, units = "px")

# g <- ggplot(maacs, aes(logpm25, NocturnalSympt))
# g + geom_point() + facet_grid(. ~ bmicat) + geom_smooth(method = "lm")
# 
g <-qplot(Year, TotalEmissions, data = s, geom = c("point", "smooth"), method = "lm", facets = . ~ type)
p <- g + geom_point()
print(p)

# with(s, plot(Year,TotalEmissions, xaxt="n", ylab="TotalEmissions (tons)", 
#             main = "Total emissions from PM2.5 in Baltimore from 1999 to 2008", pch=19, col="red") )

# axis(1, at=c(1999,2002,2005,2008))

# Drawing a regression line to see the tendency
# model <- lm(TotalEmissions ~ Year, s)
# abline(model, lwd = 2)

dev.off()

#

#