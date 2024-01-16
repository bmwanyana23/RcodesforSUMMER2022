#retriving the data
library(readxl)
CLASS_BMI_DATA <- read_excel("Belinda's Classwork/SUMMER 2022/DAN4015/CLASS R PRACTICE/CLASS BMI DATA.xlsx")
View(CLASS_BMI_DATA)
names(CLASS_BMI_DATA)

#retriving the linear model
linearmodel=lm(BMI~AGE+WEIGHT+HEIGHT)
summary(linearmodel)

#running one way anova
library(readxl)
cohortdata <- read_excel("Belinda's Classwork/SUMMER 2022/DAN4015/CLASS R PRACTICE/COHORT DATA.xlsx")
summary(cohortdata)
names(cohortdata)

#subsetting
cohortdata2=cohortdata[c("WEIGHT", "COHORT")]
cohortdata2

anovafit=aov(WEIGHT~COHORT, data = cohortdata2)
summary(anovafit)
