## ----setup, include=FALSE-------------------------------------------------------------------------------
knitr::opts_chunk$set(echo = TRUE, cache=TRUE)


## -------------------------------------------------------------------------------------------------------
library(matchingMarkets)
rm(list=ls())


## ----eval=FALSE-----------------------------------------------------------------------------------------
## help(hri)


## -------------------------------------------------------------------------------------------------------
daResults <- iaa(nStudents=14, nSlots=c(4,4,4), acceptance = "deferred", seed=10)
hriResults <- hri(nStudents=14, nSlots=c(4,4,4), seed=10)
print(daResults$matchings)
print(hriResults$matchings)


## -------------------------------------------------------------------------------------------------------
sPrefs <- hriResults$s.prefs.hri
cPrefs <- hriResults$c.prefs.hri
print(sPrefs[1:3,1:3])
print(cPrefs[11:14,1])
sPrefs[3,1:3] <- NA  # trzech pierwszych studentów usuwa swoją ostatnią uczelnię
cPrefs[11:14,1]<-NA  # pierwsza uczelnia usuwa 4 najmniej preferowanych studentów

hriIncomplete <- hri(s.prefs = sPrefs, c.prefs = cPrefs, nSlots = c(4,4,4))
hriMatch <- hriResults$matchings[,c("sOptimal","college","student")]
hriIncMatch <- hriIncomplete$matchings[,c("sOptimal","college","student")] 

dif <- data.frame(CP = hriMatch[order(hriMatch$sOptimal,hriMatch$student),],
                 IP = hriIncMatch[order(hriIncMatch$sOptimal,hriIncMatch$student),])
print(dif)



## -------------------------------------------------------------------------------------------------------
sPrefs <- matrix(c(4,2,3,5, 2,1,3,NA, 1,2,3,4), 4,3) # tu są 3 studenci
coPrefs <- matrix(c(rep(4,3), rep(5,3), 3,3,NA, 3,NA,3), 3,4) # a tu jest jedna para - łącznie 5 chętnych
print(sPrefs)   # preferencje singli
print(coPrefs)  # preferencje par - zob. sposósb zapisu
cPrefs <- matrix(rep(1:5,5), 5,5) # uczelnie są nudne, wszystkie chcą 1,2,3,4,5
hriWithCouples <- hri2(s.prefs = sPrefs, c.prefs = cPrefs, co.prefs = coPrefs)
print(hriWithCouples$matching)


## -------------------------------------------------------------------------------------------------------
sPrefs <- matrix(c(2,1,3,1,2,3,1,2,3),byrow = FALSE, ncol=3)
cPrefs <- matrix(c(1,3,2,2,1,3,2,1,3),byrow = FALSE, ncol=3)
topTC <- ttc2(s.prefs = sPrefs, c.prefs = cPrefs, nSlots =c(1,1,1))
colnames(topTC) <- c("student","college")
da <- hri(s.prefs = sPrefs, c.prefs = cPrefs, nSlots =c(1,1,1))
print(data.frame(da=da$matchings[,c("college","student")],topTC[,c("college","student")]))


