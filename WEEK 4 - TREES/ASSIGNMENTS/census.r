
census = read.csv("census.csv")
str(census)

set.seed(2000)
spl = sample.split(census$over50k, SplitRatio = 0.6)
censusTrain = subset(cenus, spl==TRUE)
censusTrain = subset(census, spl==TRUE)
censusTest = subset(census, spl==FALSE)

LogModel = glm(over50k ~., data = censusTrain, method = "class")
LogModel = glm(over50k ~., data = censusTrain)
summary(LogModel)

LogModel = glm(over50k ~., data = censusTrain, family = binomial)
summary(LogModel)

PredictLog = predict(LogModel, newdata = censusTest, type = "response")
table(censusTest$over50k, PredictLog > 0.5)
acc = (9051 + 1888) / nrow(censusTest)
acc

ROCRPredLog = prediction(PredictLog, censusTest$over50k)
as.numeric(performance(ROCRPredLog, "auc")@y.values) 
baseline = (9051 + 662) / nrow(censusTest)
baseline
predCART = rpart(over50k ~., data = censusTrain, method="class")
prp(predCART)

PredictCART = predict(predCART, newdata = censusTest, type = "prob") [,2]
PredictCART2 = predict(predCART, newdata = censusTest, type = "class")
table(censusTest$over50k, PredictCART2 > 0.5)
table(censusTest$over50k, PredictCART > 0.5)
table(censusTest$over50k, PredictCART)
table(censusTest$over50k, PredictCART2)
acc = (9243 + 1596) / nrow(censusTest)
acc

ROCRPredCART = prediction(PredictCART, censusTest$over50k)
as.numeric(performance(ROCRPredCART, "auc")@y.values) 

ROCRPredCART2 = prediction(PredictCART2, censusTest$over50k)
pred = prediction(ROCRPredCART[,2], census$Test)
pred = prediction(ROCRPredCART[,2], censusTest$over50k)
perf = performance(ROCRPredCART2, "tpr", "fpr")
perf = performance(ROCRPredCART, "tpr", "fpr")

plot(perf)
str(censusTest)
str(censusTrain)

set.seed(1)
trainSmall = censusTrain[sample(nrow(censusTrain),2000),]
set.seed(1)
PredRF = randomForest(over50k ~., data = trainSmall, method="class")
PredictRF = predict(PredRF, newdata = censusTest, type = "class")
table(PredictRF, censusTest$over50k)
acc = (9555 + 1204) / nrow(censusTrain)
acc
acc = (9555 + 1204) / nrow(censusTest)
acc

vu = varUsed(PredRF, count=TRUE)
vusorted = sort, (vu, decreasing = FALSE, index.return = TRUE)
vusorted = sort(vu, decreasing = FALSE, index.return = TRUE)
dotchart(vusorted$x, names(PredRF$forest,$xlevels[vusorted$ix]))
dotchart(vusorted$x, names(PredRF$forest$xlevels[vusorted$ix]))
varImpPlot(PredRF)

set.seed(2)
library(caret)
library(e1071)

tr.control = trainControl(method = "cv", number = 10)
set.seed(2)
cp.grid = expand.grid( .cp = seq(0.002,0.1,0.002))
tr = train(over50k ~., data = censusTrain, method = "rpart", trControl = tr.control, tuneGrid = cp.grid)
tr

predCART = rpart(over50k ~., data = censusTrain, method="class", cp = 0.002)
PredictCART = predict(predCART, newdata = censusTest, type = "class")
table(censusTest$over50k, PredictCART)
table(censusTest$over50k, predCART)
table(censusTest$over50k, PredictCART)
acc = (9178 + 1838) / nrow(censusTest)
acc

prp(predCART)