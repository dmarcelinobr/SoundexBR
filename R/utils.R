
RECYCLEWARNING <- NULL
.onLoad <- function(libname, pkgname){
  RECYCLEWARNING <<- gettext(tryCatch( (1:2)+(1:3),warning=function(w) w$message ))
}



.onAttach <- function(libname, pkgname) {
  	pkgEnv = pos.to.env(match('package:SciencesPo', search()))	
}

ascii.table <- function(x){
  # To portably detect ASCII characters, we need to specify them literally. Hence this monster of a character class. See ?regexp.

  # notes:
  # - caret (^) at the beginning negates what comes after, the caret in the middle is the actual character.
  # - the closing square bracket ] needs to be specified first
  # - double quote " and backslash are escaped
  # - the dash "-" is specified at the end since it would indicate a range otherwise
  # - see ? regexp.
  charclass <- paste0("[^]"
                      , "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"
                      , "0123456789"
                      , " !\"#$%&'()*+,./:;<=>?@[\\^_`{|}~-"
                      , "]"
  )
  !grepl(charclass,x)
}