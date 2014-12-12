soundexBR <- function(term, useBytes = FALSE) {
  x <- as.character(term)
  stopifnot(is.logical(useBytes))
  if (!useBytes){ x <- char2int(x)
    r <- .Call("R_soundexBR", x)
    if (!useBytes) int2char(r) else r
  } 
}

int2char <- function(x) {
  enc2native(sapply(x, intToUtf8)) # declares its output as UTF-8
}

char2int <- function(x){
  lapply(enc2utf8(x),utf8ToInt) # declares its output as 
}
