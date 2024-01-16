install.packages("mice")
library("mice")
data("nhanes") 
view(nhanes)
summary(nhanes)

#imputation
#let us build the code
is.na(nhanes$bmi)
is.na(nhanes$age)
is.na(nhanes$hyp)
is.na(nhanes$chl)

which(is.na(nhanes$age))
which(is.na(nhanes$hyp))
which(is.na(nhanes$chl))

#code for inputing using mean
nhanes$bmi[which(is.na(nhanes$bmi))]=mean(nhanes$bmi, na.rm = TRUE)
nhanes$hyp[which(is.na(nhanes$hyp))]=mean(nhanes$hyp, na.rm = TRUE)
nhanes$chl[which(is.na(nhanes$chl))]=mean(nhanes$chl, na.rm = TRUE)
nhanes

