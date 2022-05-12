# Loading data
setwd("D://R Data/assignment")
EMI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Cleaning
library(tidyverse)
EMI_Bal <- EMI %>% 
    filter(fips=="24510") %>% 
    with(aggregate(Emissions, by = list(year), sum))
names(EMI_Bal)[1] <- "Year"
names(EMI_Bal)[2] <- "Emissions"

# Creating the plot
options(scipen=200)
png(filename= "plot2.png")
plot(EMI_Bal,
     type="b",
     main="Plot of Total Emmisions by Years(Maryland)",
     xlab="Years",
     ylab="Emissions (Tons)")
dev.off()









