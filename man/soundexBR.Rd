\encoding{UTF-8}
\name{soundexBR}
\alias{soundexBR}
\title{ Phonetic-Coding For Portuguese
}
\description{The soundexBR function provides an algorithm for decoding names into phonetic codes, as pronounced in Portuguese. Soundex coding can be useful to identify \sQuote{close} matches which typically fail due to variant spellings of names. For instance, both \dQuote{Clair} and \dQuote{Claire} return the same string \dQuote{C460}, but the slightly different spellings of these names is enough to cause a deterministic linkage to fail when comparing the actual names. Soundex does not help when the variants do not sound alike, or start with different letters.
}
\usage{
soundexBR(term, BR=TRUE, useBytes = FALSE)
}
\arguments{
  \item{term}{a list, a vector or a data frame with character strings.
}
\item{BR}{if \code{BR=TRUE}, commong mispelled first letters may be replaced}.
  \item{useBytes}{ if \code{useBytes=TRUE} performs byte-wise comparison. The default is set to \code{FALSE}, which takes longer, but it may prevent different results depending on character encoding.
}
}
\details{ The soundexBR may help with identification of names even when they are spelled differently. However, the algorithm does not help when the variants do not sound alike, or start with different letters. For instance, while \dQuote{Carolina} and \dQuote{Karolina} both receive a similar code, respectively \dQuote{C645} and \dQuote{K645}, the first letter differ. 
Further, this function is only meaningful for characters in the ranges a-z and A-Z. Although, I tried to minimize character encoding issues, there are several non-printable ascii characters and system-dependent characters that may cause the function to print a warning message. 

The numerical digits of the code are based on specific consonant sounds and can be computed by using the letters's \sQuote{power}. For instance, (1) retain the first letter of the name and drop other occurrences of \verb{A, E, I, O, U, Y, H, W}. (2) replace consonants with digits as follows (after the first letter):
\preformatted{
B, F, P, V = 1
C, G, J, K, Q, S, X, Z = 2
D, T = 3
L = 4
M, N = 5
R = 6}

(3) If two or more letters with the same number are adjacent in the original name (before step 1), only retain the first letter; also two letters with the same number separated by ‘h’ or ‘w’ are coded as a single number, whereas such letters separated by a vowel are coded twice, for instance, \dQuote{Ashcraft} and \dQuote{Ashcroft} both yield \dQuote{A261} (the chars \sQuote{s} and \sQuote{c} in the name receive a single number of 2 and not 22 since an \sQuote{h} lies in between them).
(4) Iterate the previous step until you have one letter and three numbers. If you have too few letters in your word that you cannot assign three numbers, append with zeros until there are three numbers as in \dQuote{A500}. If the resultant code has more than 3 numbers, just retain the first 3 numbers.

\emph{Probabilistic Matching}: soundexBR may be used as a phonetic identifier to find results that do not match exactly the terms. Searching for names can be difficult as there are often multiple alternative spellings for names. An example is the name Claire. It has two alternatives, Clare and Clair, which are both pronounced the same. Searching for one spelling would not show results for the two others. Fortunately, soundexBR will produce the same code for all three variations, \dQuote{C460}. Therefore, searching names based on the soundex code all three variations will be matched. In the examples below, you can instances of using soundexBR together with the \pkg{RecordLinkage} package, by supplying it with a phonetic dictionary for Portuguese records.
}

\value{A character vector with same dimensions as \code{term}.
}
\references{
Borg, Andreas and Murat Sariyar. (2012) \emph{RecordLinkage: Record Linkage in R,} R package version 0.4-1,  \url{http://CRAN.R-project.org/package=RecordLinkage}.

Camargo Jr. and Coeli CM. (2000) Reclink: aplicativo para o relacionamento de bases de dados, implementando o método probabilistic record linkage. \emph{Cad. Saúde Pública}, \bold{16(2)}, Rio de Janeiro.

Eastman, Dick \emph{Soundex Calculator}, \url{http://eogn.com/soundex/}.

Marcelino, Daniel (2013) \emph{SciencesPo: A Tool Set for Analyzing Political Behaviour Data}, \url{(http://dx.doi.org/10.2139/ssrn.2320547}.

Paula, Fátima de Lima (2014) \emph{Readmissão Hospitalar de Idosos após Internação por Fratura Proximal do Fêmur no Município do Rio de Janeiro}, Doctoral thesis, Fiocruz.
}

\author{Daniel Marcelino \email{dmarcelino@live.com}
}
\note{This function was adapted from the US census soundex version. 
See in \url{http://archives.gov/research/census/soundex.html}
}

\examples{

#### A silly example:
names <- c('Ana Karolina Kuhnen', 'Ana Carolina Kuhnen', 'Ana Karolina','João Souza', 
'João Souza', 'Dilma Vana Rousseff', 'Dilma Rousef','Aécio Neves', 'Aecio Neves')

soundexBR(names)

# Example with RecordLinkage:
#Some data:
data1 <- data.frame(list(
fname=c('Ricardo','Maria','Tereza','Pedro','José','Rubens'),
lname=c('Cunha','Andrade','Silva','Soares','Silva','Lima'),
age=c(67,89,78,65,68,67),
birth=c(1945,1923,1934,1947,1944,1945),
date=c(20120907,20120703,20120301,20120805,20121004,20121209)
))

data2<-data.frame( list( fname=c('Maria','Lúcia','Paulo','Marcos','Ricardo','Rubem'),
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
