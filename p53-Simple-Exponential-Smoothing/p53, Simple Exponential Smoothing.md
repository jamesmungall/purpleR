## Simple Exponential Smoothing, 6.6.16, Purple book pg 53

#### Example data, Ref: Pink book pg 83, ASW pg 751-3
#### md <- read.delim("~/MyR/Time Series/ASWp753.txt")
  


```r
ses<-function(){
  # Example data, Ref: Pink book pg 83, ASW pg 751-3
  md <- read.delim("~/MyR/Time Series/ASWp753.txt")

  # using in-built functionality to do calculation
  HWresult<-HoltWinters(md$Value,alpha=0.2,beta=F,gamma=F)
  fittedValues<-as.data.frame(HWresult$fitted)
  md$yhat<-c(NaN,fittedValues$xhat)
  
    print(md)
  
  library("ggplot2", lib.loc="/Library/Frameworks/R.framework/Versions/3.1/Resources/library")
  ggplot(md, aes(Week)) + 
   geom_line(aes(y = Value, colour = "Value"))+ 
   geom_line(aes(y = yhat, colour = "yhat"))
}
ses()
```

```
##    Week Value     yhat
## 1     1    17      NaN
## 2     2    21 17.00000
## 3     3    19 17.80000
## 4     4    23 18.04000
## 5     5    18 19.03200
## 6     6    16 18.82560
## 7     7    20 18.26048
## 8     8    18 18.60838
## 9     9    22 18.48671
## 10   10    20 19.18937
## 11   11    15 19.35149
## 12   12    22 18.48119
```

```
## Warning in loop_apply(n, do.ply): Removed 1 rows containing missing values
## (geom_path).
```

![plot of chunk unnamed-chunk-1](figure/unnamed-chunk-1-1.png) 
 
