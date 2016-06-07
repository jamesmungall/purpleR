holtWintersSeasonal<-function(){
  md<-c(4.8,4.1,6,6.5,5.8,5.2,6.8,7.4,6,5.6,7.5,7.8,6.3,5.9,8,8.4)
  x<-c(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16)
  md<-ts(md,frequency=4)
  HWresult<- HoltWinters(md, alpha=0.3, beta=0.15, gamma=0.2)
  fittedValues<-as.data.frame(HWresult$fitted)
  nans<-rep(NaN,4)
  
  yhat<-c(nans,fittedValues$xhat)
  result<-data.frame(x=x,y=as.numeric(md),yhat=yhat)
  print(result)
  ggplot(result,aes(x))+geom_line(aes(y=y,colour='y'))+geom_line(aes(y=yhat,colour='yhat'))
}