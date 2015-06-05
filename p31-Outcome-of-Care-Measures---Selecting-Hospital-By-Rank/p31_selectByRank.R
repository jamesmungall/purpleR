p31_selectByRank=function(){
#  Outcome of Care Mesaures - Selecting Hospital By Rank     purple book p31, 5.6.15
#  -----------------------------------------------------
#    
#  ref:  Coursera R-programming, Roger Peng, Jeff Leek, Brian Caffo
#        Programming assignment 3, Hospital Quality
# 
#  Problem: For a sample of the entire dataset I have the following data frame stored as sampleOutcomeOfCareMeasures.csv
#  
#    $ State        : Factor w/ 3 levels "CA","OR","WA": 1 1 1 1 1 1 1 1 1 1 ...
#  'data.frame':  25 obs. of  4 variables:
#  $ Hospital.Name: Factor w/ 23 levels "DESERT REGIONAL MEDICAL CENTER",..: 8 1 21 5 11 9 13 7 16 3 ...
#  $ causeOfDeath : Factor w/ 3 levels "Heart.Attack",..: 2 1 3 3 1 3 1 2 1 3 ...
#  $ mortalityRate: num  11.6 15.3 10 11.3 16.6 10.1 14.7 10.9 13.8 11.8 ...
#  
#  For each state I want ot find the hospital with a gievn ranking and given cause of death.
#  E.g. 'best' for Heart.Attack or 10th for Pneumonia.
}