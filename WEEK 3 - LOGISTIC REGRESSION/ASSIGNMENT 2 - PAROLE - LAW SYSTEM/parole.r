parole = read.csv("parole.csv")
str(parole)
summary(parole)
table(parole$violator)
parole$state = as.factor(parole$state)
parole$crime = as.factor(parole$crime)
str(parole)
summary(parole)
summary(parole$state)
table(parole$state)
summary(parole$crime)
table(parole$crime)
str(parole$crime)
str(parole$state)

set.seed(144)

library(caTools)
split = sample.split(parole$violator, SplitRatio = 0.7)
train = subset(parole, split == TRUE)
test = subset(parole, split == FALSE)

str(train)
str(test)

set.seed(102)
library(caTools)

split = sample.split(parole$violator, SplitRatio = 0.7)
train2 = subset(parole, split == TRUE)
test2 = subset(parole, split == FALSE)
str(train2)
str(test2)
set.seed(256)
library(caTools)
split = sample.split(parole$violator, SplitRatio = 0.7)
train3 = subset(parole, split == TRUE)
test3 = subset(parole, split == FALSE)
str(train3)
str(test3)
trainLog = glm(violator ~ ., data = train, family=binomial)
sumary(trainLog)
summary(trainLog)

val = 0.3869904 + (1 * 0.8867192) + (50 * (-0.0001756)) + (3 * (-0.1238867)) +  (12 * 0.0802954) + (2 * 0.6837143)
val

exp(3.224243)

val = -4.2411574 + 0.3869904 + (1 * 0.8867192) + (50 * (-0.0001756)) + (3 * (-0.1238867)) +  (12 * 0.0802954) + (0.6837143)
val

exp(-1.700629)

mod1 = predict(trainLog, "type=response")
table(Train$Republican, pred1 >= 0.5)
table(Train$Republican, pred1 >= 0.5)
predictTest = predict(trainLog, type="response", newdata=test)
summary(predictTest)
table(test$violator, predictTest > 0.5)

sensitivity = 12 / 23
sensitivity

specificity = 167 / (167 + 12)
specificity

acc = (167 + 12) / (167 + 12 + 11 + 12) 
acc

table(test$violator)
baseline = 179 / 202
baseline
table(test$violator, predictTest > 0.6)
table(test$violator, predictTest > 0.3)
table(test$violator, predictTest > 0.45)
table(test$violator, predictTest > 0.47)

library(ROCR)
ROCRpred = prediction(predictTest, test$violator)
summary(ROCRpred)
as.numeric(performance(ROCRpred, "auc")@y.values)

summary(trainLog)

# val = 0.3869904 + (1 * 0.8867192) + (50 * (-0.0001756)) + (3 * (-0.1238867)) +  (12 * 0.0802954) + (2 * 0.6837143)
val = -4.2411574 + 0.3869904 + (1 * 0.8867192) + (50 * (-0.0001756)) + (3 * (-0.1238867)) +  (12 * 0.0802954) + (0.6837143)
val

exp(-1.700629)

p = 1 / (1 + 0.1825687)
p

p = 1 / 1 + exp(-0.1825687)

p
exp(1.700629)

1 / (1 + 5.477392)