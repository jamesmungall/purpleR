Making Tables for Split Plot Analysis
========================================================



```r
library(dplyr)
```

```
## 
## Attaching package: 'dplyr'
## 
## The following object is masked from 'package:stats':
## 
##     filter
## 
## The following objects are masked from 'package:base':
## 
##     intersect, setdiff, setequal, union
```

```r
  var_date_block_yields <- read.delim("split_plot.txt")
  var_block_totals <- var_date_block_yields %>% group_by(block, variety) %>% summarise(sum(yield))
  block_totals     <- var_date_block_yields %>% group_by(block) %>% summarise(sum(yield))
  var_totals       <- var_date_block_yields %>% group_by(variety) %>% summarise(sum(yield))
  date_totals      <- var_date_block_yields %>% group_by(date) %>% summarise(sum(yield))
  date_var_totals  <- var_date_block_yields %>% group_by(date, variety) %>% summarise(sum(yield))


block_totals
```

```
## Source: local data frame [6 x 2]
## 
##   block sum(yield)
## 1     1      22.49
## 2     2      20.32
## 3     3      21.44
## 4     4      20.01
## 5     5      16.47
## 6     6      14.24
```

```r
var_totals
```

```
## Source: local data frame [3 x 2]
## 
##   variety sum(yield)
## 1 Cossack      37.72
## 2   Ladak      39.99
## 3  Ranger      37.26
```

```r
date_totals
```

```
## Source: local data frame [4 x 2]
## 
##   date sum(yield)
## 1    A      32.06
## 2    B      24.13
## 3    C      28.34
## 4    D      30.44
```

```r
var_block_totals
```

```
## Source: local data frame [18 x 3]
## Groups: block
## 
##    block variety sum(yield)
## 1      1 Cossack       7.84
## 2      1   Ladak       8.27
## 3      1  Ranger       6.38
## 4      2 Cossack       6.82
## 5      2   Ladak       6.75
## 6      2  Ranger       6.75
## 7      3 Cossack       7.37
## 8      3   Ladak       6.33
## 9      3  Ranger       7.74
## 10     4 Cossack       5.81
## 11     4   Ladak       7.94
## 12     4  Ranger       6.26
## 13     5 Cossack       5.53
## 14     5   Ladak       5.88
## 15     5  Ranger       5.06
## 16     6 Cossack       4.35
## 17     6   Ladak       4.82
## 18     6  Ranger       5.07
```

```r
date_var_totals
```

```
## Source: local data frame [12 x 3]
## Groups: date
## 
##    date variety sum(yield)
## 1     A Cossack      10.59
## 2     A   Ladak      11.25
## 3     A  Ranger      10.22
## 4     B Cossack       7.81
## 5     B   Ladak       7.84
## 6     B  Ranger       8.48
## 7     C Cossack       9.46
## 8     C   Ladak       9.98
## 9     C  Ranger       8.90
## 10    D Cossack       9.86
## 11    D   Ladak      10.92
## 12    D  Ranger       9.66
```
