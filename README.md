SoundexBR
=========

### Phonetic Coding Algorithm For Brazilian Portuguese. 

SoundexBR returns a census-like phonetic code of a string name given the Portuguese sound system. This function was outlined to work with the \code{RecordLinkage} package, however, it is also helpful as a standalone function as it can help on identifying similar names based on a distribution of characters distance. 

Build status:
 + [![Build Status](https://travis-ci.org/danielmarcelino/SoundexBR.svg?branch=master)](https://travis-ci.org/danielmarcelino/SoundexBR)
  
##### A silly example:
```
names <- c('Ana Karolina Kuhnen', 'Ana Carolina Kuhnen', 'Ana Karolina',
'João Souza', 'João Souza', 'Dilma Vana Rousseff', 'Dilma Rousef','Aécio Neves', 'Aecio Neves')

soundexBR(names)
[1] "A-526" "A-526" "A-526" "J-220" "J-220" "D-451" "D-456" "A-251" "A-251"
```
##### Example with RecordLinkage:
##### Some data:
data1 <- data.frame(list(
fname=c('Ricardo','Maria','Tereza','Pedro','José','Germano'),
lname=c('Cunha','Andrade','Silva','Soares','Silva','Lima'),
age=c(67,89,78,65,68,67),
birth=c(1945,1923,1934,1947,1944,1945),
date=c(20120907,20120703,20120301,20120805,20121004,20121209)
))

data2<-data.frame( list( fname=c('Maria','Lúcia','Paulo','Marcos','Ricardo','Germânio'),
lname=c('Andrada','Silva','Soares','Pereira','Cunha','Lima'),
age=c(67,88,78,60,67,80),
birth=c(1945,1924,1934,1952,1945,1932),
date=c(20121208,20121103,20120302,20120105,20120907,20121209)
))


##### Must call RecordLinkage package

```
> pairs<-compare.linkage(data1, data2,
 blockfld=list(c(1,2,4),c(1,2)),
 phonetic<-c(1,2), phonfun = soundexBR, strcmp = FALSE,
 strcmpfun<-jarowinkler, exclude=FALSE,identity1 = NA,
 identity2=NA, n_match <- NA, n_non_match = NA)
       
> print(pairs)
$data1
    fname   lname age birth     date
1 Ricardo   Cunha  67  1945 20120907
2   Maria Andrade  89  1923 20120703
3  Tereza   Silva  78  1934 20120301
4   Pedro  Soares  65  1947 20120805
5    José   Silva  68  1944 20121004
6 Germano    Lima  67  1945 20121209

$data2
     fname   lname age birth     date
1    Maria Andrada  67  1945 20121208
2    Lúcia   Silva  88  1924 20121103
3    Paulo  Soares  78  1934 20120302
4   Marcos Pereira  60  1952 20120105
5  Ricardo   Cunha  67  1945 20120907
6 Germânio    Lima  80  1932 20121209

$pairs
  id1 id2 fname lname age birth date is_match
1   1   5     1     1   1     1    1       NA
2   6   6     0     1   0     0    1       NA
3   2   1     1     0   0     0    0       NA

$frequencies
    fname     lname       age     birth      date 
0.1000000 0.1428571 0.1250000 0.1250000 0.1000000 

$type
[1] "linkage"

attr(,"class")
[1] "RecLinkData"

```
###### To edit correspondences 
```

> editMatch(pairs)
```
###### To access information in the object:  
```
> weights <- epiWeights(pairs, e = 0.01, f = pairs$frequencies)
> hist(weights$Wdata, plot = FALSE) # Plot TRUE
$breaks
[1] 0.2 0.4 0.6 0.8 1.0

$counts
[1] 2 0 0 1

$density
[1] 3.333333 0.000000 0.000000 1.666667

$mids
[1] 0.3 0.5 0.7 0.9

$xname
[1] "weights$Wdata"

$equidist
[1] TRUE

attr(,"class")
[1] "histogram"
> getPairs(pairs, max.weight = Inf, min.weight = -Inf)
  id    fname   lname age birth     date Weight
1  1  Ricardo   Cunha  67  1945 20120907       
2  5  Ricardo   Cunha  67  1945 20120907   <NA>
3                                              
4  6  Germano    Lima  67  1945 20121209       
5  6 Germânio    Lima  80  1932 20121209   <NA>
6                                              
7  2    Maria Andrade  89  1923 20120703       
8  1    Maria Andrada  67  1945 20121208   <NA>
```