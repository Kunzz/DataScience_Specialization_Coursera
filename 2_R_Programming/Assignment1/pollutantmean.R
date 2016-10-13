pollutantmean <- function(directory, pollutant, id = 1:332) {
    ## 'directory' is a character vector of length 1 indicating
    ## the location of the CSV files
  
    Files <- list.files(path = directory, full.names = TRUE)
    ## 'pollutant' is a character vector of length 1 indicating
    ## the name of the pollutant for which we will calculate the
    ## mean; either "sulfate" or "nitrate".
    ## 'id' is an integer vector indicating the monitor ID numbers
    ## to be used
    ## Return the mean of the pollutant across all monitors list
    ## in the 'id' vector (ignoring NA values)
     Data <-data.frame()    
    for (i in id) {
     Data <- rbind(Data, read.csv(Files[i]))
    }
    if (pollutant == 'sulfate') {
      mean(Data$sulfate, na.rm = TRUE)
    } else if (pollutant == 'nitrate') {
      mean(Data$nitrate, na.rm = TRUE)
    }
    else {
      print("wrong input")
    }
}