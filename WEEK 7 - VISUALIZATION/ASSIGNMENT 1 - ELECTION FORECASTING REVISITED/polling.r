
library(ggplot2)
library(ggmap)
library(maps)
statesMap = map_data("state")
str(statesMap)
table(statesMap$group)
ggplot(statesMap, aes(x=long, y=lat, group=group)) + geom_polygon(fill="white", color="black")
polling = read.csv("PollingImputed.csv")
str(polling)

train = subset(polling, Year == 2004 && Year == 2008)
str(train)
train = subset(polling, Year == 2004 | Year == 2008)
str(train)
test = subset(polling, Year == 2012)
str(test)

mod2 = glm (Republican ~ SurveyUSA+DiffCount, data=train, family="binomial")
testprediction = predict(mod2, newdata=test, type="response")
TestPredictionBinary = as.numeric(testprediction > 0.5)

predictionDataFrame = data.frame(testprediction, TestPredictionBinary, test$State)
str(predictionDataFrame)
summary(predictionDataFrame)
table(predictionDataFrame$TestPredictionBinary)
predictionDataFrame$region = tolower(predictionDataFrame$test.State)
predictionMap = merge(statesMap, predictionDataFrame, by="region")
predictionMap = predictionMap[order(predictionMap$order),]
str(predictionMap)
str(statesMap)
?merge
ggplot(predictionMap, aes(x=long, y=lat, group=group, fill=TestPredictionBinary)) + geom_polygon(color="black")
ggplot(predictionMap, aes(x=long, y=lat, group=group, fill=TestPredictionBinary)) + geom_polygon(color="black") + scale_fill_gradient(low="blue", 
	high="red", guide="legend", breaks=c(0,1), labels=c("Democrat", "Republican"), name="Prediction2012")
summary(testprediction)

ggplot(predictionMap, aes(x=long, y=lat, group=group, fill=testprediction)) + geom_polygon(color="black") + 
	scale_fill_gradient(low="blue", high="red", guide="legend", breaks=c(0,1), labels=c("Democrat", "Republican"), name="Prediction2012")
	
ggplot(predictionMap, aes(x=long, y=lat, group=group, fill=TestPredictionBinary)) + geom_polygon(color="black") + 
	scale_fill_gradient(low="blue", high="red", guide="legend", breaks=c(0,1), labels=c("Democrat", "Republican"), name="Prediction2012")
summary(testprediction)
table(predictionDataFrame$testprediction)
summary(predictionDataFrame$testprediction)

match("0.999637156891794", predictionDataFrame$testprediction)
predictionDataFrame$test.State[9]
match("0.999494942410613", predictionDataFrame$testprediction)
predictionDataFrame$test.State[2]
table(predictionDataFrame$test.State)
match("Florida", predictionDataFrame$test.State)
predictionDataFrame$test.State[6]
predictionDataFrame$testprediction[6]

?geom_polygon
# geom_polygon - linetype=3
ggplot(predictionMap, aes(x=long, y=lat, group=group, fill=TestPredictionBinary)) + geom_polygon(color="black", linetype=3) + 
	scale_fill_gradient(low="blue", high="red", guide="legend", breaks=c(0,1), labels=c("Democrat", "Republican"), name="Prediction2012")
# geom_polygon - alpha=3
ggplot(predictionMap, aes(x=long, y=lat, group=group, fill=TestPredictionBinary)) + geom_polygon(color="black", alpha=3) + 
	scale_fill_gradient(low="blue", high="red", guide="legend", breaks=c(0,1), labels=c("Democrat", "Republican"), name="Prediction2012")
# geom_polygon size=3
ggplot(predictionMap, aes(x=long, y=lat, group=group, fill=TestPredictionBinary)) + geom_polygon(color="black", size=3) + 
	scale_fill_gradient(low="blue", high="red", guide="legend", breaks=c(0,1), labels=c("Democrat", "Republican"), name="Prediction2012")
# geom_polygon - alpha=0.3
ggplot(predictionMap, aes(x=long, y=lat, group=group, fill=TestPredictionBinary)) + geom_polygon(color="black", alpha=0.3) + 
	scale_fill_gradient(low="blue", high="red", guide="legend", breaks=c(0,1), labels=c("Democrat", "Republican"), name="Prediction2012")