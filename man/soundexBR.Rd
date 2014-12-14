\encoding{UTF-8}
\name{soundexBR}
\alias{soundexBR}
\title{ Phonetic Algorithm Coding For Brazilian Portuguese
}
\description{SoundexBR returns a census-like phonetic code of a string name given the Portuguese sound system. This function was outlined to work with the \code{RecordLinkage} package, however, it is also helpful as a standalone function as it can help on identifying similar names based on a distribution of characters distance. See details bellow.
}
\usage{
soundexBR(term, useBytes = FALSE)
}
\arguments{
  \item{term}{a list, a vector or a data frame with strings.
}
  \item{useBytes}{ if \code{useBytes=TRUE} performs byte-wise comparison. The default is \code{FALSE}, which takes longer, but it may avoids different results depending on character encoding.
}
}
\details{This function assign a \sQuote{soundex} code for strings based on their sounds, instead of their spelling. For instance, names that sound alike, but spelled differently, like \dQuote{SOUZA} and \dQuote{SOUSA}, is assigned an identically code string. Therefore, this function may help on with finding names even when they were registered with minor misspellings. This coding algorithm 
is only meaningful for characters in the ranges a-z and A-Z. The coding of strings 
containing non-printable ascii or other unknown characters that are system-dependent should
not be trusted; therefore a warning message may be printed. Finally, the code consists of 4 digits: a letter and three numbers as \dQuote{0-000} <capital letter><digit><digit><digit>, the integers refers to the remaining letters.
}
\value{A character vector or matrix with the same dimensions as \code{term}.
}
\references{
Borg, Andreas and Murat Sariyar. (2012) \emph{RecordLinkage: Record Linkage in R,} R package version 0.4-1,  \url{http://CRAN.R-project.org/package=RecordLinkage}.

Camargo Jr. and Coeli CM. (2000) Reclink: aplicativo para o relacionamento de bases de dados, implementando o método probabilistic record linkage. \emph{Cad. Saúde Pública}, \bold{16(2)}, Rio de Janeiro.

Marcelino, Daniel (2013) \emph{SciencesPo: A Tool Set for Analyzing Political Behaviour Data}, \url{(http://dx.doi.org/10.2139/ssrn.2320547}.

Paula, Fátima de Lima (2014) \emph{Readmissão Hospitalar de Idosos após Internação por Fratura Proximal do Fêmur no Município do Rio de Janeiro}, Doctoral thesis, Fiocruz.

}

\author{Daniel Marcelino <dmarcelino@live.com>
}
\note{This function was adapted from the US census soundex version. 
See in \url{http://archives.gov/research/census/soundex.html}

The genealogist Dick Eastman maintains a soundex calculator in his website at \url{http://eogn.com/soundex/}.

}

\examples{

#### A silly example:
names <- c('Ana Karolina Kuhnen',
'Ana Carolina Kuhnen', 'Ana Karolina',
'Dilma Vana Rousseff', 'Dilma Rousef','Aécio Neves')
  
soundexBR(names)

# Example with RecordLinkage:
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

# Must call RecordLinkage package

\dontrun{pairs<-compare.linkage(data1, data2,
blockfld=list(c(1,2,4),c(1,2)),
phonetic<-c(1,2), phonfun = soundexBR, strcmp = FALSE,
strcmpfun<-jarowinkler, exclude=FALSE,identity1 = NA,
identity2=NA, n_match <- NA, n_non_match = NA)
      
print(pairs)

editMatch(pairs)

# To access information in the object:  
weights <- epiWeights(pairs, e = 0.01, f = pairs$frequencies)
hist(weights$Wdata, plot = FALSE) # Plot TRUE
getPairs(pairs, max.weight = Inf, min.weight = -Inf)
	}
}

\keyword{Soundex}
