p31_selectByRank=function(){
#  Outcome of Care Mesaures - Selecting Hospital By Rank     purple book p31, 5.6.15
#  -----------------------------------------------------
#    
#  ref:  Coursera R-programming, Roger Peng, Jeff Leek, Brian Caffo
#        Programming assignment 3, Hospital Quality
# 
# ref:  http://rpubs.com/justmarkham/dplyr-tutorial
#
#  Problem: For a sample of the entire dataset I have the following data frame stored as sampleOutcomeOfCareMeasures.csv
#  
#Observations: 25
#Variables:
#  $ State         (chr) "CA", "CA", "CA", "CA", "CA", "CA", "CA", "CA", "CA...
#$ Hospital.Name (chr) "LOS ANGELES METROPOLITAN MEDICAL CTR", "DESERT REG...
#$ causeOfDeath  (chr) "Heart.Failure", "Heart.Attack", "Pneumonia", "Pneu...
#$ mortalityRate (dbl) 11.6, 15.3, 10.0, 11.3, 16.6, 10.1, 14.7, 10.9, 13....
#  
#  For each state I want ot find the hospital with a gievn ranking and given cause of death.
#  E.g. 'best' for Heart.Attack or 10th for Pneumonia.
#
# Solution: I can use chaing and dplyr functions to create a table showing hospitals by states 
# ranked by mortality rate for a given condition using the following code. Note that we read %>% as 'then'
socm=read.csv('sampleOutcomeOfCareMeasures.csv', stringsAsFactors=F);
socm=tbl_df(socm); # tbl_df makes the data frame a bit more user friendly e.g. diplays more nicely using glimpse
socmHA<-socm %>% filter(causeOfDeath=='Heart.Attack')  %>% arrange(State,mortalityRate);
# 
# which gives   glimpse(socmHA)
#Observations: 10
#Variables:
#  $ State         (chr) "CA", "CA", "CA", "CA", "CA", "CA", "CA", "CA", "OR", "WA"
#$ Hospital.Name (chr) "SAINT VINCENT MEDICAL CENTER", "PARADISE VALLEY HOSPITAL", "VALLEY PRESBYTERIAN HO...
#$ causeOfDeath  (chr) "Heart.Attack", "Heart.Attack", "Heart.Attack", "Heart.Attack", "Heart.Attack", "He...
#$ mortalityRate (dbl) 13.8, 14.7, 14.7, 15.3, 15.4, 15.8, 16.6, 18.6, 16.2, 13.4
#
# Now I wish to retrieve the hospital for each state wth the gien ranking, e.g. 2 for 2nd best.
# Summarise_each will perform the function [2] on each of mortality
# rate and hospital naem. '.' is used in the funs argument to mean 'whatever the variable is'.
rank2 = socmHA %>% group_by(State) %>% summarise_each(funs(.[2]),mortalityRate,Hospital.Name);

# which gives rank2
#Source: local data frame [3 x 3]
#
#State mortalityRate            Hospital.Name
#1    CA          14.7 PARADISE VALLEY HOSPITAL
#2    OR            NA                       NA
#3    WA            NA                       NA
return(rank2);
}