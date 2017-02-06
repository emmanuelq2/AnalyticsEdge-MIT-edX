
airlines = read.csv("AirlinesCluster.csv")
str(airlines)
summary(airlines)

library(caret)
preproc = preProcess(airlines)
airlinesNorm=predict(preproc, airlines)
summary(airlinesNorm)
sd(airlinesNorm$Balance)
sd(airlinesNorm$QualMiles)

distance = dist(airlinesNorm, method = "euclidean")
clusterHierAirlines = hclust(distance, method="ward.D")
plot(clusterHierAirlines)
tapply(airlinesłalance, clusterHierAirlines, mean)
tapply(airlines$Balance, clusterHierAirlines, mean)
clusterGroups = cutree(clusterHierAirlines, k = 5)
clusterGroups[1]
clusterGroups[2]
clusterGroups[3]

cluster1 = subset(airlines, clusterGroups==1)
str(cluster1)
tapply(airlines$Balance, clusterHierAirlines, mean)
tapply(airlines$Balance, clusterGroups, mean)
tapply(airlines$QualMiles, clusterGroups, mean)
tapply(airlines$BonusMiles, clusterGroups, mean)
tapply(airlines$BonusTrans, clusterGroups, mean)
tapply(airlines$FlightMiles, clusterGroups, mean)
tapply(airlines$FlightTrans, clusterGroups, mean)
tapply(airlines$FlightDaysSinceEnroll, clusterGroups, mean)
tapply(airlines$DaysSinceEnroll, clusterGroups, mean)

set.seed(88)
KMCAirlines = kmeans(airlines, centers = 5, iter.max = 1000)
str(KMCAirlines)
AirlinesClusters = KMCAirlines$cluster
KMC$centers[1]
KMCcluster1 = subset(airlines, AirlinesClusters==1)
str(KMCcluster1)
KMCcluster2 = subset(airlines, AirlinesClusters==2)
str(KMCcluster2)
KMCcluster3 = subset(airlines, AirlinesClusters==3)
str(KMCcluster3)
KMCcluster4 = subset(airlines, AirlinesClusters==4)
str(KMCcluster4)
KMCcluster5 = subset(airlines, AirlinesClusters==5)
str(KMCcluster5)
KMCcluster6 = subset(airlines, AirlinesClusters==6)
str(KMCcluster6)

str(KMCAirlines)
KMCAirlines$centers[1]
KMCAirlines$centers[2]
KMCAirlines$centers[3]
KMCAirlines$centers[4]
KMCAirlines$centers[5]
nrow(KMCAirlines)
nrows(KMCAirlines)