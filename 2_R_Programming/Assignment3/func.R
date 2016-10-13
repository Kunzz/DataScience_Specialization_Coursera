func <- function(id, data, flag, number) 
  {

  ## Divide big chunck of data into smaller pieces on a per state basis.
  xx  <- split(data, data$State)
  i <- 1
  while (i <=length(xx))
  # Staring of the while loop
  {
  ## Change data frame names
  v<- as.data.frame(xx[i])
  names(v)[2]<-paste("State")
  names(v)[1]<-paste("Hospital")
  ## Remove the invalid statistics, i.e., Not Available
  v  <- v[!grepl ("Not Available", v[, id]), c(1,2,id)]
  ## Load the death rate into numeric vector x2
  x1  <- as.character(v[,3])
  x2 <- as.numeric(x1)
  ## Rank the hopistal
  vv  <- v[order(x2, decreasing=flag),]
  
  ## Handeling tie
  value  <- as.numeric(as.character(vv[number, 3]))
  new_number  <- as.numeric(which(as.numeric(as.character(vv[, 3]))==value))   
  hh  <- as.character(vv[new_number,"Hospital"])
  ## Sort the tied hospitals in a alphabetical order
  hh  <- hh[order(hh)]
  ## Save the ranking per state into hospital data frame
  hospital[i]  <- hh[1]
  valid_state[i]  <- as.character(vv[number,"State"])
  ## Index of the State data frame with NA
  idx<- which(is.na(valid_state)==TRUE)  
  valid_state[idx]  <- as.character(vv$State[1]) 
  i  <- i+1
} #End of the while lsoop
data.frame(hospital=hospital,state=valid_state,row.names=valid_state)
}