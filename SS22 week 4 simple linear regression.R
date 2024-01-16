#week four: simple linear regression
#retriving diamonds data
library(ggplot2)
data(diamonds)
diamonds
names(diamonds)
summary(diamonds)
attach(diamonds)

#descriptions of variables
?diamonds

#simple linear model
fit<-lm(price~depth,data = diamonds)
summary(fit)

#statistis for linear regression, Rsqd, f statistics, residuals
summary(fit)

#regression ANOVA table
anova(fit)

#retriving coefficients
coef(fit)

#confidence interval
confint(fit)

#residuals
resid(fit)

#residual sum of squares
deviance(fit)

#variance-covariance matrix of parameters
vcov(fit)
