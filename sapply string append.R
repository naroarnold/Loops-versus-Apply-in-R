library(rbenchmark)

loopAppend <- function(x) {
  for(i in 1:length(x)) {
    x[[i]] <- paste(x[[i]], "b")
  }
  return(x)
}

applyAppend <- function(x) {
  return(sapply(x, function(y) paste(y, "b")))
}


x = list()
for(i in 1:10000) {
  x[[i]] <- "a"
}


res <- data.frame(a = rep(0, 7), l = rep(0, 7))
for (i in 1:7) {
  res[i,] <- benchmark(loopAppend(x), applyAppend(x))$elapsed
}
