library(rlang)

# 7.2.1 Basics -----

e1 <- env(
  a = FALSE,
  b = "a",
  c = 2.3,
  d = 1:3
)

env_print(e1)
env_names(e1)

identical(global_env(), current_env())

env_parent(e1)
env_parent(global_env())

env_parents(e1)
env_parents(global_env())
gcinfo(verbose = F)

# 7.4.4 Execution Environment -----
g <- function(x) {
  if (!env_has(current_env(), "a")) {
    message("Defining a")
    a <- 1
  } else {
    a <- a + 1
  }
  a
}

plus <- function(x) {
  function(y) x + y
}
plus_one <- plus(1)
plus_one(2)

# 7.5 Call stacks -----
f <- function(x) {
  g(x = 2)
}
g <- function(x) {
  h(x = 3)
}
h <- function(x) {
  lobstr::cst()
}

f() # simple call stack

a <- function(x) b(x)
b <- function(x) c(x)
c <- function(x) x

a(f()) # lazy evaluation









