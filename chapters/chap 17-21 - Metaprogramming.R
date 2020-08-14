library(rlang)
library(lobstr)

# 17.2 Code is data -----

expr(mean(x, na.rm = TRUE))

capture_it <- function(x) {
  enexpr(x) # ENrichEXPression
}

f <- expr(f(a = 1, b = 2))
f
f$c <- "b"

f[[2]] <- NULL # the first position is the funcion itself

# 17.3 Code is a tree -----

lobstr::ast(x = f(a = 1, b = 2))

lobstr::ast(1 + 5 * 5 - 2)

# 17.4 Code can generate code -----

rlang::call2("f", 1, rlang::call2("g", 2))

xx <- expr(x + x)
yy <- expr(y + y)

expr(!!xx / !!yy)

cv <- function(var) {
  var <- enexpr(var)
  expr(sd(!!var) / sd(!!var))
}
cv(x + 1)

eval(cv(c(1:6)))

# 18 Expressions ----

# 18.2.1 Drawing Abstract syntax trees ----

# AST : Abstract syntax trees

lobstr::ast(f(x, "y", 1))

lobstr::ast(f(g(1, 2), h(3, 4), i()))

lobstr::ast(y <- x * 10)

expr(`<-`(y, `*`(x, 10)))


# 18.3 Expressions --------------------------------------------------------

# Expression : constant scalars + symbols + call objects + pairlists

# 18.3.1 Constants --------------------------------------------------------

rlang::is_syntactic_literal(1)

# 18.3.2 Symbols ----------------------------------------------------------

str(expr(x))

str(sym("x"))

rlang::as_string(expr(x))

# 18.3.3 Calls ------------------------------------------------------------

x <- expr(read.csv("test.csv", row.names = FALSE))

typeof(x)
is.call(x)

x[[1]]
is.symbol(x[[1]])

as.list(x[-1])

length(x) - 1

rlang::call_standardise(x)

x$header <- TRUE

# constructing call objects

rlang::call2("mean", x = expr(x), na.rm = TRUE)
rlang::call2(expr(base::mean), x = expr(x), na.rm = TRUE)

# 18.4 Parsing and grammar ------------------------------------------------

lobstr::ast(1 + 2 * 3)
lobstr::ast(!x %in% y)
?Syntax

# 18.4.3 Parsing and deparsing --------------------------------------------

x1 <- "y <- x + 10"
is.call(x1)

x2 <- rlang::parse_expr(x1)
is.call(x2)

x3 <- "a <- 1; a + 1"
rlang::parse_exprs(x3)

rlang::expr_text(x2)

# 18.5 Walking AST with recursive functions -------------------------------




