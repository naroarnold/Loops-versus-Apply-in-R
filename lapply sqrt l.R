library(rbenchmark)

loopSqrt <- function(x) {
  for (i in 1:length(x[[1]])) {
    x[[1]][i] <- sqrt(x[[1]][i])
  }
  return (x)
}

applySqrt <- function(x) {
  return(lapply(x, sqrt))
}

hmillion <- list(1:100000000)

res <- data.frame(a = rep(0, 7), l = rep(0, 7))
for (i in 1:7) {
  res[i,] <- benchmark(loopSqrt(hmillion), applySqrt(hmillion))$elapsed
}
