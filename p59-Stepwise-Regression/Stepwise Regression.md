### Stepwise Regression, 11th June 2016

##### ref: Pink ibook pg 64, 65
##### https://onlinecourses.science.psu.edu/stat501/node/329


```r
cement <- read.table("~/MyR/Regression/cement.txt", header=T, quote="\"")
lm_null<-lm(y~1,data=cement)
lm_full<-lm(y~x1+x2+x3+x4,data=cement)
step_result <- step(lm_null, scope=list(lower=lm_null, upper=lm_full), direction="forward")
```

```
## Start:  AIC=71.44
## y ~ 1
## 
##        Df Sum of Sq     RSS    AIC
## + x4    1   1831.90  883.87 58.852
## + x2    1   1809.43  906.34 59.178
## + x1    1   1450.08 1265.69 63.519
## + x3    1    776.36 1939.40 69.067
## <none>              2715.76 71.444
## 
## Step:  AIC=58.85
## y ~ x4
## 
##        Df Sum of Sq    RSS    AIC
## + x1    1    809.10  74.76 28.742
## + x3    1    708.13 175.74 39.853
## <none>              883.87 58.852
## + x2    1     14.99 868.88 60.629
## 
## Step:  AIC=28.74
## y ~ x4 + x1
## 
##        Df Sum of Sq    RSS    AIC
## + x2    1    26.789 47.973 24.974
## + x3    1    23.926 50.836 25.728
## <none>              74.762 28.742
## 
## Step:  AIC=24.97
## y ~ x4 + x1 + x2
## 
##        Df Sum of Sq    RSS    AIC
## <none>              47.973 24.974
## + x3    1   0.10909 47.864 26.944
```
We can see that minimum AIC is acheived for y ~ x4 + x1 + x2

Alternatively use bestglm from bestglm package.

```r
library(bestglm)
```

```
## Loading required package: leaps
```

```r
# This method requires response, y, to be in last column.
cement2 <- cement[c(2,3,4,5,1)]

bestglm_result <- bestglm(cement2)
bestglm_result
```

```
## BIC
## BICq equivalent for q in (1.33546307553578e-05, 0.514850888948955)
## Best Model:
##               Estimate Std. Error  t value     Pr(>|t|)
## (Intercept) 52.5773489 2.28617433 22.99796 5.456571e-10
## x1           1.4683057 0.12130092 12.10465 2.692212e-07
## x2           0.6622505 0.04585472 14.44236 5.028960e-08
```

```r
bestglm_result$BestModels
```

```
##     x1    x2    x3    x4 Criterion
## 1 TRUE  TRUE FALSE FALSE  24.54989
## 2 TRUE  TRUE FALSE  TRUE  24.66873
## 3 TRUE  TRUE  TRUE FALSE  24.70604
## 4 TRUE FALSE  TRUE  TRUE  25.42240
## 5 TRUE  TRUE  TRUE  TRUE  27.20409
```

```r
#Note that this result is different, suggesting y ~ x1 + x2. This is because BIC rather than AIC #is used as the criterion by default. We can change this, and see that y ~ x4 + x1 + x2 is #chosen as before.

bestglm_resultAIC <- bestglm(cement2, IC="AIC")
bestglm_resultAIC
```

```
## AIC
## BICq equivalent for q in (0.514850888948955, 0.780344801629043)
## Best Model:
##               Estimate Std. Error   t value     Pr(>|t|)
## (Intercept) 71.6483070 14.1423935  5.066208 6.753322e-04
## x1           1.4519380  0.1169976 12.409981 5.780764e-07
## x2           0.4161098  0.1856105  2.241844 5.168735e-02
## x4          -0.2365402  0.1732878 -1.365014 2.053954e-01
```
bestglm does not show us the steps involved. However, it does give a useful est, SE output of the final result, and a useful output of the tested models with AIC for comparison. Note that AIC is equivalent to Cp.
