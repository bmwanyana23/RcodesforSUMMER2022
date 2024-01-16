#plotting missing data
library(finalfit)
diamonds%>%
  missing_plot()

#sum of missing values in each column
colSums(is.na(diamonds))   

sapply(diamonds, class)

#simple scatter plot-2numeric variables
plot(diamonds$price,diamonds$depth)

#multiple scatter plots on one graph
par(mfrow=c(2,2)) #2x2 matrix plot
plot(diamonds$price,diamonds$depth)
plot(diamonds$x,diamonds$y)
plot(diamonds$price,diamonds$carat)
plot(diamonds$table,diamonds$z)

#scatterplot for multiple variables/categories
library(ggplot2)
library(gridExtra)
library(cowplot)
ggplot(data = diamonds,aes(x=price,y=carat, color=cut))+
  geom_point()

attach(diamonds)

ggplot(data = diamonds,aes(x=x,y=y, color=color))+
  geom_point()

ggplot(data = diamonds,aes(x=table,y=depth, color=clarity))+
  geom_point()
