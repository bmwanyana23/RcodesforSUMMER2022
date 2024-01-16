#step 1 #import data
library(readxl)
Car_Sales <- read_excel("Belinda's Classwork/SUMMER 2022/DAN4015/CAT 1/Car Sales.xlsx")
View(Car_Sales)
summary(Car_Sales)
names(Car_Sales)

#exploring the data set with missing values 

#step 2 #replace #NULL! with NA
Car_Sales[Car_Sales=="#NULL!"]<-NA
View(Car_Sales)

#checking how many NA values there are 
library(dplyr)
Car_Sales%>%summarise_all(funs(sum(is.na(.))))


#code to see what rows have incomplete data
Car_Sales[!complete.cases(Car_Sales), ]

#Display missing-data patterns.
?md.pattern()
md.pattern(Car_Sales)

#MORE CLEAR DISPLAY OF MISSING VALUES
library(VIM)

aggr_plot<-aggr(Car_Sales, col=c("yellow","red"),
                numbers=TRUE,
                sortVars=TRUE,
                labels=names(Car_Sales),
                cex.axis=.7,
                gap=3,
                ylab=c("Histogram of Misiing data","Pattern"))

#step 3 #know what the type of data the variables are 
sapply(Car_Sales, class)

#convert character data to numeric data
Car_Sales$resale<-as.numeric(as.character(Car_Sales$resale))
Car_Sales$mpg<-as.numeric(as.character(Car_Sales$mpg))

#REPLACE NA with mean #imputation code
Car_Sales$resale[is.na(Car_Sales$resale)]<-mean(Car_Sales$resale, na.rm = T)
Car_Sales$mpg[is.na(Car_Sales$mpg)]<-mean(Car_Sales$mpg, na.rm = T)
View(Car_Sales)

Car_Sales%>%summarise_all(funs(sum(is.na(.))))

# Replacing NA with median #imputation codes
Car_Sales[is.na(Car_Sales$resale)]<-median(Car_Sales$resale, na.rm = T)
Car_Sales$mpg[is.na(Car_Sales$mpg)]<-median(Car_Sales$mpg, na.rm = T)

Car_Sales%>%summarise_all(funs(sum(is.na(.))))

#METHOD: MICE
library(mice)
#list of methods in a generic function
?methods
methods(mice)

imputeddata<-mice(Car_Sales, m=5, method = "rf")

?mice.impute.2l.lmer
imputednewdata<-mice(Car_Sales, m=5, method = "rf")
imputednewdata<-mice(Car_Sales, m=5, method = "lmer")
summary(imputednewdata)
view(imputednewdata)
finaldataset<-complete(imputednewdata,1)
View(finaldataset)

#OTHER METHOD
cardata[cardata=="#NULL!"]<-NA
cardata
carsalesdata<-na.omit(cardata)
View(carsalesdata)
summary(carsalesdata)

names(Car_Sales)

#QUESTION FOUR
#IMPORT, CONVERT NAs and impute missing data 
library(plm)
#create data frame/select variables
data1<-pdata.frame(Car_Sales, index = c("model", "manufact"))
keep<-c("sales", "resale","price")
data2<-data1[keep]

#model1-run OLS without taking into account the data structure
model1<-lm(engine_s~sales+resale+price,data= Car_Sales)
summary(model1)
#model2-OLS model using plm
model2<-plm(engine_s~sales+resale+price, data= Car_Sales, model = "pooling")
summary(model2)
#between
model3<-plm(engine_s~sales+resale+price, data = Car_Sales, model = "between")

summary(model3)
#first difference
model4<-plm(engine_s~sales+resale+price, data = Car_Sales, model = "fd")
summary(model4)
#fixed effect/within
model5<-plm(engine_s~sales+resale+price, data= Car_Sales, model = "within")
summary(model5)
#random effect
model6<-plm(engine_s~sales+resale+price, data= Car_Sales, model = "random")
summary(model6)

library(lmtest)      
bptest(model6)    
phtest(model5, model6)

#question 4 b
install.packages("geepack")
library(geepack)

regmodel<-geeglm(price~sales+resale, data = Car_Sales, family = gaussian(), id=model,corstr = "exchangeable")

summary(regmodel)

regmodel2<-geeglm(price~sales+resale, data = Car_Sales, family = indepedence, id=model,corstr = "exchangeable")

summary(regmodel2)

regmodel3<-geeglm(price~sales+resale, data = Car_Sales, family = poisson(), id=model,corstr = "exchangeable")

summary(regmodel3)

rm(list=ls())
dev.off()
