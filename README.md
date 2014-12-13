SoundexBR
=========

## Phonetic Algorithm Coding For Brazilian Portuguese. 

SoundexBR returns a census-like phonetic code of a string name given the Portuguese sound system. This function was outlined to work with the \code{RecordLinkage} package, however, it is also helpful as a standalone function as it can help on indentyfing similar names based on a distribution of characteres distance. 

##### A silly example:
names <- c('Ana Karolina Kuhnen',
'Ana Carolina Kuhnen', 'Ana Karolina',
'Dilma Vana Rousseff', 'Dilma Rousef','Aécio Neves' NA)
  
soundexBR(names)

##### Accented letters may be also replaced.
accent('Não me julgues pela metade se não me conheces por inteiro')


##### Example with RecordLinkage:
#Some data:
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

\dontrun{pairs<-compare.linkage(data1, data2,
blockfld=list(c(1,2,4),c(1,2)),
phonetic<-c(1,2), phonfun = soundexBR, strcmp = FALSE,
strcmpfun<-jarowinkler, exclude=FALSE,identity1 = NA,
identity2=NA, n_match <- NA, n_non_match = NA)
      
print(pairs)

editMatch(pairs)

###### To access information in the object:  
weights <- epiWeights(pairs, e = 0.01, f = pairs$frequencies)
hist(weights$Wdata, plot = FALSE) # Plot TRUE
getPairs(pairs, max.weight = Inf, min.weight = -Inf)
	}
