# Matching markets
# Joanna Franaszek, Ekonomia stosowana, kwiecieñ 2020
# suggested R version: 3.6.0 and up.


# libraries
#install.packages("matchingMarkets")
library(matchingMarkets)

#-----------------------------
# Introduction
#------------------------------
# We will use matchingMarkets package
# https://cran.r-project.org/web/packages/matchingMarkets/matchingMarkets.pdf


#----------------------------
# Comparison: Boston vs. DA
#----------------------------

## Boston mechanism for 100 students, 3 universities 30 places each
set.seed(20)
boston <- iaa(nStudents=100, nSlots=c(30,30,30))


## student-propose Gale-Shapley algorithm
set.seed(100)
deferredAcceptance <- iaa(nStudents=100, nSlots=c(30,30,30), acceptance="deferred")

#----------------------------
# Given preferences
#-----------------------------

s.prefs <- matrix(c(1,2, 1,2, 1,2, 1,2, 1,2, 1,2, 1,2), 2,7)
c.prefs <- matrix(c(1,2,3,4,5,6,7, 1,2,3,4,5,6,7), 7,2)
iaa(s.prefs=s.prefs, c.prefs=c.prefs, nSlots=c(3,3))


