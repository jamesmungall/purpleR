selectMoreThanOneColumn<-function(){
# Selecting more than one Column from Iris Data Frame           purple book pg 15, 27.5.15     
# ---------------------------------------------------
# 
# ref: R for Dummies ch13 pg 282
#
# How would we select two columns from a data frame?
# How can we ensure the result retains the structure we want?
#
# Command                   Results                       Str
#------------------------------------------------------------------------------------------------
# iris[,c('Sepal.Length',    Sepal.Length Sepal.Width    'data.frame':  150 obs. of  2 variables:
#      'Sepal.Width')]      1         5.1       3.5       $ Sepal.Length: num  5.1 4.9 
#                           2         4.9       3.0       $ Sepal.Width : num  3.5 3 3.2
#------------------------------------------------------------------------------------------------
# iris[,c('Sepal.Length','Sepal.Width'),drop=FALSE]       same result. drop=FALSE is ignored
#------------------------------------------------------------------------------------------------
# iris[c('Sepal.Length','Sepal.Width')]                   Same result. 
# ------------------------------------------------------------------------------------------------
# iris[c('Sepal.Length','Sepal.Width'),drop=FALSE]        Same result and Warning message: 
#                                                         'drop' argument will be ignored
#------------------------------------------------------------------------------------------------
# Summary: A dataframe is always returned
}
