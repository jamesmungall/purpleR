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
