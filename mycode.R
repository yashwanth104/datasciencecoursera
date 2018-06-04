myfunction <- function(){
x <- 1:4
y <- 2:3
x + y
}
second <- function(x){
x + rnorm(length(x))
}