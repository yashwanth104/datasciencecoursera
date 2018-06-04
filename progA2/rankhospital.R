rankhospital<-function(state,outcome,num="best"){
  
  #reading the data
  data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  
  #Validating the parameters
  outcomes = c("heart attack", "heart failure", "pneumonia")
  if(state %in% data$State == FALSE) stop("invalid state")
  if( outcome %in% outcomes == FALSE ) stop("invalid outcome")
  if( num != "best" && num != "worst" && num%%1 != 0 ) stop("invalid num")
  
  #NA's would be tested later on
  
  data <- data[,c(2,7,11,17,23)]
  names(data) <- list("name" , "state" , "heart attack", "heart failure", "pneumonia")
  
  #just getting the releavant data set for that state
  data <- data[data$state == state & data[outcome] != 'Not Available', ]
  
  #Coercing the numbers into integers.
  data[ , outcome] <- as.numeric(data[ , outcome ] )
  
  #handling num values  
  max <- nrow(data) # maximum rank of any hospital
  if(num == "best") num <- 1
  if(num == "worst") num <- as.numeric(max)
  if(num > max) return(NA)
  
  #Sorting my data frame according to the names followed by outcome.
  data <- data[order(data[,1]) , ]   
  data <- data[order(data[,outcome]) , ]  
  
  ## Return hospital name in that state with the given rank
  data[num ,"name" ]
}
