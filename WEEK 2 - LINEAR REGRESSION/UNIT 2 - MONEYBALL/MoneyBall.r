baseball = read.csv("baseball.csv")
str(baseball)
moneyball = subset(baseball, Year < 2002)
str(moneyball)
moneyball$RD = moneyball$RS - moneyball$RA
str(moneyball)

plot(moneyball$RD, moneyball$W)

WinsReg = lm(W ~ RD, data=moneyball)
summary(WinsReg)
WinsReg = lm(W ~ 99, data=moneyball)
predict(winReg, newdata = data.frame(RD = 100))
predict(winsReg, newdata = data.frame(RD = 100))
str(moneyball)
RunsReg = lm(RS ~ OBP + SLG + BA, data=moneyball)
summary(RunsReg)
RunsReg = lm(RS ~ OBP + SLG, data=moneyball)
summary(RunsReg)
x = -804.63 + (2737.77 * 0.311) + (1584.91 * 0.405)
x
y = -837.38 + (2913.6 * 0.297) + (1514 .29 * 0.370)
y = -837.38 + (2913.6 * 0.297) + (1514.29 * 0.370)
y
CHAVEZ = -804.63 + (2737.77 * 0.338) + (1584.91 * 0.540)
CHAVEZ
GIAMBI = -804.63 + (2737.77 * 0.391) + (1584.91 * 0.450)
GIAMBI
MENECHINO = -804.63 + (2737.77 * 0.369) + (1584.91 * 0.374)
MENECHINO
MYERS = -804.63 + (2737.77 * 0.313) + (1584.91 * 0.447)
MYERS
PENA = -804.63 + (2737.77 * 0.361) + (1584.91 * 0.500)
PENA
teamRank = c(1,2,3,3,4,4,4,4,5,5)
wins2012 = c(94,88,95,88,93,94,98,97,93,94) 
cor(teamRank, wins2012)
wins2013 = c(97,97,92,93,92,96,94,96,92,90) 
cor(teamRank, wins2013)
Team = data.frame(RS, RA)
RS = 713
RA = 614
Team = data.frame(RS, RA)
summary(Team)
predictTest = predict(model4, newdata=wineTest)
str(Team)
 RunsReg = lm(RS ~ OBP + SLG + BA, data=monyeball)
predictTest = predict(RunsReg, newdata = Team)
predict(winReg, newdata = data.frame(RD = 100))
predictTest = predict(WinsReg, newdata = Team)
RD = RS - RA
predictTest = predict(WinsReg, newdata = Team)
predictTest