usingArrange<-function(){
  # Sorting a Data Frame by more than one column using arrange      purple book pg 30, 4.6.15
  #-----------------------------------------------------------
  #
  #ref: www.cookbook-r.com/Manipulating_data/Sorting/
  #
  # Problem: I have created a sample outcome of measures.csv file in Assigment-3-Hospital_Quality folder. It has the format
  #
  #'data.frame':  25 obs. of  5 variables:
  #  $ X            : int  1 2 3 4 5 6 7 8 9 10 ...
  #$ State        : Factor w/ 3 levels "CA","OR","WA": 1 1 1 1 1 1 1 1 1 1 ...
  #$ Hospital.Name: Factor w/ 23 levels "DESERT REGIONAL MEDICAL CENTER",..: 8 1 21 5 11 9 13 7 16 3 ...
  #$ causeOfDeath : Factor w/ 3 levels "Heart.Attack",..: 2 1 3 3 1 3 1 2 1 3 ...
  #$ mortalityRate: num  11.6 15.3 10 11.3 16.6 10.1 14.7 10.9 13.8 11.8 ...
  #
  # I wish this to be sorted by State, causeOfDeath & mortalityRate
  # Solution:
  socm<-read.csv("sampleOutcomeOfMeasures.csv");
  socm<-arrange(socm, State,causeOfDeath,mortalityRate);
  return(socm);
  
  # Comments
  #
  # Wickham's article 'Tidy Data' (Journal of Statistical Software, 2014) identifies 'four fundamental verbs of data manipulation':
  #
  # Filter:     Subsetting or removing observations based upon a condition.
  # Transform:  Adding or modifying variables. These modifications can invove either a single variable (e.g. log-transformation),
  #             or multiple varialbes (e.g. computing density from weight & volume).
  # Aggregate:  Collapsing multiple values into a single value (e.g. mean or sum).
  # Sort:       Changing the order of observations.
  #
  #       Manipulation      Method                    Purplebook pg example
  #       Filter            subset                    p14-16
  #       Transform         transform 
  #       Aggregate         aggregate, summarise*     p26
  #       Sort              arrange*                  p19, p30
  #
  #       The four manipulations are often modified by the "by" preposition, for which wecan use the method ddply* (p26 for example)
  #
  #  * plyr or dplyr package
}
