library(plm)
?`plm-package`
plm()
View(plm())
attach(plm())
data("Grunfeld")
View(Grunfeld)
attach(Grunfeld)


#RUNNING NORMAL OLS WITHOUT ACCOUNTING FOR PANEL STRUCTURE
model1=lm(inv~value+capital, data = Grunfeld)
summary(model1)

#POOLED OLS REGRESSION OF INVESTMENTS AGAINST VALUE AND CAPTIAL

model2=plm(inv~value+capital, data=Grunfeld, model="pooling")
summary(model2)

#BETWEEN PLS ESTIMATION OF INVESTMENTS AGAINST VALUE AND CAPITAL
model3=plm(inv~value+capital, data=Grunfeld, model="between")
summary(model3)

#POOLED OLS REGRESSION OF INVESTMENTS AGAINST VALUE AND CAPITAL "WITHIN"
model4=plm(inv~value+capital, data=Grunfeld, model="within")
summary(model4)

#FIRST DIFFERENCE ESTIMATION 
model5=plm(inv~value+capital, data=Grunfeld, model="fd")
summary(model5)

#RANDOM EFFECT ESTIMATION 

model6=plm(inv~value+capital, data=Grunfeld, model="random")
summary(model6)



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
