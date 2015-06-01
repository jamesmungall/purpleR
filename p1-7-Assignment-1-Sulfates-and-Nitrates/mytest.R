main<-function(){
  
  
  r1=c(1,NA);
  r2=c(2,43.1);
  myMatrix=rbind(r1,r2);
  colnames(myMatrix)<-c('id','value');
 myDf<-as.data.frame((myMatrix));
  return(list(myMatrix=myMatrix,myDf=myDf));
}
