### Balanced Incomplete Block Designs, 10th June 2016

##### ref: Pink iBook pg 38,
#####     http://www.r-bloggers.com/generating-balanced-incomplete-block-designs-bibd/
    

```r
require(crossdes)
```

```
## Loading required package: crossdes
## Loading required package: AlgDesign
## Loading required package: gtools
```

```r
my.design = find.BIB(7, 7, 3)
print(my.design)
```

```
##      [,1] [,2] [,3]
## [1,]    2    5    6
## [2,]    1    3    5
## [3,]    2    3    4
## [4,]    1    4    6
## [5,]    3    6    7
## [6,]    1    2    7
## [7,]    4    5    7
```

```r
isGYD(my.design)
```

```
## 
## [1] The design is a balanced incomplete block design w.r.t. rows.
```
