# Loading data
setwd("D://R Data/assignment")
EMI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Cleaning
library(tidyverse)
EMI_Bal_Type <- EMI %>% 
    filter(fips=="24510") %>% 
    group_by(year,type) %>% 
    summarise(Emissions=sum(Emissions))

# Creating the plot
options(scipen=200)
ggplot(EMI_Bal_Type, aes(year, Emissions, color=type))+
    geom_line()+
    facet_wrap(~type)
ggsave("plot3.png")










