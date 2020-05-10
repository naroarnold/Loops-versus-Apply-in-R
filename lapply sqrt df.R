library(rbenchmark)

loopSqrt2 <- function(x) {
  for (i in 1:length(x[,1])) {
    for (j in 1:length(x[1,])) {
      x[i,j] <- sqrt(x[i,j])
    }
  }
  return (x)
}

applySqrt <- function(x) {
  return(lapply(x, sqrt))
}

data(iris)
iris <- iris[,1:4]

res <- data.frame(a = rep(0, 7), l = rep(0, 7))
for (i in 1:7) {
  res[i,] <- benchmark(loopSqrt(hthousand), applySqrt(hthousand))$elapsed
}
