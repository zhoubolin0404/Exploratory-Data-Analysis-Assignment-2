# Loading data
setwd("D://R Data/assignment")
EMI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Cleaning
library(tidyverse)
data_merge <- merge(EMI,SCC,by="SCC")
data_merge_SUM <- data_merge %>% 
    group_by(year,EI.Sector) %>% 
    summarize(Emissions=sum(Emissions, na.rm=TRUE)) %>% 
    filter(str_detect(EI.Sector,'Coal'))

# Creating the plot
options(scipen=200)
ggplot(data_merge_SUM,aes(year,Emissions))+
    geom_line(aes(group=EI.Sector,col=EI.Sector))+
    geom_point(aes(group=EI.Sector))
ggsave("plot4.png")







