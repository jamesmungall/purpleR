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
#  Area     Long    Latt                Div Region
#  Delaware         1982 -74.9841 38.6777     South Atlantic  South
#  Maryland         9891 -76.6459 39.2778     South Atlantic  South
#  West Virginia   24070 -80.6665 38.4204     South Atlantic  South
#  South Carolina  30225 -80.5056 33.6190     South Atlantic  South
#  Kentucky        39650 -84.7674 37.3915 East South Central  South
  
  return(msr);
}
