## ---- include = FALSE----------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  fig.path = "man/figures/README-",
  out.width = "100%"
)

library(inops)

## ------------------------------------------------------------------------
letters <- letters[1:10]
letters

# sets

letters %in{}% c("a", "b", "c", "e")

letters %out{}% c("a", "b", "c", "e")

## ------------------------------------------------------------------------
1:10

# closed interval

1:10 %in()% c(3,6)

1:10 %out()% c(3,6)

# open interval

1:10 %in[]% c(3,6)

1:10 %out[]% c(3,6)

# open on the right

1:10 %in(]% c(3,6)

1:10 %out(]% c(3,6)

# open on the left

1:10 %in[)% c(3,6)

1:10 %out[)% c(3,6)

## ------------------------------------------------------------------------
month.name

# regular expressions

month.name %in~% "^M.*"

month.name %out~% "^M.*"

# fixed string regular expressions

month.name %in~f% "^M.*"

month.name %out~f% "^M.*"

# perl regular expressions

month.name %in~p% "^(?=.*r)(?!.*er)"

month.name %out~p% "^(?=.*r)(?!.*er)"


## ------------------------------------------------------------------------
values <- c("a", "a", "b", "b", "b", "c")
values

# number of occurances

values %in#% 1:2

values %out#% 1:2


## ------------------------------------------------------------------------
month.name

month.name %in~% c("^A", "^M")

## ------------------------------------------------------------------------
month.name

month.name %[in~% c("^A", "^M")

## ------------------------------------------------------------------------
month.name

month.name %in~% c("^A", "^M") <- "A or M"

month.name

## ------------------------------------------------------------------------
df1 <- data.frame(a = 1:3, b = 2:4, c=letters[1:3])

df1 == 2

df1 %in% 2

df1 %in{}% 2

df1 %in{}% 2:3

## ------------------------------------------------------------------------
NA == 1

NA %in% 1

NA %in{}% 1

NA %in% NA

NA %in{}% NA

c(1, NA, 3) %in{}% 1:10

## ---- message=FALSE------------------------------------------------------
library(nycflights13)
library(dplyr)
library(inops)

flights <- select(flights, origin, dest, tailnum, dep_time, arr_time, distance)
flights

filter(flights,
       dep_time %in()%  c(1200, 1700),
       arr_time %in()%  c(1200, 1700),
       dest     %out%   c("LEX", "PSP", "HDN"),
       distance %out[]% c(100, 3000),
       tailnum  %in~%   c("^N1", "^N3")
       )

## ---- message=FALSE------------------------------------------------------
library(nycflights13)
library(inops)

table(planes$manufacturer %[in~% c("AIRBUS", "CANADAIR", "MCDONNELL"))

planes$manufacturer %in~% "AIRBUS"    <- "AIRBUS"
planes$manufacturer %in~% "CANADAIR"  <- "CANADAIR"
planes$manufacturer %in~% "MCDONNELL" <- "MCDONNELL"

table(planes$manufacturer %[in~% c("AIRBUS", "CANADAIR", "MCDONNELL"))


## ---- message=FALSE------------------------------------------------------
library(nycflights13)
library(inops)

table(planes$engine)

planes$engine %in#% 1:5 <- "Other"

table(planes$engine)


