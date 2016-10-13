complete <- function(directory, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  Files <- list.files(path = directory, full.names = TRUE)
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
 
  completeCases <- data.frame()

  for (i in id) {
    Data<- (read.csv(Files[i],header=TRUE))
    nobs <- sum(complete.cases(Data))
    completeCases <- rbind(completeCases, data.frame(i,nobs))
    
  }
  completeCases
}
  