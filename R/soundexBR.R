#' @useDynLib SoundexBR
#' @import parallel
#' @export
soundexBR <- function(term, BR=TRUE, useBytes = FALSE) {
  x <- as.character(term)
  x <- accent(x)
  if(BR){
    x<- ptSound(x)
  }else{
    x
  }
  stopifnot(is.logical(useBytes))
  if (!useBytes){ x <- char2int(x)
    r <- .Call("R_soundexBR", x)
    if (!useBytes) int2char(r) else r
  }
}

#' @export
int2char <- function(x) {
  enc2native(sapply(x, intToUtf8)) # declares its output as UTF-8
}

#' @export
char2int <- function(x){
  lapply(enc2utf8(x),utf8ToInt) # declares its output as
}
NULL


#' @encoding UTF-8
#' @title Adjusts for common mispelled words
#' @description This is a helper function for soundexBR and not intended to standalone.
#' @param x a vector of words.
#' @export
ptSound <- function(x){
N<-nchar(x);
x<-ifelse(substr(x,1,2)=="WA",sub("W","V",x),x);
x<-ifelse(substr(x,1,2)=="Wa",sub("W","V",x),x);
x<-ifelse(substr(x,1,2)=="wa",sub("W","V",x),x);
x<-ifelse(substr(x,1,1)=="H",substr(x,2,N),x);
x<-ifelse(substr(x,1,1)=="h",substr(x,2,N),x);
x<-ifelse(substr(x,1,2)=="KA", sub("K","C",x),x);
x<-ifelse(substr(x,1,2)=="Ka", sub("K","C",x),x);
x<-ifelse(substr(x,1,2)=="ka", sub("K","C",x),x);
x<-ifelse(substr(x,1,2)=="KO", sub("K","C",x),x);
x<-ifelse(substr(x,1,2)=="Ko", sub("K","C",x),x);
x<-ifelse(substr(x,1,2)=="ko", sub("K","C",x),x);
x<-ifelse(substr(x,1,2)=="KU",sub("K","C",x),x);
x<-ifelse(substr(x,1,2)=="Ku",sub("K","C",x),x);
x<-ifelse(substr(x,1,2)=="ku",sub("K","C",x),x);
x<-ifelse(substr(x,1,1)=="Y",sub("Y","I",x),x);
x<-ifelse(substr(x,1,1)=="y",sub("Y","I",x),x);
x<-ifelse(substr(x,1,2)=="CE",sub("C","S",x),x);
x<-ifelse(substr(x,1,2)=="Ce",sub("C","S",x),x);
x<-ifelse(substr(x,1,2)=="ce",sub("C","S",x),x);
x<-ifelse(substr(x,1,2)=="CI",sub("C","S",x),x);
x<-ifelse(substr(x,1,2)=="Ci",sub("C","S",x),x);
x<-ifelse(substr(x,1,2)=="ci",sub("C","S",x),x);
x<-ifelse(substr(x,1,2)=="GE",sub("G","J",x),x);
x<-ifelse(substr(x,1,2)=="Ge",sub("G","J",x),x);
x<-ifelse(substr(x,1,2)=="ge",sub("G","J",x),x);
x<-ifelse(substr(x,1,2)=="GI",sub("G","J",x),x);
x<-ifelse(substr(x,1,2)=="Gi",sub("G","J",x),x);
x<-ifelse(substr(x,1,2)=="gi",sub("G","J",x),x);
}
NULL