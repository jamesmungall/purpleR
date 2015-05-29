statex77<-function(){
  #
  #Adding Columns to a Data Frame, State x77        Purple Book pg 17, 28.5.15
  #-----------------------------------------
  # 
  # make my own copy and select the columns I wantms[]
  ms<-subset(state.x77,select=c(Area));
  # convert to a data frame
  ms<-as.data.frame(ms);
  # add columns I do want
  ms$Long<-state.center$x;
  ms$Latt<-state.center$y;
  ms$Div<-state.division;
  ms$Region<-state.region;

  
  
}