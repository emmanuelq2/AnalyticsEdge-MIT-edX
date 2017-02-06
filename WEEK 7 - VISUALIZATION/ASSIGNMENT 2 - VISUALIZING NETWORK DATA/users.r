
edges = read.csv("edges.csv")
users = read.csv("users.csv")
str(edges)
table(edges$V1)
str(users)
summary(edges)
table(users$locale)
table(users$school)
table(users$gender)
table(users$gender, users$school)

table(edges$V1, mean)
mean(edges$V1)
mean(edges$V2)
sum(edges$V2)
table(users$id)

install.packages("igraph")
library(igraph)
?graph.data.frame

g = graph.data.frame(users, FALSE, edges)
g = graph.data.frame(edges, FALSE, users)
plot(g.vertex.size=5, vertex.label=NA)
plot(g, vertex.size=5, vertex.label=NA)
degree(g)
V(g)$size = degree(g)/2+2
plot(g, vertex, label=NA)
plot(g, vertex.label=NA)
str(g)
summary(g)

V(g)ţolor ="black"
V(g)$color ="black"
V(g)$color[V(g)$school=="A"]="red"
V(g)$color[V(g)$school=="B"]="gray"
plot(g, vertex.label=NA)
V(g)$color[V(g)$locale=="A"]="red"
V(g)$color[V(g)$locale=="B"]="gray"
plot(g, vertex.label=NA)
?igraph
which.max(edgesŖ1)
which.max(edges$V1)
which.mean(edges$V1)