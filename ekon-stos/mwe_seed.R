## ----setup, include=FALSE----------------------------------------------------------------------------
knitr::opts_chunk$set(echo = TRUE)


## ----------------------------------------------------------------------------------------------------
#install.packages("matchingMarkets")
library(matchingMarkets)
rm(list=ls())


## ----------------------------------------------------------------------------------------------------
set.seed(20)
boston <- iaa(nStudents=4, nSlots=c(1,1,1))
print(boston$s.prefs)

