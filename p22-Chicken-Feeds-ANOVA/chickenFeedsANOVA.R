chickenFeedsANOVA<-function(){
  # Chicken Feeds - ANOVA           p22, purple book 31.5.15
  #----------------------
  # 
  # ref: W&W pg 325 and built-in data set 'chickwts'
  # 
  # Ho: Chicken weights are not affected by feed type
  #
  #                                       feed type
  # weight(g)   casein    horsebean   linseed   meatmeal    soybean   sunflower
  #             368       179         309       325         243       423
  #             .         .           .         .           .         .
  #----------------------------------------------------------------------------
  # n           (a)
  # mean
  # SS
  #----------------------------------------------------------------------------
  # Source        SS    df    MS    F   p-value
  # between
  # treatments    
  # within
  # (error)
  #----------------------------------------------------------------------------
  # 
  # To get the data into this format
  cw<-chickwts; # make my own copy

  totalSS <- j.stat.sumOfSquares(cw$weight);
  
  feedTypes <- levels(cw$feed); # feed is a factor with 6 levels.
  
  withinSS = 0;
  for(i in 1:length(feedTypes)){
    feedData<- subset(cw, feed==feedTypes[i]);
    ssi <- j.stat.sumOfSquares(feedData$weight);
    withinSS <- withinSS+ssi;
  }
  betweenSS = totalSS - withinSS;
  dofBetween = (length(feedTypes)-1);
  dofWithin = length(cw$feed)-length(feedTypes);
  MSbetween = betweenSS/dofBetween;
  MSwithin = withinSS / dofWithin;
  Fresult = MSbetween / MSwithin;
  pvalue = df(Fresult,dofBetween, dofWithin);
  anovaTable <- list(betweenSS=betweenSS,withinSS=withinSS,totalSS=totalSS,
                     dofBetween = dofBetween,dofWithin=dofWithin,
                     MSbetween = MSbetween, MSwithin=MSwithin,
                     Fresult=Fresult, pvalue=pvalue);
  
  return(anovaTable);
  
  
  
}

