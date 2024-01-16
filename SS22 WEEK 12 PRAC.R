summary(Car_Sales)
str(Car_Sales)

is.na(Car_Sales)
#handling missing values denoted by #NULL!
#replace #NULL! with NA then use na.missing() function to remove mssing  data

#replacing NULL with NA
Car_Sales[Car_Sales=="#NULL!"]<-NA
View(Car_Sales)

#omitting values with NA
library(tidyverse)
carsales<-na.omit(Car_Sales)
carsales



#IMPUTATION
Car_Sales$manufact[which(is.na(Car_Sales$manufact))]=mean(Car_Sales, na.rm = "TRUE")

Car_Sales[which(is.na(Car_Sales))]=mean(Car_Sales, na.rm = "TRUE")
