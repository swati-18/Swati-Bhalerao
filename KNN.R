#------------------------KNN----------------------------
library(caret)
ISLR::OJ
A = data.frame(iris)
sf = sample(2,nrow(A),replace = TRUE,prob = c(0.7,0.3))
trd = A[sf == 1,] 
tsd = A[sf == 2,] 

tc = trainControl(method = 'cv',number = 4,verboseIter = TRUE)

model1 = train(Species ~ . ,
               data = trd, 
               method = 'knn', 
               trControl = tc, 
               preProc = c("center","scale"))

pred = predict(model1,tsd)
cbind(pred,actual = tsd$Species)

cm = table(pred,actual = tsd$Species)
cclass =(sum(diag(cm))/nrow(tsd))*100
mclass = 100-cclass
