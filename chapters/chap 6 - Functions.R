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
