library(plm)
data("EmplUK",package = "plm")
View(EmplUK)
data("Grunfeld", package = "plm")
View(Grunfeld)

#group means over time
#changes in wage rate/ average weight rate over time
aggregate(wage~year, EmplUK, mean)
library(gplots)

plotmeans(wage~year, main="Heterogenineity across countries", data = EmplUK)

#plotmeans draw a 95% CI around the means
plotmeans(year~wage, main="Heterogenineity across countries", data = EmplUK)


#graphical methods for longitudinal data
#exploring the distribution of wage over time
library(gplots)
boxplot(wage~year, data = EmplUK)

#number of observations in each of the years
library(gplots)
barplot(table(EmplUK$year))


coplot(wage~year|sector, type="l", data=EmplUK) #lines
coplot(wage~year|sector, type="b", data=EmplUK) # Points and lines

library(car)
scatterplot(wage~year|sector, boxplots=FALSE, smooth=TRUE, reg.line=FALSE, data = EmplUK)

#exploring the correlation structure of the data
library(psych)

#producing basic plots
pairs(EmplUK, pch=19)

#show he upper part only
pairs(EmplUK, pch=19, lower.panel = NULL)


#the function pairs.panels() can be used to create a scatter plot of matrices, with bivariate scatter plots below the diagonal, histograms on the diagonal and Pearson correlation
library(psych)

pairs.panels(EmplUK, method = "pearson", hist.col = "pink", density = TRUE, ellipses = TRUE)


#ESTIMATED CPVARIANCE MATRIX
var(EmplUK)
cor(EmplUK)
