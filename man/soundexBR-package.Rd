\name{soundexBR-package}
\alias{soundexBR-package}
\alias{soundexBR}
\docType{package}
\title{ Soundex (Phonetic) Algorithm For Brazilian Portuguese.
}
\description{
SoundexBR returns a census-like soundex code of a string name given the Portuguese sound system. This function was firstly outlined to work with \code{RecordLinkage} package, however, it is also helpful as a standalone function as similar sounding strings should get similar or equal codes. See details bellow.
}
\details{
\tabular{ll}{
Package: \tab soundexBR\cr
Type: \tab Package\cr
Version: \tab 1.0\cr
Date: \tab 2014-12-12\cr
License: \tab LGPL (>= 2.0, < 3) \cr
}
}
\author{
Daniel Marcelino <dmarcelino@live.com>
}
\references{
Borg, Andreas and Murat Sariyar. (2012) \emph{RecordLinkage: Record Linkage in R,} R package version 0.4-1,  \url{http://CRAN.R-project.org/package=RecordLinkage}.

Camargo Jr. and Coeli CM. (2000) Reclink: aplicativo para o relacionamento de bases de dados, implementando o método probabilistic record linkage. \emph{Cad. Saúde Pública}, \bold{16(2)}, Rio de Janeiro.

Marcelino, Daniel (2013) \emph{SciencesPo: A Tool Set for Analyzing Political Behaviour Data}, \url{(http://dx.doi.org/10.2139/ssrn.2320547}.

Paula, Fátima de Lima (2014) \emph{Readmissão Hospitalar de Idosos após Internação por Fratura Proximal do Fêmur no Município do Rio de Janeiro}, Doctoral thesis, Fiocruz.

}

\keyword{ package }
\keyword{soundex}
\examples{
# A silly example:
names <- c('Ana Karolina Kuhnen',
'Ana Carolina Kuhnen', 'Ana Karolina',
'Dilma Vana Rousseff', 'Dilma Rousef','Aécio Neves' NA)
  
soundexBR(names)

#It might be a good idea to look up for possible enconding inconsistencies:
ascii.table(names)

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
}
