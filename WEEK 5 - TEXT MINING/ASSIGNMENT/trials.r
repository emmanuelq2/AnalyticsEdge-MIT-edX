
trials = read.csv("clinical_trial.csv")
trials = read.csv("clinical_trial.csv", stringsAsFactors=FALSE)
str(trials)
summary(trials)

max(nchar(trials$abstract))
max(nchar(trials$abstract))
table(trials$abstract)
summary(trials$abstract)
table(nchar(trials$abstract) ==0)
min(nchar(trials$title))
trials$title[28]
which.min(nchar(trials$title))
trials$title[1258]
str(trials)

library(tm)
corpusTitle = Corpus(VectorSource(trials$Title))
corpusAbstract = Corpus(VectorSource(trials$Abstract))
corpusTitle = Corpus(VectorSource(trials$title))
corpusAbstract = Corpus(VectorSource(trials$abstract))
corpusTitle = tm_map(corpusTitle, tolower)
corpusAbstract = tm_map(corpusAbstract, tolower)
corpusTitle = tm_map(corpusTitle, PlainTextDocument)
corpusAbstract = tm_map(corpusAbstract, PlainTextDocument)
corpusTitle = tm_map(corpusTitle, removePunctuation)
corpusAbstract = tm_map(corpusAbstract, removePunctuation)
corpusTitle = tm_map(corpusTitle, removeWords, c(stopwords("english")))
corpusAbstract = tm_map(corpusAbstract, removeWords, c(stopwords("english")))
corpusTitle = tm_map(corpusTitle, stemDocument)
corpusAbstract = tm_map(corpusAbstract, stemDocument)
dtmTitle = DocumentTermMatrix(corpusTitle)
dtmAbstract = DocumentTermMatrix(corpusAbstract)
sparse = removeSparseTerms(dtmTitle, 0.95)
sparseTitle = removeSparseTerms(dtmTitle, 0.95)
sparseAbstract = removeSparseTerms(dtmAbstract, 0.95)
dtmTitle = as.data.frame(as.matrix(sparseTitle))
dtmAbstract = as.data.frame(as.matrix(sparseAbstract))
length(stopwords("english"))

str(dtmTitle)
str(dtmAbstract)
colSums(corpusAbstract
colSums(corpusAbstract)
colSums(dtmAbstract)
which.max(colSums(dtmAbstract))
colnames(dtmTitle) = paste0("T", colnames(dtmTitle))
colnames(dtmAbstract) = paste0("A", colnames(dtmAbstract))

str(dtmTitle)
dtm =cbind(dtmTitle, dtmAbstract)
dtm$trial = trials$trial

str(dtm)

set.seed(144)
split = sample.split(dtm$trial, SplitRatio = 0.7)
train = subset(dtm, split==TRUE)
test = subset(dtm, split==FALSE)
str(test)
table(test$trial)
baseline = 313 / (313 + 245)
baseline

trialCART = rpart(trial ~ ., data=train, method="class")
predCART = predict(trialCART, newdata=test, type="class")
prp(trialCART)
predCART = predict(trialCART, newdata=test, type="prob") [,2]
predCARTTrain = predict(trialCART, newdata=train, type="prob") [,2]
table(test$trial, predCARTTrain > 0.5)
table(test$trial, predCARTTrain)
table(train$trial, predCARTTrain > 0.5)
acc = (631 + 441) / nrow(train)
acc

summary(predCARTTrain)

predCART = predict(trialCART, newdata=test, type="class")
table(test$trial, predCART > 0.5)
table(test$trial, predCART)
acc = (162+261) / nrow(train)
acc
acc = (162+261) / nrow(test)
acc