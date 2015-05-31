modelRailways<-function(){
  mr<-read.csv('myOpinion.csv',strip.white = TRUE);
  # convert factors, A - E, to numbers 1 - 5;
  # A - 1
  # B - 2
  # C - 3
  # D - 4
  # E - 5
  sceneAsNumbers <- as.numeric(mr$scene);
  valueOfScene <- function(sceneAsNumbers){
    # I will choose to give A a value of 5, B a value of 4, etc.
    # A - 1; 6 - 1 = 5
    # B - 2; 6 - 2 = 4
    # C - 3; 6 - 3 = 3
    # D - 4; 6 - 4 = 2
    # E - 5; 6 - 5 = 1
    valueOfScene <- 6 - sceneAsNumbers; # This will convert A to 5, B to 4 etc.
    #
    # However, I could put double value on the scenery
    # valueOfScene <- 2*(6 - sceneAsNumbers); # This will convert A to 10, B to 8 etc.
    return(valueOfScene);
  }
  mr$total=mr$op + valueOfScene(sceneAsNumbers);
  # Now let's order by total from best to worst
  rankByTotal<-order(mr$total,decreasing=T);
  mr <- mr[rankByTotal,];
  write.csv(mr,file='orderedOpinion.csv');
  return(mr);
}