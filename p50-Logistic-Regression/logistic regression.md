## Logistic Regression, 1.5.16
### ref: Purple book pg 50,
### data.princeton.edu/R/glms.html
### Pink ibook pg 94, 96


```r
delinq <- read.delim("~/MyR/Regression/delinq.txt")
print(delinq)
```

```
##   X2 X3 X1 Yes  No
## 1  0  0  1  11  43
## 2  0  0  0  42 169
## 3  1  0  1  14 104
## 4  1  0  0  20 132
## 5  0  1  1   8 196
## 6  0  1  0   2  59
```

```r
lrfit<-glm(cbind(Yes,No)~X2+X3+X1,data=delinq,family=binomial)
summary(lrfit)
```

```
## 
## Call:
## glm(formula = cbind(Yes, No) ~ X2 + X3 + X1, family = binomial, 
##     data = delinq)
## 
## Deviance Residuals: 
##        1         2         3         4         5         6  
##  0.12069  -0.06096  -0.19505   0.16839   0.12453  -0.23260  
## 
## Coefficients:
##             Estimate Std. Error z value Pr(>|z|)    
## (Intercept) -1.38173    0.16171  -8.545  < 2e-16 ***
## X2          -0.54595    0.24619  -2.218   0.0266 *  
## X3          -1.83965    0.38421  -4.788 1.68e-06 ***
## X1          -0.02252    0.25123  -0.090   0.9286    
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## (Dispersion parameter for binomial family taken to be 1)
## 
##     Null deviance: 36.41467  on 5  degrees of freedom
## Residual deviance:  0.15429  on 2  degrees of freedom
## AIC: 33.078
## 
## Number of Fisher Scoring iterations: 3
```
We are now in a position to model various combinations of X1, X2, X3
