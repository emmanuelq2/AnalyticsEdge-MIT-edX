
emails = read.csv("emails.csv", stringsAsFactors=FALSE)
str(emails)
table(emails$spam)
emails$word[1]
emails$text[1]
emails$text[2]
emails$text[3]

max(nchar(emails$text))
which.max(nchar(emails$text))
emails$text[2651]
which.min(nchar(emails$text))

corpus = Corpus(VectorSource(emails$spam))
corpus = tm_map(corpus, tolower)
corpus[[1]]
corpus = tm_map(corpus, PlainTextDocument)
corpus = tm_map(corpus, removePunctuation)
as.character(corpus[[1]])
corpus = tm_map(corpus, removeWords, c(stopwords("english")))
corpus = tm_map(corpus, stemDocument)
dtm = DocumentTermMatrix(corpus)

str(dtm)
summary(dtm)

corpus = Corpus(VectorSource(emails$text))
corpus = tm_map(corpus, tolower)
corpus = tm_map(corpus, removePunctuation)
corpus = Corpus(VectorSource(emails$text))
corpus = tm_map(corpus, tolower)
corpus = tm_map(corpus, PlainTextDocument)
corpus = tm_map(corpus, removePunctuation)
corpus = tm_map(corpus, removeWords, c(stopwords("english")))
corpus = tm_map(corpus, removeWords, c(stopwords("english"))
corpus = tm_map(corpus, removeWords, c(stopwords("english")))
corpus = tm_map(corpus, removeWords, c(stopwords("english")))
corpus = tm_map(corpus, stemDocument)
dtm = DocumentTermMatrix(corpus)
dtm
sparse = removeSparseTerms(dtm, 0.95)
spdtm = as.data.frame(as.matrix(sparse))
spdtm
spdtm = as.data.frame(as.matrix(sparse))
spdtm
spdtm = removeSparseTerms(dtm, 0.95)
spdtm

emailsSparse = as.data.frame(as.matrix(spdtm))
colnames(emailsSparse) = make.names(colnames(emailsSparse))
str(emailsSparse)

which.max(colSums(emailsSparse))
emailsSparse$spam = emails$spam
sort(colSums(subset(emailsSparse, spam ==0)))
sort(colSums(subset(emailsSparse, spam ==1)))
emailsSparse$spam = as.factor(emailsSparse$spam)

set.seed(123)
split = sample.split(emailsSparse$spam, SplitRatio = 0.7)
train = subset(emailsSparse, split==TRUE)
test = subset(emailsSparse, split==FALSE)
str(train)
str(test)

spamLog = glm(spam ~., data=train, method="class")
spamCART = rpart(spam ~., data = Train, method="class")
spamCART = rpart(spam ~., data = train, method="class")
spamRF = randomForest(spam ~., data = train, method="class")

library(randomForest)
spamRF = randomForest(spam ~., data = train, method="class")
spamLog = glm(spam ~., data=train, method="class")
PredictLog = predict(spamLog, newdata = train, type="prob") [,2]
spamLog = glm(spam ~., data=train, family="binomial")
# PredictLog = predict(spamLog, newdata = train, type="response") [,2]
PredictLog = predict(spamLog, newdata = train, type="response") 
table(PredictLog, train$spam > 0.5)
table(PredictLog, train$spam)
table(PredictLog < 0.00001)
table(PredictLog > 0.99999)
table(PredictLog >= 0.99999 & PredictLog <= 0.00001)

summary(PredictLog)
summary(spamLog)
prp(spamCART)
table(PredictLog, train$spam > 0.5)
table(train$spam, PredictLog > 0.5)


PredictCART = predict(spamCART, newdata = train, type="prob") [,2]
PredictRF = predict(spamRF, newdata = train, type="prob") [,2]
table(train$spam, PredictCART > 0.5)

library(ROCR)
ROCRpredCART = prediction(PredictCART, train$spam)
as.numeric(performance(ROCRpredCART, "auc")@y.values)
table(train$spam, PredictRF > 0.5)

acc = 4004 / 4010
acc

ROCRpredRF = prediction(PredictRF, train$spam)
as.numeric(performance(ROCRpredRF, "auc")@y.values)

wordCount = rowSums(as.matrix(dtm))

library(slam)
wordCount = rollup(dtm, 2, FUN=sum)$v

str(wordCount)
wordCount
hist(wordCount)
hist(log(wordCount))

emailsSparse$logWordCount = log(wordCount)
table(emailsSparse$logWordCount)
table(emailsSparse$logWordCount, emailsSparse$spam == 1)
boxplot(emailsSparse$logWordCount~emailsSparse$spam)

train2 = subset(emailsSparse, split==TRUE)
test2 = subset(emailsSparse, split==FALSE)
spamCART2 = rpart(spam ~., data = train2, method="class")
spamRF2 = randomForest(spam ~., data = train2, method="class")

set.seed(123)
spamRF2 = randomForest(spam ~., data = train2, method="class")
prp(spamCART2)

predCART2 = predict(spamCART2, newdata=test2, type="class")
predRF2 = predict(spamRF2, newdata=test2, type="class")
table(test2$spam, predCART > 0.5)
table(test2$spam, predCART2)
acc = (1214 + 384) / nrow(test2)
acc


ROCRpredCART2 = prediction(predCART2, test2$spam)
str(predCART2)
table(test2$spam, predRF2)
accRF = (1298+379) / nrow(test2)
accRF

ROCRpredCART2 = prediction(predRF2,test2$spam)
