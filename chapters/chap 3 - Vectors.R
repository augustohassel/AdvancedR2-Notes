# 3.4.3 Date-times -----
now <- as.POSIXct("2019-07-01 22:00", tz = "America/Buenos_Aires") # ct =  calendar time
typeof(now)
attributes(now)
structure(now, tzone = "Europe/Berlin")

# 3.4.4 Durations -----
one_week_1 <- as.difftime(1, units = "weeks")
one_week_1
typeof(one_week_1)
attributes(one_week_1)

# 3.6 Data Frames and Tibbles -----
library(tibble)
df2 <- tibble(x = 1:3, y = letters[1:3])
typeof(df2)
attributes(df2)

names(data.frame(`1` = 1))
names(tibble(`1` = 1))

tibble(
  x = 1:3,
  y = x*2
)

nrow(tibble())
ncol(tibble())

nrow(data.frame())
ncol(data.frame())

c()
list()
