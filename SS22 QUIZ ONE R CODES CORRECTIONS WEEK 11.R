#QUIZ ONE CPRRECTIONS
#Importing car sales data
library(readxl)
Car_Sales <- read_excel("Belinda's Classwork/SUMMER 2022/DAN4015/CAT 1/Car Sales.xlsx")
View(Car_Sales)

#dispay first three observationa
head(Car_Sales, 3)
#(paste r output display9ng imported data only)

#remove/delete missing values denoted by #NULL!
#replace #NULL! with NA then use na.missing() function to remove mssing  data

#replacing NULL with NA
Car_Sales[Car_Sales=="#NULL!"]<-NA
View(Car_Sales)

#omitting values with NA
library(tidyverse)
carsales<-na.omit(Car_Sales)
carsales

#create new data set with three numeric variables
#add time aspect into the data to make it repeated measures

library(dplyr)
select_if(carsales, is.numeric)

names(carsales)
attach(carsales)
carsaleset1=carsales(c("sales","price","fuel_cap"))
names(carsaleset1)

years<-rep(2020,2021,2022),times=42
carsales2=cbind((carsaleset1, years))

