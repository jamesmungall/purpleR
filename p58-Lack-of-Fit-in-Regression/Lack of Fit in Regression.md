### Lack of Fit in Regression, 10th June 2016

##### ref: Pink iBook pg 49,
#####      MyR/Regression/DraperSmith_pg102.txt


```r
ds102 <- read.delim("~/MyR/Regression/DraperSmith_pg102.txt")
print(ds102)
```

```
##     Y  X
## 1 2.1 -2
## 2 3.0 -5
## 3 3.2  0
## 4 1.4  2
## 5 2.6  1
## 6 3.9 -2
## 7 1.3  2
## 8 3.4  0
## 9 2.8  2
```

```r
aov.result<-aov(Y~X + factor(X), data=ds102)
summary(aov.result)
```

```
##             Df Sum Sq Mean Sq F value Pr(>F)
## X            1  1.452  1.4521   1.906  0.239
## factor(X)    3  1.761  0.5871   0.771  0.568
## Residuals    4  3.047  0.7617
```
We interpret factor(X) as lack of fit and residuals as pure error.
