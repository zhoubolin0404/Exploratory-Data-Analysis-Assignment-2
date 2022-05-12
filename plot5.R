# Loading data
setwd("D://R Data/assignment")
EMI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Cleaning
library(tidyverse)
data_merge <- merge(EMI,SCC,by="SCC",all=T) %>% 
    filter(fips=="24510")
data_merge_SUM <- data_merge %>%
    filter(str_detect(SCC.Level.Two,'Vehicles')) %>% 
    group_by(year) %>% 
    summarize(Emissions=sum(Emissions, na.rm=TRUE))

# Creating the plot
options(scipen=200)
ggplot(data_merge_SUM,aes(year,Emissions))+
    geom_line()+
    geom_point()
ggsave("plot5.png")
