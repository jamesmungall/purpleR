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
# format is find.BIB(treatments(t), blocks(b), blocksize(k) )
my.design = find.BIB(4, 4, 3)
# To check if balanced;
isGYD(my.design)
```

```
## 
## [1] The design is a balanced incomplete block design w.r.t. rows.
```

```r
# The output is written in numbers. I have previously used letters for treatments.
treat_letters <- LETTERS[my.design]
for(i in 1:length(my.design)){
  my.design[i] <- treat_letters[i]
}

# Note that blocks are rows. When I have written BIBD I have used a column for each block.
# To change this, transpose matrix output.
print(t(my.design))
```

```
##      [,1] [,2] [,3] [,4]
## [1,] "B"  "A"  "A"  "A" 
## [2,] "C"  "C"  "B"  "B" 
## [3,] "D"  "D"  "C"  "D"
```
