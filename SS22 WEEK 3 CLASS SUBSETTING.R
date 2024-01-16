#ecodes to wxclude certain columns
#code one: keeping varibables
data= 
names(data)
newdata=datac[("x","y")]

#method two: subset
data()
names(data)
newdata=subset(data, select= (x,y,z))

#method three : sekecting column
data 
newdata=data[c(2,5)] OR newdata=data[c(2:5)]


#CLASS BMI DATA R CODES 
> library(readxl)
> CLASS_BMI_DATA <- read_excel("Belinda's Classwork/SUMMER 2022/DAN4015/CLASS R PRACTICE/CLASS BMI DATA.xlsx")
> View(CLASS_BMI_DATA)

names(CLASS_BMI_DATA)
attach(CLASS_BMI_DATA)
summary(CLASS_BMI_DATA)
str(CLASS_BMI_DATA)
