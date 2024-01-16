library(plm)
library(wooldridge)
data(rental)
View(rental)
names(rental)

#create data frame/select variabkles 
data1<-pdata.frame(rental,index = c("city","year"))
keep<-c("rent","pop","avginc","pctstu")
data2<-data1[keep]

#model1-run OLS without taking into account the data structure
model1<-lm(rent~pop+avginc+pctstu,data=rental)
summary(model1)

#model2-OLS model using plm
model2<-plm(rent~pop+avginc+pctstu,data=rental, model = "pooling", index = c("city","year"))
summary(model2)




#the higher the r squared, the better the model.


#other models #with index
#between
model2<-plm(rent~pop+avginc+pctstu,data=rental, model = "pooling", index = c("city","year"))
summary(model2)

#first difference
model2<-plm(rent~pop+avginc+pctstu,data=rental, model = "pooling", index = c("city","year"))
summary(model2)

#fixed effect/within
model2<-plm(rent~pop+avginc+pctstu,data=rental, model = "pooling", index = c("city","year"))
summary(model2)

#random effect
model2<-plm(rent~pop+avginc+pctstu,data=rental, model = "pooling", index = c("city","year"))
summary(model2)


#other models #without index
#between
model3<-plm(rent~pop+avginc+pctstu, data=rental, model = "between")
summary(model3)

#first difference
model4<-plm(rent~pop+avginc+pctstu,data=rental, model = "fd")
summary(model4)

#fixed effect/within
model5<-plm(rent~pop+avginc+pctstu,data=rental, model = "within")
summary(model5)

#random effect
model6<-plm(rent~pop+avginc+pctstu,data=rental, model = "random")
summary(model6)


#i copied and pated these from last weeks work so take note of the models


#lm test:determine whether random effect model is the best against OLS
#Ho: random effect is inappropriate
lmtest(model6)
#alternatively
bptest(model6)

#PLM TEST: DETERMINE BETWEEN FIXED EFFECT AND OLS:
pFtest(model5,model1)
#Ho: Fixed effect is inappropriate


#hausman test: determine between fixed effect & random effect: 
phtest(model5,model6)
#Ho: fixed effect model is inappropriate







