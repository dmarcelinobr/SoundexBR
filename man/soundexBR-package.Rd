\encoding{UTF-8}
\name{SoundexBR-package}
\alias{SoundexBR}
\docType{package}
\title{ Phonetic-Coding For Portuguese
}
\description{
This package provides an algorithm for decoding names into phonetic codes, as pronounced in Portuguese. The goal is for homophones to be encoded to the same representation so that they can be matched despite minor differences in spelling. The algorithm mainly encodes consonants; a vowel will not be encoded unless it is the first letter. The soundex code resultant consists of a four digits long string composed by one letter followed by three numerical digits: the letter is the first letter of the name, and the digits encode the remaining consonants. Similar consonants are assigned to the same value, for instance, \samp{D}, \samp{T} are each encoded as the number \samp{3}. Therefore, it can be used for indexing names by their sound proximity compared to alphabetical order.
}
\details{
\tabular{ll}{
Package: \tab SoundexBR\cr
Type: \tab Package\cr
Version: \tab 1.1\cr
Date: \tab 2015-01-20\cr
License: \tab AGPL-3\cr}
}
\author{Daniel Marcelino \email{dmarcelino@live.com}
}
