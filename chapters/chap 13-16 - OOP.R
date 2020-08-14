if(!"sloop" %in% installed.packages()) {
  install.packages("sloop")
  library(sloop)
} else {
  library(sloop)
}

# 13 S3 -----

# * 13.2 Basics -----

f <- factor(c("a", "b", "c"))
typeof(f)
attributes(f)
unclass(f)

ftype(print)
ftype(str)
ftype(unclass)

s3_dispatch(print(f))

ftype(t.data.frame)

s3_get_method(t.data.frame)

# * 13.3 Classes -----

x <- structure(list(), class = "my_class")

inherits(x, what = "my_class")

?ISOdate


s3_methods_generic("mean")


class(ordered("f"))

# * 13.6.1 NexMethod -----

new_secret <- function(x = double()) {
  stopifnot(is.double(x))
  structure(x, class = "secret")
}
print.secret <- function(x, ...) {
  print(strrep("x", nchar(x)))
  invisible(x)
}
x <- new_secret(c(15, 1, 123))
x

x[[1]]

s3_dispatch(x[[1]])

`[[.secret` <- function(x, i) {
  new_secret(NextMethod())
}

s3_dispatch(x[[1]])

x[[1]]

# 15. S4 -----

# * 15.3 Classes -----

setClass("Person", 
         slots = c(
           name = "character",
           age = "numeric"
           ), 
         prototype = list(
           name = NA_character_, 
           age = NA_real_
           )
         )

augusto <- new("Person", name = "Augusto Hassel", age = NA_real_)

is(augusto)
augusto@name
augusto@age

setGeneric("age", def = function(x) standardGeneric("age"))
setGeneric("age<-", def = function(x, value) standardGeneric("age<-"))

setMethod("age", signature = "Person", definition = function(x) x@age)
setMethod("age<-", signature = "Person", definition = function(x, value) {
  x@age <- value
  x
  })
age(augusto)
age(augusto) <- 31

sloop::otype(augusto)
sloop::ftype(age)


# * 15.3 Inheritance -----

setClass("Employee", contains = "Person", slots = c(boss = "Person"), prototype = list(boss = new("Person")))

griselda <- new("Employee", new("Person", name = "Griselda Calgaro", age = 27), boss = augusto)

is(griselda, "Person")
is(griselda, "Employee")
is(augusto, "Employee")

# * 15.4.3 Show method -----

setMethod("show", "Person", function(object) {
  cat(is(object)[[1]], "\n",
      " Nombre: ", object@name, "\n",
      " Edad: ", object@age, "\n", sep = "")
})

setMethod("show", "Employee", function(object) {
  cat(is(object)[[1]], "\n",
      " Nombre Empleado: ", object@name, "\n",
      " Edad: ", object@age, "\n", sep = "")
})
griselda
augusto











































