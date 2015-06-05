selectByRank<-function(state='CA',outcome='heart attack', num='best'){
  
  # Validate the outcome as before
  #----------------------------------------------------------
  allOutcomes<-c('heart attack', 'heart failure','pneumonia');
  checkOutcome<-function(){
    validOutcome <- (outcome %in% allOutcomes);
    if(!validOutcome){
      stop('invalid outcome');
    }
    else{
      return(TRUE);
    }
  }
  checkOutcome();
  #---------------
  ## and read outcome data as before
  outcome<-tolower(outcome);
  if(outcome=='heart attack') outcome <- 'Heart.Attack';
  if(outcome=='heart failure') outcome <- 'Heart.Failure';
  if(outcome=='pneumonia') outcome <- 'Pneumonia';
  #------------------------------------------------------
  
  socm=read.csv('sampleOutcomeOfCareMeasures.csv');
socmSubset<-subset(socm,(causeOfDeath==outcome & State==state));
socmArrange<-arrange(socmSubset,State,mortalityRate,Hospital.Name);

# rank is given by the variable num
# validate num argument, given as second argument to rankall function
if(num=='best') num=1;
if(num=='worst') num=length(socmArrange[,1]);
if(!(is.numeric(num))) stop('Please use best, worst or an integer for ranking');
HospWithRank<-subset(socmArrange,row.names(socmArrange)==num,select=c('State','Hospital.Name'));

return(socmArrange);

}
