### Logit Model - Interpretation of Coefficients, 7.6.16

#### Purple book pg 52
#### Pink ibook pg 113
#### data.princeton.edu/wws509/notes/c3.pdf

```r
contraceptionAgeDesire <- read.delim("~/MyR/Regression/contraceptionAgeDesire.txt")
print(contraceptionAgeDesire)
```

```
##    age desire using notUsing
## 1 20.0      1    58      265
## 2 20.0      0    14       60
## 3 27.5      1    68      215
## 4 27.5      0    37       84
## 5 35.0      1    79      230
## 6 35.0      0   158      145
## 7 45.0      1    14       43
## 8 45.0      0    79       58
```

```r
glm(cbind(using,notUsing)~age+desire,family=binomial,data=contraceptionAgeDesire)
```

```
## 
## Call:  glm(formula = cbind(using, notUsing) ~ age + desire, family = binomial, 
##     data = contraceptionAgeDesire)
## 
## Coefficients:
## (Intercept)          age       desire  
##    -1.69076      0.04411     -0.82590  
## 
## Degrees of Freedom: 7 Total (i.e. Null);  5 Residual
## Null Deviance:	    145.7 
## Residual Deviance: 18.99 	AIC: 67.48
```
Interpretation

log Pr(using)/Pr(notUsing) = -1.691 + 0.0441age - 0.8259desire
