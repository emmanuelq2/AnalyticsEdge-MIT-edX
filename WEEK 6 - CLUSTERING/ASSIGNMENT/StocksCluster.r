
stocks = read.csv("StocksCluster.csv")
str(stocks)
summary(stocks)
cor(stocks[1:11,])
cor(stocks)

set.seed(144)
spl = sample.split(stocks$PositiveDec, SplitRatio=0.7)
stocksTrain = subset(stocks, spl==TRUE)
stocksTest = subset(stocks, spl==FALSE)
str(stocksTrain)
str(stocksTest)

StocksModel = glm(PositiveDec ~ ., data = stocksTrain, family=binomial)
summary(StocksModel)
predictStocksModel = predict(StocksModel, type="response")
table(stocksTrain$PositiveDec, predictStocksModel > 0.5)
acc = (990 + 3640) / nrow(stocksTrain)
acc

predictTestStocksModel = predict(StocksModel, type="response", newdata=stocksTest)
table(stocksTest$PositiveDec, predictTestStocksModel > 0.5)
accTest = (417 + 1553)/ nrow(stocksTest)
accTest

baseline = (1553 + 344) / nrow(stocksTest)
baseline
limtedTrain = stocksTrain
limtedTrain$PositiveDec = NULL

limtedTest = stocksTest
limtedTest$PositiveDec = NULL

library(caret)
preproc=preProcess(limtedTrain)
normTrain=predict(preproc, limitedTrain)
normTrain=predict(preproc, limtedTrain)
normTest=predict(preproc, limtedTest)
str(normTrain)
summary(normTrain)
summary(normTest)

set.seed(144)
KMCnormTrain = kmeans(normTrain, centers = 3)
km = kmeans(normTrain, centers = 3)
str(km)

normTrainClusters = km$cluster
kmCcluster1 = subset(normTrain, normTrainClusters==1)
kmCluster1 = subset(normTrain, normTrainClusters==1)
str(kmCluster1)
kmCluster2 = subset(normTrain, normTrainClusters==2)
str(kmCluster2)
kmCluster3 = subset(normTrain, normTrainClusters==3)
str(kmCluster3)
library(flexclust)
km.kcca=as.kcca(m, normTrain)
km.kcca=as.kcca(km, normTrain)
clusterTrain = predict(km.kcca)
clusterTest = predict(km.kcca, newdata=normTest)
summary(clusterTest)
str(clusterTest)
clusterTest[2]
clusterTest[1]
clusterTest[4]

cluster1 = subset(normTest, clusterTest==1)
cluster2 = subset(normTest, clusterTest==2)
cluster3 = subset(normTest, clusterTest==3)
str(cluster1)
str(cluster2)
str(cluster3)

cluster1 = subset(stocksTrain, clusterTrain==1)
cluster2 = subset(stocksTrain, clusterTrain==2)
cluster3 = subset(stocksTrain, clusterTrain==3)

clusterTest1 = subset(stocksTest, clusterTest==1)
clusterTest2 = subset(stocksTest, clusterTest==2)
clusterTest3 = subset(stocksTest, clusterTest==3)
str(cluster1)
summary(cluster1)
summary(cluster2)
summary(cluster3)

mean(cluster1$PositiveDec)
mean(cluster2$PositiveDec)
mean(cluster3$PositiveDec)
StocksModel1 = glm(PositiveDec ~., data = cluster1, family=binomial)
StocksModel2 = glm(PositiveDec ~., data = cluster2, family=binomial)
StocksModel3 = glm(PositiveDec ~., data = cluster3, family=binomial)
str(StocksModel1)
summary(StocksModel1)
summary(StocksModel2)
summary(StocksModel3)

predictTest1 = predict(StocksModel1, type="response", newdata=clusterTest1)
predictTest2 = predict(StocksModel2, type="response", newdata=clusterTest2)
predictTest3 = predict(StocksModel3, type="response", newdata=clusterTest3)

table(clusterTest1$PositiveDec, predictTest1 > 0.5)
acc1 = (774 + 30) / (774 + 30 + 471 + 23)
acc1

table(clusterTest2$PositiveDec, predictTest2 > 0.5)
acc2 = (388 + 757) / (388 + 757 + 626 + 309)
acc2

table(clusterTest3$PositiveDec, predictTest3 > 0.5)
acc3 = (49 + 13) / (49+13+21+13)
acc3

AllPredictions = c(predictTest1, predictTest2, predictTest3)
AllOutcomes = c(clusterTest1$PositiveDec, clusterTest2$PositiveDec, clusterTest3$PositiveDec)  
table(AllOutcomes$PositiveDec, AllPredictions > 0.5)
table(AllOutcomes, AllPredictions > 0.5)
# acc = (467 + 1544) / (nrow(AllOutcomes))
# acc
acc = (467 + 1544) / nrow(AllOutcomes)
acc
acc = (467 + 1544) / (467 + 1110 + 353 + 1544)
acc

