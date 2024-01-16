#ANALYSIS 0F VARIANCE
#retriving data 
library(ggplot2)
data("diamonds")
diamonds
names(diamonds)

#subsetting
diamondsubset<-diamonds[c(4,5)]
names(diamondsubset)
str(diamondsubset)
summary(diamondsubset)

#seleting 30 variables to work with #slice #package is dplyr
newdata<-diamondsubset%>%slice(1:30)
newdata
names(newdata)

?slice

#CHECKING FOR OUTLIERS #package is rstatix
library(rstatix)
newdata%>%
group_by(clarity)%>%
  identify_outliers(depth)

#checking for outliersusing box plot #groupedbox plot
library(ggplot2)
ggplot(newdata,aes(x=depth, fill=clarity))+geom_boxplot()
newdata2=subset(diamonds, select=c(depth,clarity))

#checking for normality #shapiro needs a bigger test 
shapiro.test(newdata$depth)
gqqplot(diamonds,"depth",facet.by="clarity")

#qq plot
newdata%>%
  group_by(clarity)
shapiro_test(newdata$depth)


ggqqplot(newdata,"depth",facet.by="clarity")


#homogenecity #levene test
levene_test(depth~clarity,data = newdata)
#alternative code
newdata%>%levene_test(depth~clarity)

#computing ANOVA
model1=aov(depth~clarity,data = newdata)
summary(model1)


#finaly, post hoc:tuckeyHSD
post1=newdata%>%tukey_hsd(depth~clarity)
post1


















