# Week 4.2 Assignment
# Name: Vinay Nagaraj
# Scatterplot, Bubble chart and Density plot

# Set working directory, location where my data file is saved along with my .R files
setwd("/Users/vinaynagaraj/My Docs/Masters/Sem 6, Data Presentation & Visualization/Week 7-8")

# Import "crimerates-by-state-2005.csv" for analysis
crime_rate_raw = read.csv2(file = "crimerates-by-state-2005.csv", header = TRUE, sep=',', dec = '.')
# Get state data by removing "United States Record"
crime_rate <- crime_rate_raw %>% filter(state != 'United States')
# Show the data sample
head(crime_rate)

# import libraries
library(ggplot2)
library("dplyr") 
library(tidyr)

# Scatterplot

ggplot(crime_rate, aes(x=motor_vehicle_theft, y=robbery)) +
  geom_point(color="red", alpha=0.5) +
  xlab('Motor Vehicle Theft Incidents') + 
  ylab('Robbery Incidents') +
  ggtitle('Motor Vehicle Theft Incidents and Robbery Incidents') +
  theme(plot.title = element_text(hjust = 0.5, size = 18))

# Bubble Chart

ggplot(crime_rate, aes(x=motor_vehicle_theft, y=robbery, size=murder)) +
  geom_point(color="red", alpha=0.5) +
  xlab('Motor Vehicle Theft Incidents') + 
  ylab('Robbery Incidents') +
  ggtitle('Motor Vehicle Theft Incidents and Robbery Incidents') +
  theme(plot.title = element_text(hjust = 0.5, size = 18))

# Density Plot

ggplot(crime_rate, aes(x=burglary)) +
  geom_density(color="red", fill="blue") +
  xlab('Burglary Incident Counts') + 
  ylab('Burglary Count Frequency/Density') +
  ggtitle('Density Plot: Burglary Incidents') +
  theme(plot.title = element_text(hjust = 0.5, size = 14)) 