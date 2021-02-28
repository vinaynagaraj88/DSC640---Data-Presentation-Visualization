# Week 6.2 Assignment
# Name: Vinay Nagaraj
# Histogram, Box Plots, Bullet Charts & Parallel Plot (Additional chart of my choice)

# Set working directory, location where my data file is saved along with my .R files
setwd("/Users/vinaynagaraj/My Docs/Masters/Sem 6, Data Presentation & Visualization/Week 11-12")

# import libraries
library(dplyr)
library(plotly)

birthrate = read.csv("birth-rate.csv", header = TRUE, sep=',', dec = '.')

# Show the data sample
head(birthrate)

# format year columns
colnames(birthrate) <- gsub("X", "", colnames(birthrate))

# Data structure:
str(birthrate)

# Create a Histogram
#options(repr.plot.width = 4, repr.plot.height = 4)

# create pivotted data for plotting
birthrate_hist <- reshape2::melt(birthrate, id=c("Country")) %>%
  dplyr::mutate("Country" = as.character(Country),
                "Year" = as.character(variable),
                "rate" = value) %>% 
  dplyr::select(c("Country","Year","rate"))

# create histogram of birth rate
hist(birthrate_hist$rate)

# Create Box plot
birthrate_box <- birthrate_hist %>% 
  dplyr::filter(Country %in% c("United States"))

boxplot(birthrate_box$rate ~ birthrate_box$Country)

# Create bullet chart
fig <- plot_ly(
  type = "indicator",
  mode = "number+gauge+delta",
  value = birthrate_box[1,3],
  domain = list(x = c(0, 1), y= c(0, 1)),
  title = list(text = "Birth Rate"),
  delta = list(reference = 30),
  gauge = list(
    shape = "bullet",
    axis = list(range = list(NULL, 30)),
    threshold = list(
      line = list(color = "red", width = 2),
      thickness = 0.75,
      value = 280),
    steps = list(
      list(range = c(0, 15), color = "lightgray"),
      list(range = c(15, 25), color = "gray"))),
  height = 150, width = 700) 
fig <- fig %>%
  layout(margin = list(l= 150, r= 10))

fig


# Create Parallel Plot -- Additional chart of your choice

education <- read.csv("education.csv", header = TRUE, sep=',', dec = '.') 

education_parallel <- education %>% 
  dplyr::filter(stringr::str_trim(state, "both") != "United States")

# vector color
my_colors=colors()[as.numeric(education_parallel$state)*11]

# make the graph
MASS::parcoord(education_parallel[,c(2:4)] , col= my_colors  )