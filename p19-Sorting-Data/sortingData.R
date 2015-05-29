sortingData<-function(){
  # 
  # Sorting Data          purple book pg19, 29.5.15
  #------------------------------------------------
  # 
  # Having made a subset of the x77state dataframe, how can I sort the results?
  # make my own copy and select the columns I want
  ms<-subset(state.x77,select=c(Area));
  # convert to a data frame
  ms<-as.data.frame(ms);
  # add columns I do want
  ms$Long<-state.center$x;
  ms$Latt<-state.center$y;
  ms$Div<-state.division;
  ms$Region<-state.region;
  # Let's create a subset of the states in the region South
  ms <- subset(ms, Region=='South');
  # The ranks of states by increasing area are given by
  rankByArea <- order(ms$Area);
  # Now we can relist the dataframe
  msr <- ms[rankByArea,];

  
  return(msr);
}
