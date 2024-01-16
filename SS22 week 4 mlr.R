library(datarium)
data(marketing)
marketing 

#viewing a summary of the data
head(marketing, 8)

fit<-lm(sales~newspaper+youtube+facebook, data = marketing)
summary(fit)
anova(fit)

