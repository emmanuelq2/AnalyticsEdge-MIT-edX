
wiki = read.csv("wiki.csv", stringsAsFactors=FALSE)
wiki = read.csv("wiki.csv", stringsAsFactors=FALSE)
str(wiki)
summary(wiki)
table(wiki$Vandal)
corpusAdded = Corpus(VectorSource(wiki$Added))

library(tm)
library(SnowballC)
corpusAdded = Corpus(VectorSource(wiki$Added))
corpus = tm_map(corpus, removeWords, c(stopwords("english")))
corpusAdded = tm_map(corpusAdded, removeWords, c(stopwords("english")))
corpusAdded = tm_map(corpusAdded, stemDocument)
str(corpusAdded)
dtmAdded = DocumentTermMatrix(corpus)
dtmAdded = DocumentTermMatrix(corpusAdded)
str(dtmAdded)
dtmAdded

sparse = removeSparseTerms(frequencies, 0.997)
sparse = removeSparseTerms(dtmAdded, 0.997)
sparse

SparseAdded = as.data.frame(as.matrix(sparse))
colnames =(wordsAdded) = paste("A", colnames(wordsAdded))

WordsAdded = as.data.frame(as.matrix(SparseAdded))
colnames =(wordsAdded) = paste("A", colnames(wordsAdded))
colnames =(wordsAdded) = paste("A", colnames(WordsAdded))

wordsAdded = as.data.frame(as.matrix(SparseAdded))
colnames =(wordsAdded) = paste("A", colnames(wordsAdded))
colnames(wordsAdded) = paste("A", colnames(wordsAdded))

corpusRemoved = Corpus(VectorSource(wiki$Added))
wordsAdded
str(wordsAdded)

corpusRemoved = Corpus(VectorSource(wiki$Added))
corpus = tm_map(corpus, removeWords, c(stopwords("english")))
corpusRemoved = tm_map(corpusRemoved, removeWords, c(stopwords("english")))
corpusRemoved = tm_map(corpusRemoved, stemDocument)
dtmRemoved = DocumentTermMatrix(corpusRemoved)
sparse = removeSparseTerms(dtmRemoved, 0.997)
sparse

WordsRemoved = as.data.frame(as.matrix(SparseRemoved))
colnames(WordsRemoved) = paste("R", colnames(WordsRemoved))
str(WordsRemoved)
WordsRemoved
summary(WordsRemoved)
ncol(WordsRemoved)

wikiWords = cbind(wordsAdded, WordsRemoved)
wikiWords$Vandal = wiki$Vandal

str(wiki)
str(wikiWords)
ncol(wikiWords)

library(caTools)
set.seed(123)
split = sample.split(wikiWordsS$Vandal, SplitRatio = 0.7)
split = sample.split(wikiWords$Vandal, SplitRatio = 0.7)
train = subset(wikiWords, split==TRUE)
test = subset(wikiWords, split==FALSE)
summary(wikiWords$Vandal)
table(wikiWords$Vandal)
baseline = 2015 / (2015 + 1861)
baseline
baseline = 2061 / (2061 + 1815)
baseline

table(test$Vandal)
wikiCART = rpart(Vandal ~ ., data=train, method="class")
prp(wikiCART)

predictCART = predict(wikiCART, newdata=test, type="class")
table(test$Vandal, predictCART)
acc = (618 + 6) / nrow(test)
acc

str(train)
str(test)
wikiWords2 = wikiWords
# wikiWords2$HTTP = ifelse(grep("http",wiki$Added,fixed=TRUE), 1, 0)
wikiWords2$HTTP = ifelse(grepl("http",wiki$Added,fixed=TRUE), 1, 0)
wikiWords2$HTTP
str(wikiWords2$HTTP)
colrow(wikiWords2$HTTP)
ncol(wikiWords2$HTTP)

summary(wikiWords2$HTTP)
table(wikiWords2$HTTP)

train2 = subset(wikiWords, split==TRUE)
test2 = subset(wikiWords, split==FALSE)
wikiCART2 = rpart(Vandal ~ ., data=train, method="class")
predictCART2 = predict(wikiCART2, newdata=test, type="class")
table(test2$Vandal, predictCART2)

wikiCART2 = rpart(Vandal ~ ., data=train2, method="class")
predictCART2 = predict(wikiCART2, newdata=test2, type="class")
table(test2$Vandal, predictCART2)

train2 = subset(wikiWords2, split==TRUE)
test2 = subset(wikiWords2, split==FALSE)
wikiCART2 = rpart(Vandal ~ ., data=train2, method="class")
predictCART2 = predict(wikiCART2, newdata=test2, type="class")
table(test2$Vandal, predictCART2)
acc = (609 + 51) / nrow(test2)
acc

wikiWords2$NumWordsAdded = rowSums(as.matrix(dtmAdded))
wikiWords2$NumWordsRemoved = rowSums(as.matrix(dtmRemoved))
# table(wikiWords2$NumWordsAdded, mean)
mean(wikiWords2$NumWordsAdded)

train3 = subset(wikiWords2, split==TRUE)
test3 = subset(wikiWords2, split==FALSE)
wikiCART3 = rpart(Vandal ~ ., data=train3, method="class")
predictCART3 = predict(wikiCART3, newdata=test3, type="class")
table(test3$Vandal, predictCART3)
acc3 = (330+401) / nrow(test3)
acc3

wikiWords3 = wikiWords2
wikiWords3$Minor = wiki$Minor
wikiWords3$LoggedIn = wiki$LoggedIn

train4 = subset(wikiWords3, split==TRUE)
test4 = subset(wikiWords3, split==FALSE)

wikiCART4 = rpart(Vandal ~ ., data=train4, method="class")
prp(wikiCART4)
predictCART4 = predict(wikiCART4, newdata=test4, type="class")
table(test4$Vandal, predictCART4)
acc4 = (423+331) / nrow(test4)
acc4