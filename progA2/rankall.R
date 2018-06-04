rankall <- function(outcome , num = "best")
{
  #reading the data
  data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  
  #Validating the parameters
  outcomes = c("heart attack", "heart failure", "pneumonia")
  if( outcome %in% outcomes == FALSE ) stop("invalid outcome")
  if( num != "best" && num != "worst" && num%%1 != 0 ) stop("invalid num")
  
  #NA's would be tested later on
  
  data <- data[,c(2,7,11,17,23)]
  names(data) <- list("name" , "state" , "heart attack", "heart failure", "pneumonia")
  
  #just getting the releavant data set for that state . Removing the NA's also from the data
  data <- data[data[outcome] != 'Not Available', ]
  
  #Coercing the numbers into integers.
  data[ , outcome] <- as.numeric(data[ , outcome ] )
  
  #Sorting my data frame according to the names.
  data <- data[order(data[,1]) , ]   
  num_row <- function(x)
  {
    x <- x[order(x[,outcome]) , ] 
    max <- nrow(x)
    if(num == "best") num <- 1
    if(num == "worst") num <- as.numeric(max)
    if(num > max) return(c(NA , x[1,2] , NA , NA , NA))
    
    x[num , ]
  }
  
  list <- sapply( split(data , data$state), num_row) 
  
  data2 <- data.frame(matrix(list , nrow = length(list)/5 , ncol = 5 , byrow=TRUE)[ , c(1,2)] )
  names(data2) <- list("hospital" , "state")
  data2
}