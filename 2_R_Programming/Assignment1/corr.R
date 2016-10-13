corr <- function(directory, threshold = 0) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'threshold' is a numeric vector of length 1 indicating the
  ## number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0
  
  ## Return a numeric vector of correlations

  source("complete.R")
  completeCases <- complete(directory)
  
  AboveThreshold <- completeCases[completeCases$nobs > threshold,1]
 
  Files <- list.files(path = directory, full.names = TRUE)
 
  correlations <- rep(NA,length(AboveThreshold))
 
  for (i in AboveThreshold) {
    Data <- (read.csv(Files[i]))
    completeCases <- complete.cases(Data)
    validSulfate <- Data[completeCases, 2]
    validNitrate <- Data[completeCases, 3]
    correlations[i] <- cor(x = validSulfate, y = validNitrate, use="complete.obs")
    
  }
 correlations <- correlations[complete.cases(correlations)]
}
  