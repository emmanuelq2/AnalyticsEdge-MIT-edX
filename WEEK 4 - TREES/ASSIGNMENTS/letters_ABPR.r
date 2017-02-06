
letters = read.csv("letters_ABPR.csv")

letters$isB = as.factor(letters$letter == "B")
library(caTools)

set.seed(500)
spl = sample.split(stevens$Reverse, SplitRatio = 0.5)
spl = sample.split(letters$isB, SplitRatio = 0.5)
lettersTrain = subset(letters, spl==TRUE)
lettersTest = subset(letters, spl==FALSE)

str(lettersTest)

table(lettersTest, lettersTest$isB == 1)
table(lettersTest$isB)

baseline = 1175 / nrow(lettersTest)
baseline


CARTb = rpart(isB ~. - letter, data = lettersTrain, method="class")
PredictCART = predict(CARTb, newdata = lettersTest, type = "class")

table(PredictCART, lettersTest$isB > 0.5)
table(PredictCART, lettersTest$isB)

acc = (1133 + 327) / nrow(lettersTest)
acc
acc = (1133 + 327) / 1558
acc

set.seed(1000)
library(randomForest)
lettersRF = randomForest(isB ~. - letter, data = lettersTrain, method="class")
PredictRF = predict(lettersRF, newdata = lettersTest, type = "class")
table(PredictRF, lettersTest$isB)
acc = (1163 + 371) / 1558
acc

letters$letter = as.factor(letters$letter)
set.seed(2000)
spl = sample.split(letters$letter, SplitRatio = 0.5)
lettersTrain = subset(letters, spl==TRUE)
lettersTest = subset(letters, spl==FALSE)
str(lettersTrain)
str(lettersTest)

table(lettersTest$letter)
baseline = 395 / 1558
baseline

baseline = 401 / 1558
baseline

CARTModel = rpart(letter ~. - isB, data = lettersTrain, method="class")
PredictCART = predict(CARTModel, newdata = lettersTest, type = "class")

table(lettersTest$letter, CARTModel)
table(lettersTest$letter, PredictCART)
acc  = (348 + 318 + 363 + 340) / nrow(lettersTest)
acc

set.seed(1000)
PredRF = randomForest(letter ~. - isB, data = lettersTrain, method="class")
PredictRF = predict(PredRF, newdata = lettersTest, type = "class")
table(lettersTest$letter, PredictRF)
acc = (389 + 380 + 393 + 365) / nrow(lettersTest)
acc