
RECYCLEWARNING <- NULL
.onLoad <- function(libname, pkgname){
  RECYCLEWARNING <<- gettext(tryCatch( (1:2)+(1:3),warning=function(w) w$message ))
}

.onAttach <- function(libname, pkgname) {
  	pkgEnv = pos.to.env(match('package:SoundexBR', search()))	
}

ascii.table <- function(x){
  charclass <- paste0("[^]"
                      , "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"
                      , "0123456789"
                      , " !\"#$%&'()*+,./:;<=>?@[\\^_`{|}~-"
                      , "]"
  )
  !grepl(charclass,x)
}