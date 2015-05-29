selectSingleColumn<-function(){
#
# Selecting a Column from Iris Data Frame       purple book pg 14, 27.5.15
# ---------------------------------------
# 
# ref: R for Dummies ch13 pg 282
#
# Imagine that we want to select one column from the table. We may want to get a result which only 
# contains the values. To do this, use iris[,'Sepal.Length'].
# Alternatively, we may want to retain the dataframe structure. We can do this using iris['Sepal.Length']
#
# Why do we get these results?
# What would happen if we tried iris$Sepal.Length ?
# What would happen if we used drop=FALSE?

# Command                 Result                      str                           class
# -------------------------------------------------------------------------------------------
# iris[,'Sepal.Length']   5.1 4.9 ...                 num [1:150] 5.1 4.9 ...       "numeric"
# -------------------------------------------------------------------------------------------
# iris['Sepal.Length']      Sepal.Length              'data.frame':  150 obs. of  1 variable:
#                         1          5.1              $ Sepal.Length: num  5.1 4.9 ...
#                         2          4.9                                        "data.frame"
#---------------------------------------------------------------------------------------------
# iris[,'Sepal.Length',     same as iris['Sepal.Length'] i.e. a data frame
#       drop=FALSE]
#---------------------------------------------------------------------------------------------
# iris$Sepal.Length         same as iris[,'Sepal.Length'] i.e. an unnamed numeric vector
#---------------------------------------------------------------------------------------------
#
# Summmary:   A data frame is a named list of vectors. Therefore the list elements can be 
# selected using the name, which in this case is Sepal.Length.
#   By default, R will simplify the result to a vector if a single element has been selected
# using iris[,'Sepal.Length']. This can be oeverridden using drop=FALSE.
#   It seems surprising that iris$Sepal.Length and iris['Sepal.Length'] give different results.
}
