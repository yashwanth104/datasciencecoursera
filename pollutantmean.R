pollutantmean <- function(directory,pollutant,id=1:332){
  
  if(directory=="specdata") 
   directory <- ("./specdata/")
  
  files_data <- as.character( list.files(directory) )
  file_paths <- paste(directory, files_data, sep="")
  amount_pollutant <- c()
   for(i in id) {
    current_file <- read.csv(file_paths[i])
    na_removed <- current_file[!is.na(current_file[, pollutant]), pollutant]
    amount_pollutant <- c(amount_pollutant, na_removed)
  }
  result <- mean(amount_pollutant)
  return(result) 
}
