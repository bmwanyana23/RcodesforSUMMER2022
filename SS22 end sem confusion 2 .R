newdata<-Customer_Data_Exam%>%
  mutate_at(c("income", "age","debtinc","creddebt","othdebt","ed","carvalue","...14","employ","cardspent","lninc","card2spent","hourstv","commutetime"), as.numeric)

newcustomerdata=select(newdata, -1, -2, -4, -6, -10, -13, -14, -15, -16, -18, -19, -22)

customersdataexam=newcustomerdata%>%
  mutate_if(is.numeric, ~replace_na(.,mean(.,na.rm=TRUE)))

sapply(newcustomerdata, class)

newcustomerdata[is.na(newcustomerdata)]<-mean(newcustomerdata,na.rm = T)
summary(newcustomerdata)

library(mice)
inputedcustomerdata<-mice(newcustomerdata, m=10, method = "rf")

summary(inputedcustomerdata)
view(inputedcustomerdata)
finalcustomerdataset<-complete(inputedcustomerdata,1)
View(finalcustomerdataset)
