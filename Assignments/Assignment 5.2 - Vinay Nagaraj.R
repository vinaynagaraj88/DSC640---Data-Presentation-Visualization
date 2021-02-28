# Week 5.2 Assignment
# Name: Vinay Nagaraj
# Heat maps, Spatial charts, and Contour charts

# Set working directory, location where my data file is saved along with my .R files
setwd("/Users/vinaynagaraj/My Docs/Masters/Sem 6, Data Presentation & Visualization/Week 9-10")

# import libraries
library(RColorBrewer)
library(maps)
library('ggplot2')

costco = read.csv2(file = "costcos-geocoded.csv", header = TRUE, sep=',', dec = '.')
ppg2008 = read.csv2(file = "ppg2008.csv", header = TRUE, sep=',', dec = '.')

# Show the data sample
head(costco)
head(ppg2008)

str(costco)
str(ppg2008)

### Construct Charts:

# Heat Map
  
heatmap(as.matrix(ppg2008[,2:ncol(ppg2008)]), Rowv = NA, Colv = NA, 
        col = brewer.pal(9, "Blues"),
        scale = "column", margins = c(5,10))

# Spatial Plot
  
map(database="state", col="#cccccc")
symbols(costco$Longitude, costco$Latitude, bg="#e2373f", fg="#ffffff",
        lwd=0.5, circles=rep(1, length(costco$Longitude)),
        inches=0.05, add=TRUE)


# Countour plot
  
ggplot(ppg2008, aes(x=FTM, y=FTA))+
  theme_bw()+
  geom_point(alpha=0.1, col='red')+
  geom_density2d(color='black')+
  ggtitle('Contour Plot')+
  theme(plot.title = element_text(hjust = 0.5))+
  labs(x='FTM', y='FTA')