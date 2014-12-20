\name{int2char}
\alias{int2char}
\title{ Interger to Character
}
\description{Declares integer inputs as UTF-8 output.
}
\usage{
int2char(x)
}
\arguments{
  \item{x}{A vector consisting of whole numbers.
}
}
\author{Daniel Marcelino	
}

\seealso{\link{char2int}, \link[base]{iconv}.}
\examples{
int2char(c(84,104,105,115,32,115,104,111,117,108,100,32,98,101,
32,119,104,111,108,101,32,110,117,109,98,101,114,115))
}

\keyword{ Encoding }