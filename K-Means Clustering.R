A = data.frame(iris)
str(A)
library(data.table)
install.packages("mltools")
library(mltools)
A = one_hot(as.data.table(A))
A
#----k = 2----
m1 = kmeans(A,2)
m1$cluster
par(mfrow=c(2,2))
plot(A$Sepal.Length,A$Sepal.Width,col = m1$cluster)
plot(A$Sepal.Length,A$Petal.Length,col = m1$cluster)
plot(A$Sepal.Length,A$Petal.Width,col = m1$cluster)
plot(A$Sepal.Width,A$Petal.Length,col = m1$cluster)
plot(A$Sepal.Width,A$Petal.Width,col = m1$cluster)
plot(A$Petal.Length,A$Petal.Width,col = m1$cluster)

#----k = 3----

m3 = kmeans(A,3)
par(mfrow=c(2,2))
plot(A$Sepal.Length,A$Sepal.Width,col = m3$cluster)
plot(A$Sepal.Length,A$Petal.Length,col = m3$cluster)
plot(A$Sepal.Length,A$Petal.Width,col = m3$cluster)
plot(A$Sepal.Width,A$Petal.Length,col = m3$cluster)
plot(A$Sepal.Width,A$Petal.Width,col = m3$cluster)
plot(A$Petal.Length,A$Petal.Width,col = m3$cluster)

cbind(A$Species,m3$cluster)

#----k = 4----
m4 = kmeans(A1,4)
par(mfrow=c(3,2))
plot(A$Sepal.Length,A$Sepal.Width,col = m4$cluster)
plot(A$Sepal.Length,A$Petal.Length,col = m4$cluster)
plot(A$Sepal.Length,A$Petal.Width,col = m4$cluster)
plot(A$Sepal.Width,A$Petal.Length,col = m4$cluster)
plot(A$Sepal.Width,A$Petal.Width,col = m4$cluster)
plot(A$Petal.Length,A$Petal.Width,col = m4$cluster)


#----k = 5-----

m5 = kmeans(A1,5)
par(mfrow=c(3,2))
plot(A$Sepal.Length,A$Sepal.Width,col = m5$cluster)
plot(A$Sepal.Length,A$Petal.Length,col = m5$cluster)
plot(A$Sepal.Length,A$Petal.Width,col = m5$cluster)
plot(A$Sepal.Width,A$Petal.Length,col = m5$cluster)
plot(A$Sepal.Width,A$Petal.Width,col = m5$cluster)
plot(A$Petal.Length,A$Petal.Width,col = m5$cluster)
levels(A$Species)
plot(A$Sepal.Length,A$Species,col = m2$cluster)
#===================

#---------ELBOW CURVE---------

A = data.frame(iris)
scaled_data = as.matrix(scale(A[,1:4]))
scaled_data
A
# Compute and plot wss for k = 2 to k = 15.
k.max = 10
data = scaled_data
wss = sapply(2:k.max, 
             function(k){kmeans(data, k, nstart=50,iter.max = 15 )$tot.withinss})
wss
plot(2:k.max, wss,
     type="b", pch = 19, frame = FALSE, 
     xlab="Number of clusters K")
