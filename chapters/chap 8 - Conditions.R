library(rlang)

rlang::abort(message = "Algo salió terriblemente mal")
rlang::warn(message = "Esto es un aviso")

# In other words, cat() is for when the user asks for something to be printed and message() is for when the developer elects to print something.


# 8.3 Ignoring Conditions -----

default <- NULL
try(default <- read.csv("sdasd"), silent = T)

# 8.4 Handling conditions -----

?tryCatch
?withCallingHandlers

# 8.4.1 Condition objects -----

cnd <- catch_cnd(stop("An error"))
str(cnd)

conditionMessage(cnd)

# 8.4.2 Exiting handlers -----

f3 <- function(x) {
  tryCatch(expr = log(x), error = function(cnd) NA)
}
f3("10")
f3(10)

tryCatch(
  {
    message("Hola"); 1+1
  },
  error = function(cnd) 10
)

tryCatch(
  {
    message("Here"); stop("This code is never run!!!")
  },
  message = function(cnd) "There"
)

tryCatch(
  stop("This is an error"),
  error = function(cnd) {
    paste0(">>> FUCK YEAH!! ", conditionMessage(cnd), " <<<")
  }
)

