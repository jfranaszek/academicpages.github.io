##################################################
#																                 #
# Ekonomia stosowana													   #
#																                 #
# Krótki wstêp do programu R									   #
# -----------------------------------------------
# Materia³y do R:															   #
#																                 #
#	-strona projektu:												     	 #
#	http://cran.r-project.org/										 #
#	http://cran.r-project.org/doc/manuals/R-intro.html
#	- skrypt Micha³a Ramszy: 											 #
#	http://michal.ramsza.org/lectures/2_r_programming/index.html
#																                 #
##################################################



# Tworzenie nowego skryptu: Plik->Nowy skrypt lub Shift+Ctrl+N
# Otwarcie utworzonego skryptu: Plik-> Otwórz lub Ctr+O lub polecenie source, np.
source("es_matching_markets.R") # kods z poprzednich zajêæ

# Odpalanie komend ze skryptu: Ctr+R lub F5

# R mo¿e s³u¿yæ jako kalkulator.

2 + 2
sqrt(2)
round(pi, digits = 1)

# Operacja przypisania: "<-" (ta sama dla funkcji i zmiennych)
# Ewentualnie "=" lub "->" (ale to bad practice)

a <- 3
4.5 -> b # bad practice
a + b

akwadrat = a ^ 2
akwadrat + 1


# WEKTORY:

wektor_liczb <- c(1, 2, 3, 4, 5)
wektor_liczb

wektor_liczb[3]
wektor_liczb[-c(1,3)]
wektor_liczb[wektor_liczb != 4]

wektor_liczb[4] <- NA
wektor_liczb
sum(wektor_liczb)
sum(wektor_liczb, na.rm=TRUE)

wektor_znakow <- c("a", "b", "c")
wektor_znakow
wektor_znakow2 <- 'Hello, world'
wektor_znakow2

length(wektor_znakow)
length(wektor_znakow2)

wektor_logiczny <- c(TRUE, FALSE, T, F, T & F, T | F)
wektor_logiczny

mode(wektor_liczb)
mode(wektor_znakow)
mode(wektor_logiczny)

# Jak zmieniæ wektor z liczbowego na znakowy?

liczby_na_znaki <- as.character(wektor_liczb)
liczby_na_znaki

# W drug¹ stronê (oczywiœcie) trudniej. Kiepski pomys³:

znaki_na_liczby <- as.numeric(wektor_znakow)
znaki_na_liczby

# Trochê lepiej:
znaki_na_liczby <- as.numeric(factor(wektor_znakow))
znaki_na_liczby

# Co robi funkcja factor? Najlepiej zapytaæ R:

help(factor)
?factor

help.search('standard deviation')
??'standard deviation'

# Operacje na wektorach:

x <- c(3, 2, 1)
y <- c(1, -1, 0)

x * y
x %*% y
sort(y)

# Generowanie wektorów:
ciag <- 13:17
ciag
powtorki <- rep(1:4, each = 3)
powtorki
unique(powtorki)

ciag_lepszy <- seq(0.1, 1, by=0.05)
ciag_lepszy

# Jeœli pogubiliœmy siê ju¿ w naszych zmiennych, mo¿emy wypisaæ ich listê:
ls()

# A nastêpnie - w razie potrzeby - usun¹æ:
rm(a, b, wektor_znakow2, ciag_lepszy)
ls()

# MACIERZE:
macierz <- matrix(powtorki, nrow = 4, ncol = 3)
macierz

macierz_druga <- cbind(c(1, 0, 0), c(0, 0, 1), c(0, 2, 0))
macierz_druga
macierz %*% macierz_druga

# Wiersz a kolumna:
macierz[1,]
macierz[, 1]

macierz[1:2, ]
macierz[ , macierz[1, ] != 1]

# TABLICE/RAMKI DANYCH:

dziennik <-
  data.frame(
    nr = 1:5,
    nazwisko = c('Anski', 'Becki', 'Czeski', 'Demski', 'Ewski'),
    ocena = c(4, 5, 5.5, 5, 4.5)
  )
dziennik

dziennik$ocena[1] <- 4.5
dziennik

dziennik[dziennik$ocena >= 5, 2]

# Przejœcie z macierzy do tablicy:

macierz_druga
tablica <- as.data.frame(macierz_druga)
names(tablica)
names(tablica) <- c("ola", "ala", "as")
tablica
tablica$ala
tablica[tablica$ala != 1, ]
tablica[, tablica[3, ] == 0]
dim(tablica)
t(macierz_druga)

# LISTY:

lista <- list(wektor_znakow, macierz,akwadrat)
lista
length(lista)
names(lista)
names(lista) <- c("wektor", "macierz", "tablica")
names(lista)
lista[[2]]
lista[[3]][1, ] # zob. inne odwo³anie!

osoba <- list(imie = "Adam",
              nazwisko = "Absencki",
              wiek = 43)
osoba$imie
mode(osoba$wiek)

osoba[[3]]
osoba[[3]] <- 20
osoba$wiek

osoba$ma_zone <- TRUE
osoba

# Trochê statystyki

wektor <- rep(1:10)
wektor
mean(wektor)
sd(wektor)


# A mo¿e by tak coœ wylosowaæ?

wektor <- rep(1:40)
proba0 <- sample(wektor, 10)
proba0
mean(proba0)

proba1 <- rnorm(10, mean = 3, sd = 5)
proba1
mean(proba1)
sd(proba1)

proba2 <- rnorm(100, mean = 2, sd = 4)
mean(proba2)
sd(proba2)

# Zobacz tak¿e funkcje: pnorm, dnorm, qnorm.
# Analogicznie: losowanie z rozk³adu gamma: rgamma (zob. te¿ pgamma, dgamma, qgamma)
# Losowanie z rozk³adu chi-kwadrat: rchisq (pchisq, dchisq, qchisq)
# Z jednostajnego: runif (punif, dunif, qunif)
# itd.

# WYKRESY:

# Czêstoœæ:
hist(proba2, freq = FALSE,
     main = "Histogram proby2")
lines(density(proba2), col = "red")

# Liczebnoœæ:
hist(proba2, freq = TRUE)

# Zale¿noœci miêdzy zmiennymi:
x <- seq(0, 4, 0.04)
x
y <- x ^ 2 + 2 * x - 3
z <- 2 * x + 2
plot(x, y)
lines(x, z, col = "green")
plot(y, x)

# FUNKCJE:

# Sprawdzimy, czy R dobrze liczy œredni¹.

srednia <- function(probka)
{
  if (length(probka) == 0)
  {
    a <- NA
  }
  else
  {
    a <- sum(probka)
    a <- a / length(probka)
  }
  return(a)
}

srednia(proba2)
mean(proba2) == srednia(proba2)
proba0
srednia(proba0[proba0 > 40])

# Pamiêtacie zmienn¹ wektor_liczb?

wektor_liczb
srednia(wektor_liczb)
mean(wektor_liczb, na.rm = TRUE)
na.omit(wektor_liczb)


########################################################################################

# Ma³e zadanko na zachêtê:
# Stwórz hipotetyczn¹ listê koñcowych ocen z ES.
# Za³ó¿, ¿e grupa ma 20 studentów, identyfikowanych przez 5-cyfrowy numer indeksu.
# Numery indeksu s¹ losowo wybrane ze zbioru 85000-90000 i posortowane rosn¹co.
# Punktacja koñcowa studentów ma w przybli¿eniu rozk³ad normalny o œredniej 70
# i odchyleniu standardowym 15. Pamiêtaj, ¿e punkty s¹ ca³kowite!
# Przypisz odpowiednim punktom ocenê. Utwórz data.frame zawieraj¹cy indeksy, punkty,
# i oceny studentów i nadaj odpowiednie nazwy kolumnom.
# Policz œredni¹ liczbê punktów i œredni¹ ocen w grupie.


# Przyk³adowe rozwi¹zanie:

indeks <- sample(85000:90000, 20)
indeks <- sort(indeks)
indeks
punkty <- rnorm(20, mean = 70, sd = 15)
punkty <- round(punkty)
punkty[punkty > 100] <- 100
punkty[punkty < 0] <- 0
punkty
ocena <- rep(2, 20)
ocena[punkty > 50] <- 3
ocena[punkty > 59] <- 3.5
ocena[punkty > 68] <- 4
ocena[punkty > 77] <- 4.5
ocena[punkty > 85] <- 5
ocena[punkty > 93] <- 5.5
dziennik <- data.frame(indeks, punkty, ocena)
dziennik
mean(dziennik$punkty)
mean(dziennik$ocena)
