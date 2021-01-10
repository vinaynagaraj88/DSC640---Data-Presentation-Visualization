# Week 2.2 Assignment
# Name: Vinay Nagaraj
# Line Charts & Step charts

# Set working directory, location where my "acs-14-1yr-s0201.csv" file is saved along with my .R files
setwd("/Users/vinaynagaraj/My Docs/Masters/Sem 6, Data Presentation & Visualization/Week 3-4")

# Import "world-population.xlsm" for analysis
world_pop <- read_excel('world-population.xlsm')

library("ggplot2")

# Line Plot
ggplot(world_pop, aes(x=Year, y=Population)) +
  geom_line()

# Step Plot

ggplot() +
  geom_step(data=world_pop, mapping=aes(x=Year, y=Population))