


loans = read.csv("loans.csv")
str(loans)
summary(loans)

missingvalues = subset(loans, is.na(loans) == TRUE)
str(missingvalues)

library(mice)

set.seed(144)

vars.for.imputation = setdiff(names(loans), "not.fully.paid")
imputed = complete(mice(loans[vars.for.imputation]))
loans[vars.for.imputation] = imputed

loansimp = read.csv("loans_imputed.csv")
str(loansimp)
summary(loansimp)

set.seed(102)
library(caTools)
split = sample.split(loansimp$not.fully.paid, SplitRatio = 0.7)
train = = subset(loansimp, split == TRUE)
train = (subset(loansimp, split == TRUE)
train = subset(loansimp, split == TRUE)
train = subset(loansimp, split == TRUE)
test = subset(loansimp, split == FALSE)
str(train)
str(test)
summary(train)

trainLog = glm(not.fully.paid ~ ., data = train, family=binomial)
summary(trainLog)
str(loans)
summary(loans)

set.seed(102)
set.seed(144)
library(caTools)
split = sample.split(loans$not.fully.paid, SplitRatio = 0.7)
train2 = subset(loans, split == TRUE)
test2 = subset(loans, split == FALSE)
str(train2)
summary(train2)
train2Log = glm(not.fully.paid ~ ., data = train2, family=binomial)
summary(train2Log)
# -0.009317
# 710 * (-0.009317)
exp(-6.61507)
exp(-0.009317)

trainLog = glm(not.fully.paid ~ ., data = train, family=binomial)
summary(trainLog)
str(test)
predictTest = predict(trainLog, type="response", newdata=test)
table(test$not.fully.paid, predictTest > 0.5)
# 2413 / 2873
 
library(ROCR)
ROCRpred = prediction(predictTest, test$not.fully.paid)
summary(ROCRpred)
as.numeric(performance(ROCRpred, "auc")@y.values)

trainLog2 = glm(not.fully.paid ~ int.rate, data = train, family=binomial)
summary(trainLog2)
predictTest = predict(trainLog2, type="response", newdata=test)
table(test$not.fully.paid, predictTest > 0.5)
# 460 / 2873

ROCRpred2 = prediction(predictTest, test$not.fully.paid)
summary(ROCRpred2)
as.numeric(performance(ROCRpred, "auc")@y.values)
as.numeric(performance(ROCRpred2, "auc")@y.values)

1.06 * 1.06 * 1.06
log(1)
exp(0)
exp(-1)
1 / (1 + 0.3678794)
exp(1)
1 / (1 - 2.718282)
exp(2.718282)
1 / (1 + 15.15426)
exp(-1)
1 / (1 + 0.3678794)
1 / (1 + exp(1))
# -9.406e-03 * 10

logA = (9.260e+00) + (700 *  -9.406e-03)
logA

logB = (9.260e+00) + (710 *  -9.406e-03)
logB

exp(2.6758)
exp(2.58174)

# 14.52396 / 13.22012
# 16 / 2873

summary(predictTest)

10 * (exp(0.06*3))

test$profit = exp(test$int.rate*3) - 1
test$profit[test$not.fully.paid == 1] = -1

summary(test¤profit)
summary(test$profit)

highinterest = subset(test, int.rate > 0.15)
str(highinterest)

table(not.fully.paid)
summary(not.fully.paid)

table(highinterest$not.fully.paid)
rate = 110 / 437
rate

table(highinterest$int.rate)
summary(highinterest$int.rate)
mean(highinterest$int.rate)
highinterest = subset(test, int.rate >= 0.15)
summary(highinterest$profit)
cutoff = sort(highInterest$predicted.risk, decreasing=FALSE)[100]
cutoff = sort(highinterest$predicted.risk, decreasing=FALSE)[100]
selectedLoans = subset(highinterest, highinterest$predicted.risk <= cutoff)

str(selectedLoans)
nrow(selectedLoans)

str(cutoff)
selectedLoans = subset(highinterest, predicted.risk <= cutoff)
summary(highinterest)
cutoff = sort(highinterest$predicted.risk, decreasing=FALSE)[100]
selectedLoans = subset(highinterest, predicted.risk <= cutoff) 
str(selectedLoans)
str(cutoff)


loansimp = read.csv("loans_imputed.csv")
str(loansimp)
summary(loansimp)
set.seed(144)

library(caTools)
split = sample.split(loansimp$not.fully.paid, SplitRatio = 0.7)
train2 = subset(loansimp, split == TRUE)
test2 = subset(loansimp, split == FALSE)
str(train2)
str(test2)

highinterest = subset(test2, int.rate > 0.15)
cutoff = sort(highinterest$predicted.risk, decreasing=FALSE)[100]
selectedLoans = subset(highinterest, predicted.risk <= cutoff) 
test$predicted.risk = predict(trainLog, type="response", newdata=test)
table(test$not.fully.paid, test$predicted.risk > 0.5)
highinterest = subset(test, int.rate >= 0.15)
summary(highinterest)

cutoff = sort(highinterest$predicted.risk, decreasing=FALSE)[100]
selectedLoans = subset(highinterest, predicted.risk <= cutoff) 
sum(selectedLoans$profit)
tabletable(selectedLoans$not.fully.paid) 
table(selectedLoans$not.fully.paid) 
test$predicted.risk = predict(trainLog, type="response", newdata=test2)

str(test2)
test2$predicted.risk = predict(trainLog, type="response", newdata=test2)
str(test2)
highinterest = subset(test2, int.rate >= 0.15)
str(highinterest)

cutoff = sort(highinterest$predicted.risk, decreasing=FALSE)[100]
selectedLoans = subset(highinterest, predicted.risk <= cutoff) 
sum(selectedLoans$profit)
str(selectedLoans)
test2$profit = exp(test2$int.rate*3) - 1
test2$profit[test2$not.fully.paid == 1] = -1
highinterest = subset(test2, int.rate >= 0.15)

str(highinterest)
cutoff = sort(highinterest$predicted.risk, decreasing=FALSE)[100]
selectedLoans = subset(highinterest, predicted.risk <= cutoff) 
sum(selectedLoans$profit)
str(selectedLoans)
