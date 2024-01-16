summary(Customer_Data_Exam)
names(Customer_Data_Exam)

#exploring the data set with missing values 
#checking how many NA values there are 
library(dplyr)
Customer_Data_Exam%>%summarise_all(funs(sum(is.na(.))))

#code to see what rows have incomplete data
Customer_Data_Exam[!complete.cases(Customer_Data_Exam), ]

#Display missing-data patterns.
library(mice)
md.pattern(Customer_Data_Exam)

library(finalfit)
Customer_Data_Exam%>%
  missing_plot()


#MORE CLEAR DISPLAY OF MISSING VALUES
library(VIM)

aggr_plot<-aggr(Customer_Data_Exam, col=c("yellow","red"),
                numbers=TRUE,
                sortVars=TRUE,
                labels=names(Customer_Data_Exam),
                cex.axis=.7,
                gap=3,
                ylab=c("Histogram of Missing data","Pattern"))
#since R is not recognising N/A, chage N/A to NA
#replace N/A with NA
Customer_Data_Exam[Customer_Data_Exam=="N/A"]<-NA
View(Customer_Data_Exam)
Customer_Data_Exam%>%summarise_all(funs(sum(is.na(.))))

#know what the type of data the variables are 
sapply(Customer_Data_Exam, class)

#sub-setting the data
newcustomerdata=Customer_Data_Exam[c("income", "age","debtinc","creddebt","othdebt","ed","carvalue","...14","employ","cardspent","lninc","card2spent","hourstv","commutetime")]

names(newcustomerdata)
  
sapply(newcustomerdata, class)
newcustomerdata<-as.numeric(as.character(newcustomerdata))

#REPLACE NA with mean #imputation code
customsdata<-newcustomerdata[is.na(newcustomerdata)]<-mean(newcustomerdata, na.rm = T)
View(Customer_Data_Exam)
CustomerData<-Customer_Data_Exam



#REPLACE NA with mean #imputation code
Customer_Data_Exam[is.na(Customer_Data_Exam)]<-mean(Customer_Data_Exam, na.rm = T)
View(Customer_Data_Exam)
CustomerData<-Customer_Data_Exam

#convert character data to numeric data
customerssdata<-Customer_Data_Exam>%>
  mutate_at(c("income", "age","debtinc","creddebt","othdebt","ed","carvalue","...14","employ","cardspent","lninc","card2spent","hourstv","commutetime"), as.numeric())
View(Customer_Data_Exam)

Customer_Data_Exam<-as.numeric(as.character(Customer_Data_Exam))
Car_Sales$resale[is.na(Car_Sales$resale)]<-mean(Car_Sales$resale, na.rm = T)
Car_Sales$mpg[is.na(Car_Sales$mpg)]<-mean(Car_Sales$mpg, na.rm = T)