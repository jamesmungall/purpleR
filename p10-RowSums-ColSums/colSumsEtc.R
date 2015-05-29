colSumsEtc<-function(){
# Purple R book, page 10
#
# RowSums, ColSums, RowMeans,ColMeans & other functions.  25.5.15
# ------------------------------------------------------
#
# ref: R programming, Coursera, Loop functions, apply video lecture
#
# To calculate row and column sums and means, use
# rowSums
# colSums
# rowMeans
# colMeans
#
  example1<-function(){
# example data 1:
#    8,6,3
#    7,2,5
#    8,6,5
    ex1_data<-read.csv('example1data.csv',header=FALSE);
    result<-ex1_data;
    return(result);
# colSums on this result gives
#   V1  V2 
#   88 123 
#
# Use colMeans, rowSums, rowMeans in a similar way.
  }

# More generally we can apply a function to each of the rows using;
#   apply(dataset,1,myFunction)  n.b. '1' means apply across rows
#   apply(dataset,2,myFunction)  n.b. '2' means apply down columns
#
# For example, the 'quantile' function can be used to get the 5th and 95th percentile of
# the data using;
#   apply(dataset, 1, quantile, probs<-c(0.05,0.95)); n.b. '1' means apply across rows
#   apply(dataset, 2, quantile, probs<-c(0.05,0.95)); n.b. '2' means apply down columns
  example2<-function(){
# example data 2:
#    4,6    
#    2,7     
#    ...  (20 of these)  
    example2_data<-read.csv('example2data.csv',header=FALSE);# 'example2_data' is a data frame
    result<-example2_data;
    return(result)
# apply(example2_data,2,quantile,probs=c(0.05,0.95)); on this result gives
#       V1   V2
#   5%   2   3.95
#   95%  8   8.00
  }
  
# The function used in the apply method must take a vector as an input (either a row or
# column), and outputs a result for each row or column operated upon. Therefore, if 
# operating across rows, the result will be a list as long as the number of rows. 
# If operating down columns, result will be a list as long as the number of columns.


  berkeley<-function(){
    # ref: Wonnacott and Wonnacott pg 23
    # How hard was it to get in 1973 for women to get into Berkeley?
#    
# datafile.csv contains table of data
# use berkDf as dataframe for Berkeley data 
    berkDf <- read.csv("berkeley.csv",row.names='faculty');
# a.  What is the difference in admission rates between men and women? How good is this
#     evidence of sex discrimination?
#
    totals<-colSums(berkDf);
    percentage_men_admissions <- totals['men_admissions']/totals['men_applicants'];
    percentage_women_admissions <- totals['women_admissions']/totals['women_applicants'];
# results: men 44.5%, women 34.9%
#
# b.  What is the percentage admission rates for arts? And for science?
percentage_men_admissions_arts <- berkDf['arts','men_admissions'] / berkDf['arts','men_applicants']
percentage_women_admissions_arts <- berkDf['arts','women_admissions'] / berkDf['arts','women_applicants']
percentage_men_admissions_science <- berkDf['science','men_admissions'] / berkDf['science','men_applicants']
percentage_women_admissions_science <- berkDf['science','women_admissions'] / berkDf['science','women_applicants']

pma=percentage_men_admissions_arts;
pwa=percentage_women_admissions_arts;
pms=percentage_men_admissions_science;
pws=percentage_women_admissions_science;

percent_arts<-c(pma,pwa);
names(percent_arts)<-c("men","women");
percent_science<-c(pms,pws);
names(percent_science)<-c("men","women");

admission_rates <- rbind(percent_arts,percent_science);
#
# Let's create a table for men and a table for women. Then, use the apply function to calculate
# the percentage admissions for each row (i.e. arts & science)
menTable<- berkDf[,c('men_applicants','men_admissions')];
colnames(menTable)<-c('applicants','admissions');
percentAdmit<-function(admissionTable){
  return(admissionTable[,'admissions']/admissionTable[,'applicants']);
}
    result <- list(berkDf=berkDf, admission_rates=admission_rates);
    return(result);
  }

  result<-list(example1=example1,example2=example2,berkeley=berkeley);
}