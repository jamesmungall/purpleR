
## Generalising this
A<-matrix(c(3, 1, -1, -1, -7, 1, -2, 1, 1, 0, -1, 1, 1, 1, 11, 2, 3, -1, 1, 10),4,5,byrow=TRUE)

for (n in 1:length(A[,1])){
  A[n,]<-A[n,]/A[n,n]
  for(i in 1:length(A[,1])){
    if (i != n){
      A[i,]<-A[i,]-A[n,]*A[i,n]
    }
  }
}
View(A)

