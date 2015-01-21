\encoding{UTF-8}
\name{ascii.table}
\alias{ascii.table}


\title{ASCII Characters Table
}
\description{ To detect ASCII characters, we may need to specify them literally. This function helps identifying what character is in ascii format and what is not.
}
\usage{
ascii.table(x)
}
\arguments{
  \item{x}{A string whose characters is to be checked against.
  }
}
\author{
Daniel Marcelino
}
\examples{
ascii.table( c("ã", "@", "_"))
}
\keyword{ Encoding }
