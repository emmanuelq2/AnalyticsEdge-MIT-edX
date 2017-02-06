Claims = read.csv("ClaimsData.csv")
str(Claims)
table(Claims$bucket2009) / nrow(Claims)

library(caTools)
set.seed(88)
spl = sample.split(Claims$bucket2009, SplitRatio = 0.6)
ClaimsTrain = subset(Claims, spl == TRUE)
ClaimsTest = subset(Claims, spl == FALSE)
str(ClaimsTrain)
str(ClaimsTest)
summary(ClaimsTrain)
table(ClaimsTest$bucket2009, ClaimsTestŢucket2008)
table(ClaimsTest$bucket2009, ClaimsTest$bucket2008)
# acc = {110138 + 10721 + 2774 + 1539 + 104) / nrow(ClaimsTest)
# acc = (110138 + 10721 + 2774 + 1539 + 104) / nrow(ClaimsTest)
# acc
acc = (110138 + 10721 + 2774 + 1539 + 104) / 183202
acc

PenaltyMatrix = matrix(c(0,1,2,3,4,2,0,1,2,3,4,2,0,1,2,6,4,2,0,1,8,6,4,2,0),byrow=TRUE, nrow=5)
PenaltyMatrix

as.matrix(table(ClaimsTest$bucket2009, ClaimsTest$bucket2008)) * PenaltyMatrix
sum(as.matrix(table(ClaimsTest$bucket2009, ClaimsTest$bucket2008)) * PenaltyMatrix) / nrow(ClaimsTest)
baseline = (110138 + 7787 + 3427 + 1452 + 174) / 183202
baseline

library(rpart)
library(rpart.plot)

ClaimsTree = rpart(bucket2009 ~ age + arthritis + cancer + copd + depression + diabetes + heart.failure + kidney + osteoporosis + bucket2008, 
	reimbursement2008, data=ClaimsTrain, method="class", cp=0.00005)
str(ClaimsTree)
prp(ClaimsTree)
PredictTest = predict(ClaimsTree, newdata=ClaimsTest, type="class")
table(ClaimsTest$bucket2009, PredictTest)
acc = (115829 + 13345 + 393 + 462 + 4)/nrow(ClaimsTest)
acc

as.matrix(table(ClaimsTest$bucket2009, PredictTest)) * PenaltyMatrix
sum(as.matrix(table(ClaimsTest$bucket2009, PredictTest)) * PenaltyMatrix) / nrow(ClaimsTest)
ClaimsTree = rpart(bucket2009 ~ age + arthritis + cancer + copd + depression + diabetes + heart.failure + kidney + osteoporosis + bucket2008, 
	reimbursement2008, data=ClaimsTrain, method="class", cp=0.00005, parms=list(loss=PenaltyMatrix))
PredictTest = predict(ClaimsTree, newdata=ClaimsTest, type="class")
table(ClaimsTest$bucket2009, PredictTest)
acc = (79319 + 21959 + 4254 + 713 + 7) / nrow(ClaimsTest)
acc
sum(as.matrix(table(ClaimsTest$bucket2009, PredictTest)) * PenaltyMatrix) / nrow(ClaimsTest)