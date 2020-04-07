## ----setup, include=FALSE----------------------------------------------------------------------------
knitr::opts_chunk$set(echo = TRUE, cache=TRUE)


## ----eval=FALSE--------------------------------------------------------------------------------------
## install.packages("matchingMarkets")


## ----------------------------------------------------------------------------------------------------
library(matchingMarkets)
rm(list=ls())


## ----eval=FALSE--------------------------------------------------------------------------------------
## help(iaa)


## ----eval=FALSE--------------------------------------------------------------------------------------
## iaa(
##   nStudents = ncol(s.prefs),
##   nColleges = ncol(c.prefs),
##   nSlots = rep(1, nColleges),
##   s.prefs = NULL,
##   c.prefs = NULL,
##   acceptance = "immediate",
##   short_match = TRUE,
##   seed = NULL
## )


## ----------------------------------------------------------------------------------------------------
set.seed(20)
boston <- iaa(nStudents=24, nSlots=c(6,6,6))
print(boston$s.prefs)
print(boston$c.prefs)


## ----------------------------------------------------------------------------------------------------
print(boston$matchings)


## ----------------------------------------------------------------------------------------------------
print(boston$singles)


## ----------------------------------------------------------------------------------------------------
matchBoston <- data.frame(students=boston$matchings$student,college=boston$matchings$college)
boston$s.prefs[1,matchBoston$students]==matchBoston$college


## ----------------------------------------------------------------------------------------------------
set.seed(20)
deferredAcceptance <- iaa(nStudents=24, nSlots=c(6,6,6),acceptance = "deferred")
print(deferredAcceptance$s.prefs)
print(deferredAcceptance$c.prefs)


## ----------------------------------------------------------------------------------------------------
print(deferredAcceptance$matchings)


## ----------------------------------------------------------------------------------------------------
# DA
print(deferredAcceptance$singles)
# Boston
print(boston$singles)


## ----------------------------------------------------------------------------------------------------
matchBoston <- rbind(matchBoston,
                     data.frame(students=boston$singles,
                                college=rep(0,length(boston$singles)))
                     )
matchDA <- data.frame(students = c(deferredAcceptance$matchings$student,
                                   deferredAcceptance$singles),
                      college = c(deferredAcceptance$matchings$college,
                                  rep(0,length(deferredAcceptance$singles)))
                      )

matchDif <- data.frame(student=c(1:24),
                       colBoston = matchBoston[order(matchBoston$students),2],
                       colDA = matchDA[order(matchDA$students),2],
                       isSame = (matchDA[order(matchDA$students),2]==matchBoston[order(matchBoston$students),2]) )
print(matchDif)


## ----------------------------------------------------------------------------------------------------
s.prefsNew <- boston$s.prefs
s.prefsNew[,11] <- c(3,1,2)
c.prefsNew <- boston$c.prefs
nSlotsNew <- c(6,6,6)


## ---- results="hide"---------------------------------------------------------------------------------
bostonNew <- iaa(s.prefs=s.prefsNew, c.prefs=c.prefsNew, nSlots = nSlotsNew,  acceptance="immediate")
deferredAcceptanceNew <- iaa(s.prefs=s.prefsNew, c.prefs=c.prefsNew, nSlots = nSlotsNew, acceptance="deferred")

## ----------------------------------------------------------------------------------------------------
print(data.frame(boston=bostonNew$matching,DA=deferredAcceptanceNew$matching))

