#CSV
#KEEPING VARIABLES
data<-read.csv(file.choose(),header = T)
names(data)
attach(data)
ndata=data[c("BMI","AGE", "HEIGHT","WEIGHT")]
ndata

#subsetting
names(data)
ndata1=subset(data, select = (BMI:WEIGHT))
names(ndata1)

#selecting columns 
ndata2=data[c(2:5)]
ndata2


#FITTING LINEAR REGRESSION MODEL
fit<-lm(BMI~AGE+HEIGHT+WEIGHT,data = ndata2)
summary(fit)


#selecting few observations from a larger data set
nd=newdata1[1:3, ]