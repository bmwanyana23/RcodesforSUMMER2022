#apply functions in R
#apply #library(ggplot2)
#sapply
#lapply
#mapply

library(ggplot2)
data("diamonds")
attach(diamonds)

#explore using apply
#create new data set that has numerial variables #subsetting
#use sapply function to determine nuemric or character
sapply(diamonds, class)
head(diamonds)
names(diamonds)
newdata1=subset(diamonds, select = (depth:z))
#or
newdata1=diamonds[c("carat","depth","table","price","x","y","z")]
names(newdata1)
sapply(newdata1,class)

#missing values
library(dplyr)
diamonds%>%summarise_all(funs(is.na(.)))

#display rows and columns
dim(diamonds)

#use apply to select given row
apply(newdata1, MARGIN = 1, sum)
apply(newdata1, MARGIN = 2, sum)

#selecting few observations from a larger data set
nd=newdata1[1:3, ]
nd
apply(nd,MARGIN = 2, sum)#sum of each column 
apply(nd,MARGIN = 1, sum) #sum of each row
apply(nd,MARGIN = 2, mean)
apply(nd,MARGIN = 1, mean)
#etc

#lapply
lapply(newdata1,sum)
lapply(newdata1,mean)

#mapply #used to apply a function to multiple list or vector arguments.
mapply(sum,...,MoreArgs=NULL,SIMPLIFY = TRUE,USE.NAMES = TRUE)
mapply(sum, ,MoreArgs=NULL,SIMPLIFY = TRUE,USE.NAMES = TRUE)


#visualising data 
#using geo,_histogram()
#histogramfordepth
ggplot(data = diamonds, aes(x=depth))+
  geom_histogram(fill="pink",color="black")+
  ggtitle("Histogram of Depth")
