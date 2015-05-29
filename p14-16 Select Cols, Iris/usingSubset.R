selectRowsOfaParticularSpecies<-function(){
# Selecting rows of a Particular Species from Iris Data Frame   27.5.15
# -----------------------------------------------------------
#
# Now we want to creat a dataframe which only includes the setosa species. Use:
#  
#  iris[iris$Species=='setosa',]
# or
#  subset(iris,Species=='setosa');    <-- this will be our preferred method
#
# Having done this for versicolor and virginica we are in a position to compare
# the species.
# For example:
# n.b. 5th column is Species and we can't perform quantile on it
apply(setosa[-5],2,quantile);   
# Sepal.Length Sepal.Width Petal.Length Petal.Width
# 0%            4.3       2.300        1.000         0.1
# 25%           4.8       3.200        1.400         0.2
# 50%           5.0       3.400        1.500         0.2
# 75%           5.2       3.675        1.575         0.3
# 100%          5.8       4.400        1.900         0.6
apply(versicolor[-5],2,quantile)
# Sepal.Length Sepal.Width Petal.Length Petal.Width
# 0%            4.9       2.000         3.00         1.0
# 25%           5.6       2.525         4.00         1.2
# 50%           5.9       2.800         4.35         1.3
# 75%           6.3       3.000         4.60         1.5
# 100%          7.0       3.400         5.10         1.8
apply(virginica[-5],2,quantile)
# Sepal.Length Sepal.Width Petal.Length Petal.Width
# 0%          4.900       2.200        4.500         1.4
# 25%         6.225       2.800        5.100         1.8
# 50%         6.500       3.000        5.550         2.0
# 75%         6.900       3.175        5.875         2.3
# 100%        7.900       3.800        6.900         2.5
#
# Now we can see how the size of the sepals and petals change with variety.
#
# Summary
#   The commands iris[iris$Species=='setosa',] and subset(iris,Species=='setosa')
# both include the crucial test, Species=='setosa'. The first
# method (using square brackets and then generating a boolean list on the fly) is
# more idiomatic and therefore less intuitive. It also includes a forgettalbe comma.
# However, it is a common R way of doing things.
#   Subset has drop=FALSE by default which means that whilst iris$Sepal.Length
# will collapse the data frame to a vector behind your back, subset(iris,Species==
# 'setosa') won't.
#   Subset has a 'select' argument to select columns from data frame.
# For example, subset(iris,Species=='setosa',select='Sepal.Length') returns a
# dataframe, with variable $Sepal.Length holding 50 numbers.
# To acheive this with square brackets would be 
# iris[iris$Species=='setosa','Sepal.Length',drop=FALSE]
# It took me three attempts to get this code correct, but I got it first time with
# subset. Therefore, subset is the preferred method.
#
}