
FluTrain = read.csv("FluTrain.csv")
str(FluTrain)
summary(FluTrain)

maxILI = max(FluTrain$ILI)
maxILI

tapply(FluTrain$ILI, FluTrain$Week, max)

maxILI = sort(tapply(FluTrain$ILI, FluTrain$Week, max))
maxILI

maxILI = sort(tapply(FluTrain$Queries, FluTrain$Week, max))

maxQuery = sort(tapply(FluTrain$Queries, FluTrain$Week, max))
maxQuery

str(FluTrain)

plot(FluTrain$Week, FluTrain$ILI)
hist(FluTrain$Week, FluTrain$ILI)

plot(FluTrain$Queries, FluTrain$ILI)
hist(FluTrain$Queries, FluTrain$ILI)

hist(FluTrain$ILI)
hist(ln(FluTrain$ILI))

logILI = ln(FluTrain$ILI)
logILI = log(FluTrain$ILI)
summary(logILI)

str(logILI)
hist(logILI)
hist(FluTrain$Queries, FluTrain$logILI, na.rm = TRUE)

FluTrend1 = lm(logILI ~., data=FluTrain)
summary(FluTrend1)
str(FluTrend1)

FluTrend2 = lm(log(ILI) ~ Week + Queries, data=FluTrain)
summary(FulTrend2)

FluTrend3 = lm(log(ILI) ~ Queries, data = FluTrain)
summary(FluTrend3)

str(FluTrain)
FluTrain$date = relevel(FluTrain$date, "Week2011-12-25 - 2011-12-31")
dataset$column = as.factor(dataset$column)

Week$column = as.factor(dataset$column)
Week$column = as.factor(Week$column)

FluTrain$Week = as.factor(FluTrain$Week)
str(FluTrain)

FluTrend4 = lm(ILI ~ Queries, data = FluTrain)
summary(FluTrend4)

FluTrain = read.csv("FluTrain.csv")
str(FluTrain)
FluTrend1 = lm(ILI ~ Queries, data = FluTrain)
summary(FluTrend1)

FluTrend2 = lm(log(ILI) ~ Queries, data = FluTrain)
summary(FluTrend2)

FluTrend3 = lm(log(ILI) ~ Queries + Week, data = FluTrain)
summary(FluTrend3)

cor(FluTrain$log(ILI) FluTrain$Queries)
cor(FluTrain$logILI) FluTrain$Queries)
cor(FluTrain$Queries, FluTrain$ILI)
x = 0.709 / 0.8142115
x

a = exp(-0.5*0.8142115)
a

a = log(1/0.8142115)
a

cor(FluTrain$ILI, FluTrain$Queries)
cor(FluTrain$log(ILI), FluTrain$Queries)
logILI = log(FluTrain$ILI)
summary(logILI)

cor(logILI, FluTrain$Queries)
x = 0.709 / 0.8420333
x

a = exp(-0.5*0.8420333)
a

a = log(1/0.8420333)
a

FluTest = read.csv("FluTest.csv")
str(FluTest)

FluTrend2 = lm(log(ILI) ~ Queries, data = FluTrain)
PredTest = exp(predict(FluTrend2, newdata=FluTest))
FluTest$Week
table(FluTest$Week)

summary(FluTest$Week)

summary(PredTest)
str(PredTest)
table(PredTest$Week)
names(PredTest)
Predtest[11]
PredTest[11]
FluTest$ILI[11]
rel = (2.293422 - 2.187378)/2.293422
rel

SSE = sum((PredTest1 - Flutest$ILI)^2)
SSE = sum((PredTest1 - FluTest$ILI)^2)
SSE

RMSE = sqrt(SSE/nrow(FluTest))
RMSE

