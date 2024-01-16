#dealing with missing data
library(finalfit)

data("colon_s")
View(colon_s)
names(colon_s)

#plot to showus the missing values
#showing which values have missing data
#lines represent the missing data
colon_s%>%
  missing_plot()  


#not dure what all these codes mean:(
#creating extramissing data #somking missing completely at random
set.seed(1)
colon_s$smoking_mcar=sample(c("smoker","non-smoker",NA)),
  dim(colon_s)[1], replace=TRUE,
  prob=c(0.2,0.7,0.1))%>%
factor()%>%
    ff_label("Smokinh(MCAR)")
Smokinh(MCAR)


#sum of missing values in each column
colSums(is.na(colon_s))        


#using package MICE to handle missing values
#loading the data
data<-iris
summary(iris)
names(iris)
#sum of missing values in each column
colSums(is.na(iris))
#generating some missing values #prodna Artificially introduces missing valuesv
#package is misssForest
library(missForest)
iris.mis <- prodNA(iris, noNA = 0.1)
summary(iris.mis)
colSums(is.na(iris.mis))

# Removing categorical data #subsetting
iris.mis <- subset(iris.mis, select = -c(Species))
summary(iris.mis)
names(iris.mis)

install.packages("mice")
library(mice)

#visualising the missing data
install.packages("VIM")
library(VIM)

mice_plot <- aggr(iris.mis, col=c('navyblue','yellow'),
                  numbers=TRUE, sortVars=TRUE,
                  labels=names(iris.mis), cex.axis=0.8,
                  gap=2, ylab=c("Missing data","Pattern"))
