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
  
  ## Select evaluation criteria, i.e., outcome
  if (outcome=='heart failure')
  {id  <- 4}
  else if (outcome=='heart attack')
  {id  <- 3}
  else if (outcome=='pneumonia')
  {id  <- 5}
  else { stop("invalid outcome")}
  
  ## Call the funtion to rank the hospitals
 # source('~/Desktop/Coursera/R Programming/Assignment3/func')
  func(id, small, flag, number)}