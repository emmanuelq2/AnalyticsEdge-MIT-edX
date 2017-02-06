

gerber = read.csv("gerber")
gerber = read.csv("gerber.csv")
str(gerber)
summary(gerber)
sum(gerber$hawthorne)
sum(gerber$civicduty)
sum(gerber$neighbors)
sum(gerber$self)

modlm = glm(voting ~ hawthorne + civicduty + neighbors + self)
modlm = glm(gerber$voting ~ hawthorne + civicduty + neighbors + self)
modlm = glm(voting ~ hawthorne + civicduty + neighbors + self, data = gerber)
summary(modlm)

pred = predict(modlm, type="response")
table(gerber$voting, pred >= 0.3)
acc = (134513 + 51966) / 344084
acc

table(gerber$voting, pred >= 0.5)
acc = (235388) / 344084
acc

library(ROCR)
ROCRpred = prediction(pred, gerber$voting)
as.numeric(performance(ROCRpred, "auc")@y.values)
CARTmodel = rpart(voting ~ civicduty + hawthorne + self + neighbors, data = gerber)
prp(CARTmodel)

CARTmodel2 = rpart(voting ~ civicduty + hawthorne + self + neighbors + sex, data = gerber, cp=0.0)
prp(CARTmodel2)

CARTmodel3 = rpart(voting ~ civicduty + hawthorne + self + neighbors + sex, data = gerber, cp=0.0)
prp(CARTmodel3)

ControlTree = rpart(voting ~ control, data = gerber, cp=0.0)
ControlSexTree = rpart(voting ~ control + sex, data = gerber, cp=0.0)
prp(ControlTree)
prp(ControlTree, digits=6)
abs = 0.34-0.296638
abs
prp(ControlSexTree, digits=6)
men = 0.334176 - 0.290456
men
women = 0.345818 - 0.302795
women
modlm2 = glm(voting ~ sex + control, data = gerber)
modlm2 = glm(voting ~ sex + control, data = gerber)
summary(modlm2)
Possibilities = data.frame(sex=c(0,0,1,1),control=c(0,1,0,1))
pred = predict(modlm2, newdata=Possibilities, type="response")
prp(ControlSexTree, digits=6)

woman = 0.345818
table(Possibilities, pred)
str(Possibilities)

table(Possibilities$sex, pred)
table(Possibilities$control, pred)
womenlm = 0.333982

diff = woman - womenlm
diff

woman = 0.302795
diff = woman - womenlm
diff

woman = 0.290456
diff = woman - womenlm
diff


LogModel2 = glm(voting ~ sex + control + sex:control, data = gerber, family="binomial")
summary(LogModel2)

modlm2 = glm(voting ~ sex + control, data = gerber)
summary(modlm2)
LogModel2 = glm(voting ~ sex + control + sex:control, data=gerber, family="binomial")
