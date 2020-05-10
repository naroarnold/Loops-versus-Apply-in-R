library(rbenchmark)


loopMaxes2 <- function(x) {
  max1 <- c()
  for(i in 1:length(x[1,])) {
    max1[i] <- max(x[,i])
  }
  return (max1)
}

applyMaxes <- function(x) {
  y <- 1:length(x[1,])
  return(sapply(y, function(z) max(x[,z])))
}


x <- matrix(sample(1:10, 1000000, replace = TRUE), nrow = 1000)

res <- data.frame(a = rep(0, 7), l = rep(0, 7))
for (i in 1:7) {
  res[i,] <- benchmark(loopMaxes2(x), applyMaxes(x))$elapsed
}
