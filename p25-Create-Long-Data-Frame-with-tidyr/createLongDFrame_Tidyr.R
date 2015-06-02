createLongDataFrameWithTidyR<-function(){
  # Create Long Data Frame format with tidyr       purple book pg25, 2.6.15
  #
  # ref: https://rpubs.com/bradleyboehmke/data_wrangling
  #
  # I would usually think that the best way to display data across treatments 
  # as a wide data frame (see below for example).
  # 
  # However, for computation, it may be better to use the long data frame format,
  # as was the case in the one-way ANOVA calculation.
  #
  # To do this, first create a wide format data frame:
  c1=c(8,4,5);
  c2=c(5,7,4);
  c3=c(7,9,6);
  wideDF=data.frame(c1=c1,c2=c2,c3=c3); 
#  c1 c2 c3        'data.frame':  3 obs. of  3 variables:
#1  8  5  7           $ c1: num  8 4 5     
#2  4  7  9           $ c2: num  5 7 4
#3  5  4  6           $ c3: num  7 9 6

# Now use gather (in tidyr package) to format as a long data frame.
# ?gather; gather(data, key, value)
# wideDF is data
# treatment is the key; a column name representing variable names, i.e. c1, c2, c3 are 'treatments'.
# value is the value; a column name representing column values, i.e. 8, 4, 5 are 'values'.

longDF = gather(wideDF,treatment,value);

#     treatment value      
#1        c1        8           'data.frame':  9 obs. of  2 variables:
#2        c1        4           $ treatment: Factor w/ 3 levels "c1","c2","c3": 1 1 1 2 2 2 3 3 3
#3        c1        5           $ value : num  8 4 5 5 7 4 7 9 6
#4        c2        5
#5        c2        7
#6        c2        4
#8        c3        9
#7        c3        7
#9        c3        6
}