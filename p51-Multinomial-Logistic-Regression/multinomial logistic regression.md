### Multinomial Logistic Regression, 1.5.16

##### Purple book pg 51
##### Pink ibook pg97
##### https://onlinecourses.science.psu.edu/stat504/node/226

```r
install.packages('vgam')
```

```
## Error in contrib.url(repos, "source"): trying to use CRAN without setting a mirror
```

```r
library(VGAM)
```

```
## Loading required package: stats4
## Loading required package: splines
```

```r
gator <- read.table("~/MyR/Regression/gator.txt", header=T, quote="\"")
print(gator)
```

```
##    profile Gender Size     Lake Fish Invertebrate Reptile Bird Other
## 1        1      f <2.3   george    3            9       1    0     1
## 2        2      m <2.3   george   13           10       0    2     2
## 3        3      f >2.3   george    8            1       0    0     1
## 4        4      m >2.3   george    9            0       0    1     2
## 5        5      f <2.3  hancock   16            3       2    2     3
## 6        6      m <2.3  hancock    7            1       0    0     5
## 7        7      f >2.3  hancock    3            0       1    2     3
## 8        8      m >2.3  hancock    4            0       0    1     2
## 9        9      f <2.3 oklawaha    3            9       1    0     2
## 10      10      m <2.3 oklawaha    2            2       0    0     1
## 11      11      f >2.3 oklawaha    0            1       0    1     0
## 12      12      m >2.3 oklawaha   13            7       6    0     0
## 13      13      f <2.3 trafford    2            4       1    1     4
## 14      14      m <2.3 trafford    3            7       1    0     1
## 15      15      f >2.3 trafford    0            1       0    0     0
## 16      16      m >2.3 trafford    8            6       6    3     5
```

```r
lrfit<-vglm(cbind(Fish,Invertebrate,Reptile,Bird,Other)~Gender+Size+Lake,data=gator,family=multinomial)
summary(lrfit)
```

```
## 
## Call:
## vglm(formula = cbind(Fish, Invertebrate, Reptile, Bird, Other) ~ 
##     Gender + Size + Lake, family = multinomial, data = gator)
## 
## Pearson residuals:
##                       Min      1Q  Median     3Q   Max
## log(mu[,1]/mu[,5]) -1.164 -0.6538 -0.2471 0.2107 1.325
## log(mu[,2]/mu[,5]) -1.699 -0.7099 -0.1188 0.6763 1.856
## log(mu[,3]/mu[,5]) -1.035 -0.7754 -0.4713 0.2717 1.960
## log(mu[,4]/mu[,5]) -1.046 -0.5315 -0.1158 0.1458 3.331
## 
## Coefficients:
##                Estimate Std. Error z value Pr(>|z|)    
## (Intercept):1   1.43073    0.53809   2.659 0.007840 ** 
## (Intercept):2   1.59976    0.56128   2.850 0.004369 ** 
## (Intercept):3  -1.98531    1.16125  -1.710 0.087334 .  
## (Intercept):4  -1.00138    0.87474  -1.145 0.252304    
## Genderm:1       0.25257    0.46635   0.542 0.588100    
## Genderm:2      -0.21039    0.51388  -0.409 0.682231    
## Genderm:3      -0.37499    0.75538  -0.496 0.619596    
## Genderm:4      -0.35386    0.76233  -0.464 0.642517    
## Size>2.3:1      0.29058    0.45993   0.632 0.527515    
## Size>2.3:2     -1.04568    0.52498  -1.992 0.046387 *  
## Size>2.3:3      0.84762    0.71469   1.186 0.235621    
## Size>2.3:4      1.02082    0.72500   1.408 0.159120    
## Lakehancock:1  -0.76658    0.56855  -1.348 0.177563    
## Lakehancock:2  -2.54709    0.75517  -3.373 0.000744 ***
## Lakehancock:3   0.36289    1.26958   0.286 0.775007    
## Lakehancock:4  -0.19131    0.90721  -0.211 0.832985    
## Lakeoklawaha:1 -0.02606    0.77776  -0.034 0.973273    
## Lakeoklawaha:2  0.88712    0.79712   1.113 0.265747    
## Lakeoklawaha:3  2.50420    1.29597   1.932 0.053322 .  
## Lakeoklawaha:4 -0.57641    1.37417  -0.419 0.674880    
## Laketrafford:1 -1.55776    0.62567  -2.490 0.012784 *  
## Laketrafford:2 -0.40194    0.62693  -0.641 0.521439    
## Laketrafford:3  1.50329    1.20103   1.252 0.210691    
## Laketrafford:4 -0.32077    0.95896  -0.335 0.738001    
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Number of linear predictors:  4 
## 
## Names of linear predictors: 
## log(mu[,1]/mu[,5]), log(mu[,2]/mu[,5]), log(mu[,3]/mu[,5]), log(mu[,4]/mu[,5])
## 
## Dispersion Parameter for multinomial family:   1
## 
## Residual deviance: 50.2637 on 40 degrees of freedom
## 
## Log-likelihood: -73.3221 on 40 degrees of freedom
## 
## Number of iterations: 5
```
We are now in a position to try various models.

