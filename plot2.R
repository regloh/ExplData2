## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
# SCC <- readRDS("Source_Classification_Code.rds")

BaltimoreNEI <- NEI[NEI$fips == "24510",]

gb<-group_by(BaltimoreNEI, year)

s<-summarize(gb, sum(Emissions)/1000)

names(s)<-c("Year", "TotalEmissions")

png(filename="plot2.png", width = 480, height = 480, units = "px")

with(s, plot(Year,TotalEmissions, xaxt="n", ylab="TotalEmissions (kilotons)", 
             main = "Total emissions from PM2.5 in Baltimore from 1999 to 2008", pch=19, col="red") )

axis(1, at=c(1999,2002,2005,2008))

# Drawing a regression line to see the tendency
model <- lm(TotalEmissions ~ Year, s)
abline(model, lwd = 2)

dev.off()

#
# From the plot it is not so obvious that the emissions have dropped significantly
# in the observed period.
# The linear regression line indicates a drop, but with so few yearly values I would 
# say, it is not sure that the emissions have dropped in Baltimore.
#