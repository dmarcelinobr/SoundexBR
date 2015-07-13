# SoundexBR  
[![CRAN Version](http://www.r-pkg.org/badges/version/SoundexBR)](http://cran.r-project.org/package=SoundexBR)
[![Build Status](https://travis-ci.org/danielmarcelino/SoundexBR.svg?branch=master)](https://travis-ci.org/danielmarcelino/SoundexBR)   [![License](http://img.shields.io/badge/license-GPL%20%28%3E=%202%29-brightgreen.svg?style=flat)](http://www.gnu.org/licenses/gpl-2.0.html) ![](http://cranlogs.r-pkg.org/badges/grand-total/SoundexBR) 


### Phonetic-Coding For Portuguese

The SoundexBR package provides an algorithm for decoding names into phonetic codes, as pronounced in Portuguese. The goal is for homophones to be encoded to the same representation so that they can be matched despite minor differences in spelling. The algorithm mainly encodes consonants; a vowel will not be encoded unless it is the first letter. The soundex code resultant consists of a four digits long string composed by one letter followed by three numerical digits: the letter is the first letter of the name, and the digits encode the remaining consonants.
This R function may be useful for identifying "close" matches which typically fail due to variant spellings of names. For instance, both "Clair" and "Claire" return the same string "C460", but the slightly different spellings of these names is enough to cause a deterministic linkage to fail when comparing the actual names.

The _ SoundexBR_  package lives on the R Foundation repository [(CRAN)](http://cran.r-project.org/web/packages/SoundexBR/index.html) and is also hosted on [Github](http://github.com/danielmarcelino/SoundexBR). To install it, you can use the following methods.

1 - From the CRAN repository:

  ```
  install.packages('SoundexBR',repos='http://cran.r-project.org')
  require(SoundexBR)
  ```

2 -  You can always download the latest development version using the nifty function from devtools package.


  ```
  require(devtools)
  install_github("danielmarcelino/SoundexBR")
  ```
  
3 - Or download the [sources in a zip](https://github.com/danielmarcelino/SoundexBR/zipball/master) file and build manually. To do so, please unzip the file to an empty dir and run the following commands there:


```
R CMD build SoundexBR
R CMD INSTALL SoundexBR_*.tar.gz
```

If you're running R on Windows, you need to install [Rtools](http://cran.stat.ucla.edu/bin/windows/Rtools/ ). Once you have installed `Rtools`, issue following command in command prompt:

```
R CMD build --binary <path to .tar.gz file>
R CMD INSTALL <path to .zip file>
```
## Usage

#### A silly example:
```
names <- c('Ana Karolina Kuhnen', 'Ana Carolina Kuhnen', 'Ana Karolina',
'João Souza', 'João Souza', 'Dilma Vana Rousseff', 'Dilma Rousef','Aécio Neves', 'Aecio Neves')
	
soundexBR(names)
[1] "A526" "A526" "A526" "J220" "J220" "D451" "D456" "A251" "A251"
```

```
names2 <- c("HILBERT", "Heilbronn", "Gauss", "Kant")
 
 **Original Soundex:** 
 
 soundexBR(names2, BR=FALSE) 
[1] "H416" "H416" "G200" "K530"
 
 **SoundexBR:**

soundexBR(names2)
[1] "I416" "E416" "G200" "C530"

```
#### Example with RecordLinkage:
#### Some data:
``` 
data1 <- data.frame(list(
first_name=c('Ricardo','Maria','Tereza','Pedro','José','Germano'),
last_name=c('Cunha','Andrade','Silva','Soares','Silva','Lima'),
age=c(67,89,78,65,68,67),
birth=c(1945,1923,1934,1947,1944,1945),
date=c(20120907,20120703,20120301,20120805,20121004,20121209)
))
```

```
data2<-data.frame( list( first_name=c('Maria','Lúcia','Paulo','Marcos','Ricardo','Germânio'),
last_name=c('Andrada','Silva','Soares','Pereira','Cunha','Lima'),
age=c(67,88,78,60,67,80),
birth=c(1945,1924,1934,1952,1945,1932),
date=c(20121208,20121103,20120302,20120105,20120907,20121209)
))
```

#### Must call RecordLinkage package

```
> pairs<-compare.linkage(data1, data2,
 blockfld=list(c(1,2,4),c(1,2)),
 phonetic<-c(1,2), phonfun = soundexBR, strcmp = FALSE,
 strcmpfun<-jarowinkler, exclude=FALSE,identity1 = NA,
 identity2=NA, n_match <- NA, n_non_match = NA)
 ```

```       
> print(pairs)
$data1
    first_name   last_name age birth     date
1 Ricardo   Cunha  67  1945 20120907
2   Maria Andrade  89  1923 20120703
3  Tereza   Silva  78  1934 20120301
4   Pedro  Soares  65  1947 20120805
5    José   Silva  68  1944 20121004
6 Germano    Lima  67  1945 20121209

$data2
     first_name   last_name age birth     date
1    Maria Andrada  67  1945 20121208
2    Lúcia   Silva  88  1924 20121103
3    Paulo  Soares  78  1934 20120302
4   Marcos Pereira  60  1952 20120105
5  Ricardo   Cunha  67  1945 20120907
6 Germânio    Lima  80  1932 20121209

$pairs
  id1 id2 first_name last_name age birth date is_match
1   1   5     1     1   1     1    1       NA
2   6   6     0     1   0     0    1       NA
3   2   1     1     0   0     0    0       NA

$frequencies
    first_name     last_name       age     birth      date 
0.1000000 0.1428571 0.1250000 0.1250000 0.1000000 

$type
[1] "linkage"

attr(,"class")
[1] "RecLinkData"
```
#### Editing  correspondences 
```
> editMatch(pairs)
```
#### Accessing information within the object:  
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
  id    first_name last_name age birth     date Weight
1  1  Ricardo   Cunha  67  1945 20120907       
2  5  Ricardo   Cunha  67  1945 20120907   <NA>
3                                              
4  6  Germano    Lima  67  1945 20121209       
5  6 Germânio    Lima  80  1932 20121209   <NA>
6                                              
7  2    Maria Andrade  89  1923 20120703       
8  1    Maria Andrada  67  1945 20121208   <NA>
```



#### The Algorithm in a Nutshell

Capitalize all letters in the word and drop all punctuation marks. Pad the word with rightmost blanks as needed during each procedure step.
Retain the first letter of the word. However, if the first letter of the word is 
**H**, retain the second letter. If the first letter of the word is 
**Y**, change to **I**. If the combination of the first and the second letters is: 
**WA**, change to **VA**. If the combination of the first and the second letters is: 
**KA**, change to **CA**. If the combination of the first and the second letters is: 
**KO**, change to **CO**. If the combination of the first and the second letters is: 
**KU**, change to **CU**. If the combination of the first and the second letters is: 
**CI**, change to **SI**. If the combination of the first and the second letters is: 
**CE**, change to **SE**. If the combination of the first and the second letters is: 
**GE**, change to **JE**. If the combination of the first and the second letters is: 
**GI**, change to **JI**.

Change all occurrence of the following letters to '0' (zero):

```A, E, I, O, U, H, W, Y.```

Change letters from the following sets into the digit given:

```1 = B, F, P, V```

```2 = C, G, J, K, Q, S, X, Z```

```3 = D,T```

```4 = L```

```5 = M,N```

```6 = R ```

Remove all pairs of digits which occur beside each other from the string that resulted after step (4).
Remove all zeros from the string that results from step 5.0 (placed there in step 3)
Pad the string that resulted from step (6) with trailing zeros and return only the first four positions, which will be of the form <Letter> <digit> <digit> <digit>.
