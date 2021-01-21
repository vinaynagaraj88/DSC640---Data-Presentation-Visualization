# Week 3.2 Assignment
# Name: Vinay Nagaraj
# Tree maps, Area charts, and Stacked area charts

# Set working directory, location where my "acs-14-1yr-s0201.csv" file is saved along with my .R files
setwd("/Users/vinaynagaraj/My Docs/Masters/Sem 6, Data Presentation & Visualization/Week 5-6")


# Import "expenditures.txt" and "unemployement-rate-1948-2010.csv" for analysis
expenditures <- read.table(file = "expenditures.txt", header = TRUE, sep = '\t', dec = '.', fill = TRUE)
unemployement <- read.csv2(file = "unemployement-rate-1948-2010.csv", header = TRUE, sep=',')
unemployement$Value <- as.numeric(as.character(unemployement$Value))


# import libraries
library(ggplot2)
library("xlsx")
library(reshape2)
library("dplyr") 
library(numbers)
library("treemap")


# Tree maps

treemap::treemap(expenditures,index = c('category'),
                 vSize = 'expenditure',
                 title = 'Expenditure by Category')


# Area charts
# Calculate mean rating
unemployement_total = aggregate(Value ~ Year, unemployement, mean)
Area_Plt <- ggplot(unemployement_total, ggplot2::aes(x=Year , y=`Value`)) +
  geom_area( fill='green', alpha=.2) +
  geom_line() +
  ylab("Mean Rate") +
  ggtitle('Unemployment rate by Year')
Area_Plt


# Stacked area charts
Stack_Area_Plt <- ggplot(expenditures, aes(x=year, y=expenditure, fill=category)) +
  geom_area() +
  ggtitle('Expenditures for each category by Year')
Stack_Area_Plt