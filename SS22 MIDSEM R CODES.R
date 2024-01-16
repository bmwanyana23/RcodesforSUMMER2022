names(customerdata)

#installing packages
library(tidyverse)
library(dplyr)
library(ggplot2)
library(rstatix)

#handling missing variables
library(dplyr)
customersdata=na.omit(customerdata)
customersdata

customerdata1=customersdata%>%
  mutate_at(c("townsize",as.numeric())
  )

#creating longitudinal dataset with time aspect
newcustomerdata<-customerdata[c(5,15,19,20)]
names(newcustomerdata)

#select appropriate number of variables to work with
library(dplyr)
customersdata<-newcustomerdata%>%slice(20:70)
customersdata
names(customersdata)

#cleaning the dataset
cleancustomsdata=na.omit(customsdata)
names(cleancustomsdata)

#removing specific columns with missing data
view(customersdata)
customsdata<-customersdata[-c(3,16,38,47),]
names(customsdata)
view(customsdata)

#exploring using longitudinal data using any appropriate graphical technique 
library(rstatix)
library(tidyverse)
library(datarium)
library(ggplot2)

ggplot(customsdata,aes(x=age,fill=income))+geom_boxplot()
ggplot(customsdata,aes(x=age,fill=creddebt))+geom_boxplot()
ggplot(customsdata,aes(x=age,fill=othdebt))+geom_boxplot()


ggplot(customsdata,aes(x=age,y=income,fill=creddebt))+geom_boxplot()
ggqqplot(customsdata,"age",facet.by="income")

#statistical technique for exploring the data: REPEATED MEASURES ANOVA
fit<-aov(age~income+creddebt+othdebt, data = customsdata)
summary(fit)
anova(fit1)

#mlr variables
names(customerdata)
mlrvariablescustomsdata<-customerdata[c(5,8,15,37)]
names(mlrvariablescustomsdata)
mlrmodel<-lm(age~ed+income+commutetime, data = mlrvariablescustomsdata )
summary(mlrmodel)
anova(mlrvariablescustomsdata)

fit<-lm(sales~newspaper+youtube+facebook, data = marketing)

#ONE WAY ANOVA
library(ggplot2)
anovavariablescustomsdata<-customerdata[c(5,19,20)]
                                        