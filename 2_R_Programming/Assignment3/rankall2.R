rankall <- function(outcome, num = "best") 
{ #starting of the function
  ## Read outcome data
  hospital <<- character(0)
  valid_state  <<- character(0)
  xx<- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  small  <- data.frame(xx$Hospital.Name, xx$State, xx[, 11], xx[, 17], xx[, 23])
  ## Update the names of the input data.frame
  names(small)[2]<-paste("State")
  names(small)[3]<-paste("heart attack")
  names(small)[4]<-paste("heart failure")
  names(small)[5]<-paste("pneumonia")
  
  ## Select the flag for ordering flag=TRUE/FALSE: Assending/Dissending.
  if (num=="best") 
  {flag <- FALSE
   number  <- 1}
  
  else if (num=="worst")
  {flag <- TRUE
   number  <- 1}
  
  else 
  {flag <- FALSE
   number <- num}
  ## Call the funtion to rank the hospitals
  func(outcome, small, flag, number)}