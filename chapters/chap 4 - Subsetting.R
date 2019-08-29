# 4.3.3 Missing and out-of-bounds indices -----
?purrr::pluck()
x <- list(a = list(1,2,3), b = list(c = list(1)))
purrr::pluck(x, "b", "c", 2, .default = 0)
purrr::pluck(x, "b", "c", 1, .default = 0)

# 4.5 Applications -----
# 4.5.1 Character subsetting -----
x <- c("m", "u", "f", "m", "m")
lookup <- c(m = "Male", f = "Female", u =NA)
unname(lookup[x])

# 4.5.2 Integer subsetting -----
grades <- c(1, 2, 3, 3, 1)

info <- data.frame(
  grade = 3:1,
  desc = c("Excellent", "Goog", "Poor"),
  fail = c(F, F, T)
)
info[match(x = grades, info$grade), ] # like left_join

# bootsrap
info[sample(nrow(info), size = 6, replace = T), ]

info[setdiff(names(info), "grade")]

# 4.5.7 Logical subsetting -----
mtcars[mtcars$gear == 5 & mtcars$cyl == 8, ]

# 4.5.8 Locigal and integer subsetting -----
x <- sample(10) < 4
which(x)

unwich <- function(x, n) {
  out <- rep_len(FALSE, n)
  out[x] <- TRUE
  out
}
unwich(which(x), 10)
