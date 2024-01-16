#for the categorical data replace mode eg colour ettc


#step 1 #import data
library(readxl)
Car_Sales <- read_excel("Belinda's Classwork/SUMMER 2022/DAN4015/CAT 1/Car Sales.xlsx")
View(Car_Sales)
summary(Car_Sales)

#step 2 #replace #NULL! with NA
Car_Sales[Car_Sales=="#NULL!"]<-NA
View(Car_Sales)

#step 3 #know what the type of data the vaiables are 
sapply(Car_Sales, class)

#convert character data to numeric data
Car_Sales$resale<-as.numeric(as.character(Car_Sales$resale))

#code to see what rows have incomplete data
Car_Sales[!complete.cases(Car_Sales), ]

#code to see what rows have complete data
Car_Sales[complete.cases(Car_Sales), ]




Car_Sales$sales[is.na(Car_Sales$sales)]<-mean
Car_Sales$resale[is.na(Car_Sales$resale)]<-mean(Car_Sales$resale, na.rm = T)
Car_Sales$resale<-as.numeric(as.character(Car_Sales$resale))

#knowing what kind of the data the variables are 
sapply(Car_Sales, class)

#imputing using mean
Car_Sales$sales[is.na(Car_Sales$sales)]<-mean(Car_Sales$sales, na.rm = T)
Car_Sales$type[is.na(Car_Sales$type)]<-mean(Car_Sales$type, na.rm = T)



#imputing mean at all variables at once 
for (i in 1:ncol(Car_Sales) {
  Car_Sales[ ,i][is.na(Car_Sales[ ,i])]<-mean(Car_Sales[ ,i], na.rm = T)
}
  
Car_Sales[ ,i][is.na(Car_Sales[ ,i])]<-mean(Car_Sales[ ,i], na.rm = T)


#chnecking how many NA values there are 
library(dplyr)
Car_Sales%>%summarise_all(funs(sum(is.na(.))))

#MICW MICE MICEE
#Extract Unique Elements
unique(Car_Sales$model)

?unique

#Display missing-data patterns.
?md.pattern()
md.pattern(Car_Sales)

#MORE CLEAR DISPLAY OF MISSING VALUES
library(VIM)

aggr_plot<-aggr(Car_Sales, col=c("navyblue","red"),
                numbers=TRUE,
                sortVars=TRUE,
                labels=names(Car_Sales),
                cex.axis=.7,
                gap=3,
                ylab=c("Histogram of Misiing data","Pattern"))




library(mice)
#list of methods in a generic function
?methods
methods(mice)

imputednewdata<-mice(Car_Sales, m=5, method = "lmer")
imputednewdata<-mice(Car_Sales, m=5, method = "rf")
imputednewdata<-mice(Car_Sales, m=5, method = "mean")
summary(imputednewdata)
view(imputednewdata)
imputednewdata$re

finaldataset<-complete(imputednewdata,1)
view(finaldataset)
#MEDIAN
median(Car_Sales$sales)

Car_Sales[is.na(Car_Sales$resale)]<-median(Car_Sales$resale, na.rm = T)
print(Car_Sales)


#METHID 4: removing rows with NA
cardata[cardata=="#NULL!"]<-NA
cardata
carsalesdata<-na.omit(cardata)

cardata[rowSums(is.na(cardata))==0]









carsales[carsales=="#NULL!"]<-NA
View(carsales)
#convert character data to numeric data
carsales$resale<-as.numeric(as.character(carsales$resale))
carsales$mpg<-as.numeric(as.character(carsales$mpg))
# Replacing NA with median #imputation 
carsales$mpg[is.na(carsales$mpg)]<-median(carsales$mpg, na.rm = T)
carsales%>%summarise_all(funs(sum(is.na(.))))
summar