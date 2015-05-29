missingValues<-function(){
  # Coping with Missing Values (Na's)  Purple Book pg12, 27.5.15
  # ---------------------------------
  # ref: Coursera, R Programming, Week 1, lecture 'Subsetting - Removing missing values'
  #
usingIsNA<-function(){
  #  x    How do I calculate the mean of these values?    
  #  1
  #  2    I need to re-write the vector without the NA values
  #  NA   Use is.na(x)
  #  4
  #  NA
  #  5
  
  x1<-c(1,2,NA,4,NA,5);
  mean(x1); 
  # returns NA since sum(x1) returns NA.
  # n.b. length(x1) returns 6
  # To get sum(x1) (excluding NA values) / length(x1) (excluding NA values)
  # = 12 / 4 = 3 in  this case, use:
  missingValuesBoolean <-is.na(x1);   # or use complete.cases(x1)
  x2<-x1[!missingValuesBoolean];
  mean(x2);   # returns 3
}

usingCompleteCases<-function(){
  #
  # X,Y   How do I create a table which omits rows with
  # 1,3   an 'NA' in the X or Y column?
  # 2,NA
  # NA,5
  # 4,6
  # NA,6
  # 5,6
  #
  # Use complete.cases to create
  #
  # X,Y
  # 1,3
  # 4,6
  # 5,6
  xyData<-read.csv('xyData.csv');
  completeCasesBoolean<-complete.cases(xyData);
# note on use of comma: We wish to select rows which are TRUE. The xyData
# is referenced using xyData[rowIndex,colIndex]
# Therefore, to select the correct rows, we use xyData[rowBooleans,]
  xyDataCompleteCases<-xyData[completeCasesBoolean,]; 

  write.csv(xyDataCompleteCases,file='xyDataCompleteCases.csv',row.names=FALSE);
  return(xyDataCompleteCases);
}
return(list(usingIsNA=usingIsNA,usingCompleteCases=usingCompleteCases));



  
}