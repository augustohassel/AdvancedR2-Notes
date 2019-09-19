# functions can be broken into: arguments, body and envirnorment.
# functions are objets, just as vectors are objetcts.

f01 <- function(x, y) {
  # a comment
  x + y
}
formals(f01)
body(f01)
environment(f01)

attr(x = f01, which = "srcref")

# 6.2.2 Primitive functions -----
sum
`[`
typeof(f01)
typeof(sum)

# 6.2.3 First class functions -----
funs <- list(
  half = function(x) x / 2,
  double = function(x) x * 2
)
funs$double(4)

# 6.2.4 Invoking a function -----
args <- list(1:10, na.rm = TRUE)
do.call(what = mean, args = args)

# 6.2.5 Excercises -----

objs <- mget(ls(name = "package:base", all = T), inherits = T)
funs <- Filter(is.function, objs)

# which base funciont has the most arguments?
formals_size <- function(x) {
  length(formals(x))
}
which.max(lapply(funs, formals_size))
formals_size(funs[[1030]])

# how many base functions have not arguments
sum(lapply(funs, formals_size) == 0)
funs[lapply(funs, formals_size) == 0]

# 6.4 Lexical scoping -----
# the act of finding the value associated with a name

# 6.4.1 Name Masking -----
x <- 1; y <- 2
g_0 <- function() {
  x <- 10; y <- 20;
  c(x, y)
}
g_0()

g_1 <- function() {
  x <- 10
  c(x, y)
}
g_1()

# 6.4.2 Functions versus variables -----
g_2 <- function(x) x + 1
g_3 <- function() {
  g_2 <- function(x) x + 100
  g_2(10)
}
g_3()

# 6.4.3 A fresh start -----
g_4 <- function() {
  if (!exists("a")) {
    a <- 1
  } else {
    a <- a + 1
  }
  a
}
g_4() # each time a function is called a new environment is created to host its execution

# 6.4.4 Dynamic lookup -----
codetools::findGlobals(g_4)

# 6.4.5 Excercisess -----
c <- 10
c(c = c)

# 6.5 Lazy evaluation -----

y <- 10 
h_2 <- function(x) {
  y <- 100
  x + 1
}
h_2(y <- 1000) # assigment inside a call to a function > the variable is bound outside of it, not inside
y

double <- function(x) {
  message("Calculando...")
  x * 2
}
h_3 <- function(x) {
  c(x, x)
}
h_3(double(2))

# 6.5.3 Missing arguments -----

h_4 <- function(x = 10) {
  list(missing(x), x)
}
str(h_4())
str(h_4(1))

args(sample)

`%||%` <- function(lhs, rhs) {
  if (!is.null(lhs)) {
    lhs
  } else {
    rhs
  }
}

`%123%` <- function(a, b) {
  a + b
}
1 %123% 2
`%123%`(1,2)

args(library)






