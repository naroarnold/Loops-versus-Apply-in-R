library(rbenchmark)

data("iris")


loopMaxes <- function(x) {
  max1 <- c(0,0,0,0)
  for(i in 1:150) {
    for(j in 1:4) {
      max1[j] = max(max1[j], x[i,j])
    }
  }
  return (max1)
}

applyMaxes <- function(x) {
  y <- 1:length(x[1,])
  return(sapply(y, function(z) max(x[,z])))
}

iris1 <- iris[,1:4]

res <- data.frame(a = rep(0, 7), l = rep(0, 7))
for (i in 1:7) {
  res[i,] <- benchmark(loopMaxes(x), applyMaxes(x))$elapsed
}
