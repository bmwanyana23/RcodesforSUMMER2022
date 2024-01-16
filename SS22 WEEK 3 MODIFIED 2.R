#intro to longitudinal data analysis
#r inbuilt data

library(nlme)
data("BodyWeight");
BodyWeight

names(BodyWeight)

#number of rats
library(dplyr)
count(BodyWeight,Rat)
