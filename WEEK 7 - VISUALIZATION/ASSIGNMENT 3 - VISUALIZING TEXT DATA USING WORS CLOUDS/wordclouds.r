
tweets = read.csv("tweets.csv", stringsAsFactors=FALSE)
str(tweets)
corpus = Corpus(VectorSource(tweets$Tweet))

library(tm)
library(SnowballC)
corpus = Corpus(VectorSource(tweets$Tweet))
corpus = tm_map(corpus, tolower)
corpus = tm_map(corpus, PlainTextDocument)
corpus = tm_map(corpus, removePunctuation)
stopwords("english")
corpus = tm_map(corpus, removeWords, c(stopwords("english")))
frequencies = DocumentTermMatrix(corpus)
alltweets = as.data.frame(as.matrix(frequencies))
str(alltweets)

install.packages("wordcloud")
library(wordcloud)
?wordcloud
colnames(alltweets)
rownames(alltweets)
colSums(alltweets)
rowSums(alltweets)
?wordcloud


# max.colnames=Inf
wordcloud(colnames, colSums, scale=c(4,.5),min.freq=2,max.colnames=Inf,random.order=TRUE, random.color=FALSE, rot.per=.1,colors="black",
	ordered.colors=FALSE,use.r.layout=FALSE)
# max.colnames=100
wordcloud(colnames, colSums, scale=c(4,.5),min.freq=2,max.colnames=100,random.order=TRUE, random.color=FALSE, rot.per=.1,colors="black",
	ordered.colors=FALSE,use.r.layout=FALSE)
# random.order=TRUE
wordcloud(colnames, colSums, scale=c(4,.5),min.freq=2,random.order=TRUE, random.color=FALSE, rot.per=.1,colors="black",
	ordered.colors=FALSE,use.r.layout=FALSE)
# min.freq=1
wordcloud(colnames, colSums, scale=c(4,.5),min.freq=1,max.colnames=100,random.order=TRUE, random.color=FALSE, rot.per=.1,colors="black",
	ordered.colors=FALSE,use.r.layout=FALSE)
# min.freq=2
wordcloud(colnames, colSums, scale=c(4,.5),min.freq=2,max.colnames=100,random.order=TRUE, random.color=FALSE, rot.per=.1,colors="black",
	ordered.colors=FALSE,use.r.layout=FALSE)
wordcloud(colnames, colSums, scale=c(4,.5))
# min.colSums=2
wordcloud(colnames, colSums, scale=c(4,.5),min.colSums=2,max.colnames=100,random.order=TRUE, random.color=FALSE, rot.per=.1,colors="black",
ordered.colors=FALSE,use.r.layout=FALSE)

str(alltweets)
which.max(alltweets)
wordcloud(colnames, colSums, scale=c(4,.5),min.colSums=2,max.colnames=100,random.order=TRUE, random.color=FALSE, rot.per=.1,colors="black",
	ordered.colors=FALSE,use.r.layout=FALSE)
colSums(alltweets)

wordcloud(colnames(alltweets), colSums(alltweets), scale=c(4,.5))
wordcloud(colnames(alltweets), colSums(alltweets), scale=c(2,.25))
corpus = Corpus(VectorSource(tweets$Tweet))
corpus = tm_map(corpus, tolower)
corpus = tm_map(corpus, PlainTextDocument)
corpus = tm_map(corpus, removePunctuation)
corpus = tm_map(corpus, removeWords, c("apple", stopwords("english")))
frequencies = DocumentTermMatrix(corpus)
alltweets2 = as.data.frame(as.matrix(frequencies))

wordcloud(colnames(alltweets2), colSums(alltweets2), scale=c(2,.25))
wordcloud(colnames(alltweets2), colSums(alltweets2), scale=c(4,.5))
wordcloud(colnames(alltweets2), colSums(alltweets2), scale=c(2,.25))
# wordcloud(colnames(alltweets2), colSums(alltweets2), scale=c(2,.25), max.freq(alltweets2)=-1)
wordcloud(colnames(alltweets2), colSums(alltweets2), scale=c(2,.25), max.freq(alltweets2)==-1)
wordcloud(colnames(alltweets2), colSums(alltweets2), scale=c(2,.25), min.freq=-1)
wordcloud(colnames(alltweets2), colSums(alltweets2), scale=c(2,.25), colMeans(alltweets2)<-1)
wordcloud(colnames(alltweets2), colSums(alltweets2), scale=c(2,.25), min.freq(alltweets2)<-1)
wordcloud(colnames(alltweets2), colSums(alltweets2), scale=c(2,.25), min.freq=1)
wordcloud(colnames(alltweets2), colSums(alltweets2), scale=c(2,.25))
wordcloud(colnames(alltweets2), colSums(alltweets2), scale=c(2,.25), random.order=TRUE)
wordcloud(colnames(alltweets2), colSums(alltweets2), scale=c(2,.25), random.order=FALSE)
wordcloud(colnames(alltweets2), colSums(alltweets2), scale=c(2,.25), random.order=FALSE, rot.per=.1)
wordcloud(colnames(alltweets2), colSums(alltweets2), scale=c(2,.25), random.order=FALSE, rot.per=.2)

install.packages(""RColorBrewer")
install.packages("RColorBrewer")
library(RColorBrewer)
?RColorBrewer
?wordcloud

wordcloud(colnames(alltweets2), colSums(alltweets2), scale=c(2,.25), random.order=FALSE, rot.per=.2, colors="Accent")
wordcloud(colnames(alltweets2), colSums(alltweets2), scale=c(2,.25), random.order=FALSE, rot.per=.2, random.color=FALSE, colors="Accent")
wordcloud(colnames(alltweets2), colSums(alltweets2), scale=c(2,.25), random.order=FALSE) + scale_fill_brewer(palette="Accent")
wordcloud(colnames(alltweets2), colSums(alltweets2), scale=c(2,.25), random.order=FALSE) + scale_fill_brewer(palette="Set2")
wordcloud(colnames(alltweets2), colSums(alltweets2), scale=c(2,.25), random.order=FALSE) + scale_fill_brewer(palette="YIOrRD")


display.brewer.all(RColorBrewer)
library(RColorBrewer)
display.brewer.all(RColorBrewer)
# display.brewer.pal(RColorBrewer)
# display.brewer.pal(RColorBrewer), 1
wordcloud(colnames(alltweets2), colSums(alltweets2), scale=c(2,.25), random.order=FALSE, rot.per=.2, random.color=FALSE, 
	colors="brewer.pal(9,"Blues"))
wordcloud(colnames(alltweets2), colSums(alltweets2), scale=c(2,.25), random.order=FALSE, colors="brewer.pal(9,"Blues"))
wordcloud(colnames(alltweets2), colSums(alltweets2), scale=c(2,.25), random.order=FALSE, colors="brewer.pal(9,"Blues"))
display.brewer.all

?wordcloud
wordcloud(colnames(alltweets2), colSums(alltweets2), scale=c(2,.25), random.color=FALSE, colors="brewer.pal(9,"Blues"))

