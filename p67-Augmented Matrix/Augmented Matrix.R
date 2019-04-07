Solving a Matrix using augmented matrix method    Purple book pg 34, 8.6.15
## Generalising this
##A<-matrix(c(3, 1, -1, -1, -7, 1, -2, 1, 1, 0, -1, 1, 1, 1, 11, 2, 3, -1, 1, 10),4,5,byrow=TRUE)

##A<-matrix(c(3, 14, 13, 109, 5, 7, 15, 103, 9, 15, 6, 153),3,4,byrow=TRUE)

A<-matrix(c(1,0,-3, 1, 0,0, 2, -2,1, 0, 1,0,0,-1,3,0,0,1),3,6, byrow=TRUE)

for (n in 1:length(A[,1])){
  A[n,]<-A[n,]/A[n,n]
  for(i in 1:length(A[,1])){
    if (i != n){
      A[i,]<-A[i,]-A[n,]*A[i,n]
    }
  }
}
View(A)

