createWideDFforChickWts<-function(){
  #
  # Create Wide Data Frame with tidyr, spread()   purple book pg29, 3.6.15
  #--------------------------------------------
  # https://github.com/jamesmungall/purpleR/tree/master/p29-Create-wide-data-frame-with-tidyr-spread
  # http://www.cookbook-r.com/Manipulating_data/Converting_data_between_wide_and_long_format/
  #
  # Problem: We wish to see the empirical 5th & 95th percentiles of the chickwts data by feed type.
  cw <- chickwts;
  percentiles_5th_95th = ddply(cw,'feed',summarise,
                   weight_5th_or_95th=quantile(weight,probs=c(0.05,0.95))
                 );
  # tidy the percentiles result into a wide format table.
  data=percentiles_5th_95th;
#  data
#           feed  weight_5th_or_95th
#  1     casein 219.30
#  2     casein 396.30
#  3  horsebean 115.20
#
# Add 5th & 95th percentiles labels
data$perc=c('fifth','ninety5th')
# data
#         feed     perc   weight_5th_or_95th
#1     casein     fifth   219.30
#2     casein ninety5th   396.30
#3  horsebean     fifth   115.20
#
# 'data.frame':  12 obs. of  3 variables:
#$ feed: Factor w/ 6 levels "casein","horsebean",..: 1 1 2 2 3 3 4 4 5 5 ...
#$ perc: chr  "fifth" "ninety5th" "fifth" "ninety5th" ...
#$ ci  : num  219 396 115 222 145 ...
#
# perc needs to be a factor
data$perc<-factor(data$perc);
# $ perc: Factor w/ 2 levels "fifth","ninety5th": 1 2 1 2 1 2 1 2 1 2 ...
#
# Now create the wide data frame. Format of spread is spread(data,key,value)
# key is name of column containing new column names. In this case perc.
# value is the name of the column containing the values. In this case, weight_5th_or_95th
data_wide <- spread(data,perc,weight_5th_or_95th);
# order
data_wide<-data_wide[order(data_wide$fifth),];
# return result 
  return(data_wide);
#
#       feed  fifth ninety5th
#2 horsebean 115.20    222.50
#3   linseed 144.85    288.10
#5   soybean 166.45    327.70
#4  meatmeal 179.50    362.00
#1    casein 219.30    396.30
#6 sunflower 263.95    405.95
#
# Now we can clearly see the difference in spread of the different feeds.
#
#> str(result)
#  $ feed     : Factor w/ 6 levels "casein","horsebean",..: 2 3 5 4 1 6
##'data.frame':  6 obs. of  3 variables:
#$ fifth    : num  115 145 166 180 219 ...
#$ ninety5th: num  222 288 328 362 396 ...
#
# Notes: The data has been used in long format for analysis and wide format
# for presentation.
}