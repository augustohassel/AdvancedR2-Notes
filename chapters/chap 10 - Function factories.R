library(rlang)
library(ggplot2)
library(scales)

# 10.2.4. Stateful functions -----

new_counter <- function() {
  i <- 0
  
  function() {
    i <<- i + 1
    i
  }
}

count_1 <- new_counter()
count_2 <- new_counter()

count_1()
count_2()

lobstr::obj_size(count_1)


# 10.3.1. Labelling -----

y <- c(213124, 124123, 12312.2123)
comma_format(big.mark = ".", decimal.mark = ",", accuracy = 0.01)(y)

number_format(scale = 1e-3, suffix = " K")(y)

# 10.3.2. Histogram bins -----

sd <- c(1, 5, 15)
n <- 100

df <- data.frame(x = rnorm(3 * n, sd = sd), sd = rep(sd, n))

ggplot(data = df, aes(x)) +
  geom_histogram(binwidth = 2) +
  facet_wrap( ~ sd, scales = "free_x") +
  labs(NULL)

bindwith_bins <- function(n) {
  force(n)
  
  function(x) {
    (max(x) - min(x)) / n
  }
}

ggplot(data = df, aes(x)) +
  geom_histogram(binwidth = bindwith_bins(15)) +
  facet_wrap( ~ sd, scales = "free_x") +
  labs(NULL)

bindwith_bins(10)(c(1:10))

# 10.4.1. Box-Cox transformation -----

boxcox_ff <- function(lambda) {
  if (lambda == 0) {
    function(x) log(x)
  } else {
    function(x) (x ^ lambda -1) / lambda
  }
}

stat_boxcox <- function(lambda) {
  stat_function(aes(colour = lambda), fun = boxcox_ff(lambda))
}

ggplot(data.frame(x = c(0, 5)), aes(x)) +
  purrr::map(c(0.5, 1, 1.5), stat_boxcox) +
  scale_color_viridis_c(limits = c(0, 1.5))

ggplot(data.frame(x = c(0, 5)), aes(x)) +
  purrr::map(c(0.5, 1, 1.5), stat_boxcox) +
  scale_color_viridis_c(limits = c(0, 1.5))

plot(seq(0, 50, length.out = 50), log(seq(0, 50, length.out = 50)), type = "l")












