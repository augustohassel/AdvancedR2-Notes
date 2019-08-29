# 5.3.1 Common pitfalls -----
means <- c(2,2,3)
seq_along(means)

out <- vector(mode = "list", length = length(means))
for (i in seq_along(means)) {
  out[[i]] <- rnorm(10, means[[i]])
}
