\name{SoundexBR-package}
\alias{soundexBR}
\docType{package}
\title{  Phonetic Algorithm Coding For Brazilian Portuguese. 
}
\description{
SoundexBR returns a census-like phonetic code of a string name given the Portuguese sound system. This function was outlined to work with the \code{RecordLinkage} package, however, it is also helpful as a standalone function as it can help on indentyfing similar names based on a distribution of characteres distance.  See details bellow.
}
\details{
\tabular{ll}{
Package: \tab SoundexBR\cr
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

\keyword{Soundex}
\examples{
#### A silly example:
names <- c('Ana Karolina Kuhnen',
'Ana Carolina Kuhnen', 'Ana Karolina',
'Dilma Vana Rousseff', 'Dilma Rousef','Aécio Neves' NA)
  
soundexBR(names)
}