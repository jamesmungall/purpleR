

```r
holtLinearTrend<-function(){
# Example data
 md <- read.delim("~/MyR/Time Series/ASWp758.txt")
#  Year  Sales
#  1    21.6
#  2  	22.9
#  3  	25.5
#  4  	21.9
#  5  	23.9
#  6  	27.5
#  7  	31.5
#  8  	29.7
#  9  	28.6
#  10 	31.4

  HWresult<-HoltWinters(md$Sales,alpha=0.2,beta=0.1,gamma=F)
  fittedValues<-as.data.frame(HWresult$fitted)
  md$yhat<-c(NaN,NaN,fittedValues$xhat)
  
  print(md)
#Year  Sales	yhat
#	1	  21.6	NaN
#	2	  22.9	NaN
#	3	  25.5	24.20000
#	4	  21.9	25.78600
#	5	  23.9	26.25708
#	6  	27.5	26.98680
#	7	  31.5	28.30084
#	8	  29.7	30.21606
#	9	  28.6	31.37791
#10	  31.4	32.03184

library("ggplot2")
  ggplot(md, aes(Year)) + 
   geom_line(aes(y = Sales, colour = "Value"))+ 
   geom_line(aes(y = yhat, colour = "yhat"))
}
holtLinearTrend()
```

```
##    Year Sales     yhat
## 1     1  21.6      NaN
## 2     2  22.9      NaN
## 3     3  25.5 24.20000
## 4     4  21.9 25.78600
## 5     5  23.9 26.25708
## 6     6  27.5 26.98680
## 7     7  31.5 28.30084
## 8     8  29.7 30.21606
## 9     9  28.6 31.37791
## 10   10  31.4 32.03184
```

```
## Warning in loop_apply(n, do.ply): Removed 2 rows containing missing values
## (geom_path).
```

![plot of chunk unnamed-chunk-1](figure/unnamed-chunk-1-1.png) 
