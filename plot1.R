# Loading data
setwd("D://R Data/assignment")
EMI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Cleaning
EMI_SUM <- with(EMI, aggregate(Emissions, by = list(year), sum))
names(EMI_SUM)[1] <- "Year"
names(EMI_SUM)[2] <- "Emissions"

# Creating the plot
options(scipen=200)
png(filename= "plot1.png")
plot(EMI_SUM,
     type="b",
     main="Plot of Total Emmisions by Years",
     xlab="Years",
     ylab="Emissions (Tons)")
dev.off()