head(longdata,4)
names(longdata)
longdata2=longdata[c(2:5)]
names(longdata2)

#mkaing data from wide to long  #doesnt work
library(tidyr)
longd<-gather(longdata, condition, measurement, cohort:WEIGHT_y3,factor_key = TRUE)
longd

#convert data from wide to long #package is reshape2 #works very well
#general code is: newdata<-melt(data, id.vars=c("id","cohort"), measure.vars=c(weight_y1,weight_y2,weight_y3))
library(reshape2)
longgdd=melt(longdata, id.vars=c("INDIVIDUAL","COHORT") #arnold code
longitud=melt(longdata, id.vars=c("INDIVIDUAL","COHORT"), measure.vars = c("WEIGHT_y1","WEIGHT_y2","WEIGHT_y3")) #esther code
longgdd
longitud
view(longitud)
