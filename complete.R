complete <- function(directory, id = 1:332) {
  
  if(directory=="specdata") 
      directory <- ("./specdata/")
  
  id_len <- length(id)
  complete_data <- rep(0, id_len)
       
    
  files_data <- as.character( list.files(directory) )
  file_paths <- paste(directory, files_data, sep="")
  j <- 1 
  for(i in id) {
      current_file <- read.csv(file_paths[i])
      complete_data[j] <- sum(complete.cases(current_file))
      j <- j + 1
  }
  result <- data.frame(id = id, nobs = complete_data)
  return(result)
} 