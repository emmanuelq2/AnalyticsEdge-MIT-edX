songs = read.csv("songs.csv")
str(songs)
table(year)
table(song$year)
table(songs$year)
table(songs$artistname == "Michael Jackson")
table(songs$artistname == "Michael Jackson" & songs$Top10 == "1")
subset(songs$artistname == "Michael Jackson" & songs$Top10 == "1")
subset(songs, songs$artistname == "Michael Jackson" & songs$Top10 == "1")
summary(songs)
str(songs)

table(songs$timessignature)
table(songs$timesignature)

table(songs$tempo)
which.max(USDA$tempo)
which.max(songs$tempo)
songs$Description[6206]
songs$songtitle[6206]

str(songs)
SongsTrain = subset(songs, year =< 2009)
SongsTrain = subset(songs, year <= 2009)
SongsTest = subset(songs, year >= 2010)

str(SongsTrain)
str(SongsTest)
SongsLog1 = glm(Top10 ~ ., data=SongsTrain, family=binomial)
nonvars = c("year", "songtitle", "artistname", "songID", "artistID")
SongsTrain = SongsTrain[ , !(names(SongsTrain) %in% nonvars) ]
SongsTest = SongsTest[ , !(names(SongsTest) %in% nonvars) ]
SongsLog1 = glm(Top10 ~ ., data=SongsTrain, family=binomial)
summary(SongsLog1)

cor(SongsTrain)

SongsLog2 = glm(Top10 ~ . - loudness, data=SongsTrain, family=binomial)
summary(SongsLog2)

SongsLog3 = glm(Top10 ~ . - energy, data=SongsTrain, family=binomial)
summary(SongsLog3)
predictTest = predict(SongsLog3, type="response", newdata=SongsTest)
table(SongsTest$Top10, predictTest > 0.45)
accuracy = (309 + 19) / (309 + 5 + 40 + 19)
accuracy

table(SongsTest$Top10)
baseline_acc = 314 / 373
baseline_acc
table(SongsTest$Top10 | Year == 2010, predictTest > 0.45)
table(SongsTest$Top10 | year == 2010, predictTest > 0.45)
table(SongsTest$Top10 & SongsTest$year == 2010, predictTest > 0.45)
table(SongsTest$Top10 & SongsTest$year, predictTest > 0.45)

table(SongsTest$Top10 & SongsTest$year)
table(SongsTest$year & SongsTest$Top10)
tapply(SongsTest$year & SongsTest$Top10, summary)

sensitivity = 19/59
sensitivity

specificity = 309 / 314
specificity


SongsTest = subset(songs, year >= 2010)
str(SongsTest)
table(SongsTest$Year == 2010, pred1 >= 0.5)
table(SongsTest$Top10 & SongsTest$year == 2010, predictTest > 0.45)
table(SongsTest2$year)
x = 19/24
x