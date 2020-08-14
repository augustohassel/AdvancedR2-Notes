library(magrittr)
library(purrr)

# 11.3 Creation your own function operators -----

delay_by <- function(f, amount) {
  force(f)
  force(amount)
  
  function(...) {
    Sys.sleep(amount)
    f(...)
  }
}

dot_every <- function(f, n) {
  force(f)
  force(n)
  
  i <- 0
  function(...) {
    i <<- i + 1
    if (i %% n == 0) cat(".")
    f(...)
  }
}


walk(1:100, runif %>% dot_every(5) %>% delay_by(0.1))
