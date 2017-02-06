
pisatrain = read.csv("pisa2009train.csv")
pisatest = read.csv("pisa2009test.csv")
str(pisatrain)
str(pisatest)
tapply(pisatrain$male, pisatrain$readingScore, mean)
tapply(pisatrain$readingScore, pisatrain$male, mean)
summary(pisatrain)
pisaTrain = na.omit(pisatrain)
pisaTest = na.omit(pisatest)

str(pisaTrain)
str(pisaTest)

pisaTrain$raceeth = relevel(pisaTrain$raceeth, "White")
pisaTest$raceeth = relevel(pisaTest$raceeth, "White")

LinReg = lm(readingScore ~., data=pisaTraining)
LinReg = lm(readingScore ~., data=pisaTrain)

summary(LinReg)
SSE_PISA = sum(LinReg$residuals^2)
RMSE_PISA = sqrt(SSE_PISA/nrow(pisaTrain))
SSE_PISA
RMSE_PISA
grade = 9

studentA = data.frame(grade)
str(studentA)
predictTest = predict(LinReg, newdata=studentA)
predTest = predict(LinReg, newdata=pisaTest)
summary(pisaTest)
summary(predTest)
predTest
# 637.7 - 353.2

SSE_PISAtest = sum(LinReg$residuals^2)
SST = sum((mean(pisaTraining$readingScore) - pisaTest$readingScore)^2)
SST = sum((mean(pisaTrain$readingScore) - pisaTest$readingScore)^2)
SSE
SSE_PISAtest

RMSE_PISAtest = sqrt(SSE_PISAtest/nrow(pisaTest))
RMSE_PISAtest

SSE = sum((pisaTest$readingScore - predTest)^2)
SSE

RMSE_PISAtest = sqrt(SSE/nrow(pisaTest))
RMSE_PISAtest

sst <- sum((predTest - baseline)^2)
baseline = mean(pisaTrain$readingScore)
baseline

SSE_train = sum((predTest - baseline)^2)
SSE_train

SST = sum((pisaTest$readingScore - baseline)^2)
SST
SSE_test = sum((pisaTest$readingScore - predTest)^2)
SSE_test

SST_test = sum((mean(pisaTest$readingScore) - pisaTrain$readingScore)^2)
R2 = 1 - SSE_test / SST_test
R2

SST_test = sum((mean(pisaTrain$readingScore) - pisaTest$readingScore)^2)
SST_test

lmScore = lm(readingScore ~., data=pisaTrain)
predTest = predict(lmScore, newdata=pisaTest)
summary(predTest)
SSE_test = sum((pisaTest$readingScore - predTest)^2)
SSE_test

SST_test = sum((mean(pisaTest$readingScore) - pisaTrain$readingScore)^2)
SST_test

R2 = 1 - SSE_test / SST_test
R2

SST_test = sum((mean(pisaTrain$readingScore) - pisaTest$readingScore)^2)
SST_test

R2 = 1 - SSE_test / SST_test
R2