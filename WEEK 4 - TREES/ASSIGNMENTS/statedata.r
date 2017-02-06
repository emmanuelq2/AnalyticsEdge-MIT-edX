


data(state)

statedata = data.frame(state.x77)
statedata = read.csv("statedataSimple.csv")
# statedata = read.csv("statedata.csv")
census = read.csv("census.csv")
statedata = read.csv("statedata.csv")
str(statedata)
statedata = read.csv("statedataSimple.csv")
str(statedataSimple)
str(statedata)

model = lm(Life.Exp ~., data=statedata)
SSE = sum(model$residuals^2)
SSE

summary(model)

model = lm(Life.Exp ~ Population + Murder + HS.Grad + Frost, data=statedata)
summary(model)
SSE = sum(model$residuals^2)
SSE

cor(statedata$Life.Exp, statedata$Income)
cor(statedata$Life.Exp, statedata$Illiteracy)
cor(statedata$Life.Exp, statedata$Area)

predCART = rpart(Life.Exp ~., data = statedata)
prp(PredCART)
prp(predCART)

SSE = sum(predCART$residuals^2)
SSE

PredictCART = predict(predCART, newdata = statedata)
SSE = sum(PredictCART$residuals^2)
sum((statedata$Life.Exp - PredictCART)^2)

predCART = rpart(Life.Exp ~., data = statedata, minbucket = 5)
prp(predCART)

PredictCART = predict(predCART, newdata = statedata)
sum((statedata$Life.Exp - PredictCART)^2)
predCART = rpart(Life.Exp ~ Area, data = statedata, minbucket = 1)

PredictCART = predict(predCART, newdata = statedata)
sum((statedata$Life.Exp - PredictCART)^2)

set.seed(111)
numFolds = trainControl( method = "cv", number = 10 )
cpGrid = expand.grid( .cp = seq(0.01,0.5,0.01)) 
train(Reverse ~ Circuit + Issue + Petitioner + Respondent + LowerCourt + Unconst, data = Train, method = "rpart", trControl = numFolds, 
	tuneGrid = cpGrid )
train(Life.Exp ~., data = statedata, method = "rpart", trControl = numFolds, tuneGrid = cpGrid)

predCART = rpart(Life.Exp ~ Area, data = statedata, cp=0.12)
prp(predCART)

predCART = rpart(Life.Exp ~., data = statedata, cp=0.12)
prp(predCART)
PredictCART = predict(predCART, newdata = statedata)
sum((statedata$Life.Exp - PredictCART)^2)

set.seed(111)
numFolds = trainControl( method = "cv", number = 10)
cpGrid = expand.grid( .cp = seq(0.01,0.5,0.01)) 

train(Life.Exp ~ Area, data = statedata, method = "rpart", trControl = numFolds, tuneGrid = cpGrid)
predCART = rpart(Life.Exp ~ Area, data = statedata, cp=0.02)
prp(predCART)

