
  best <- function(state,outcome){
    
    outcomes=c("heart attack","heart failure","pneumonia")
    data<-read.csv("outcome-of-care-measures.csv",colClasses = "character")
    if(state %in% data$State == FALSE ) stop("invalid state")
    if(outcome %in% outcomes ==FALSE) stop("invalid outcome")
    
    data<-data[,c(2,7,11,17,23)]
    names(data)<-list("name","state","heart attack","heart failure","pneumonia")
    data<-data[data$state == state ,]
    data[,outcome]<-as.numeric(data[,outcome])
    data<-data[order(data[,1]),]
    vals<-data[,outcome]
    rowNum<-which.min(vals)
    data[rowNum,"name"] 
    
    
    
    
  
}