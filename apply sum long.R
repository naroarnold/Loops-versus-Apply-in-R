library(rbenchmark)

loopSum <- function(x) {
  o <- c()
  for (i in 1:length(x[,1])) {
    o[i] <- sum(x[i,])
  }
  return (o)
}

applySum <- function(x) {
  return(apply(x, 1, sum))
}




x <- matrix(sample(1:10, 20000000, replace = TRUE), nrow = 40000)

res <- data.frame(a = rep(0, 7), l = rep(0, 7))
for (i in 1:7) {
  res[i,] <- benchmark(loopSum(x), applySum(x))$elapsed
}
