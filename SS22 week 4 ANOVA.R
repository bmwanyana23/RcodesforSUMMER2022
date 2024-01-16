#ANALYSIS 0F VARIANCE
#retriving data 
library(ggplot2)
data("diamonds")
diamonds
head(diamonds,10)
names(diamonds)

#TESTING FOR THE ASSUMPTIONS OF ANOVA
library(tidyverse)
library(ggpubr)
library(rstatix)
library(broom)

#CHECKING FOR OUTLIERS
diamonds %>% 
group_by(cut)%>%
identify_outliers(depth)

#checking for normality
shapiro.test(depth)
gqqplot(diamonds,"depth",facet.by="cut")


#homogenecity
levene_test(depth~cut,data = diamonds)

model2<-aov(depth~cut,data = diamonds)
model2
summary(model2)

#post hoc using tuckeyHSD
tukey_hsd(depth~cat, data=diamonds)
