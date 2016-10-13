rankhospital <- function(state, outcome, num = "best") {
  ## Read outcome data
  source('~/Desktop/Coursera/R Programming/Assignment3/best.R')
  xx<- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  ## Check that state and outcome are valid
  small  <- data.frame(xx$Hospital.Name, xx$State, xx[, 11], xx[, 17], xx[, 23])
  names(small)[2]<-paste("State")
  names(small)[3]<-paste("heart attack")
  names(small)[4]<-paste("heart failure")
  names(small)[5]<-paste("pneumonia")
 
  
  w1  <- grepl(state, xx$State)
  if (sum(w1)>=1){
    w  <- grep(state, small$State)
    v  <<- small[w,]
    
    flag2  <- TRUE;
    if (num=="best") 
      {flag <- FALSE
       number  <- 1}
    
    else if (num=="worst")
            {flag <- TRUE
             number  <- 1}
    
    else if (num >dim(v)[1])
    {flag2 <- FALSE
     flag  <- TRUE
     number  <- num}
    
    else 
    {flag <- FALSE
     number <- num}
    
      if (sum(grepl(outcome, names(v)[3:5])))
    {
      if (outcome == 'heart attack') {
        v  <- v[!grepl ("Not Available", v[, 3]), 1:3]
        x1  <- as.character(v$"heart attack")
        x2 <- as.numeric(x1)
        vv  <- as.character(v[order(x2, decreasing=flag),1])
        hospital  <- as.character(vv[number])
      } 
      
      else if (outcome == 'heart failure') {
        v <- v[!grepl ("Not Available", v[, 4]), c(1,2,4)]
        x1  <- as.character(v$"heart failure")
        x2 <- as.numeric(x1)
        vv  <- as.character(v[order(x2, decreasing=flag),1])
        hospital  <- as.character(vv[number])
      }
      
      else if (outcome == 'pneumonia') {
        v <- v[!grepl ("Not Available", v[, 5]), c(1,2,5)]
        x1  <- as.character(v$pneumonia)
        x2 <- as.numeric(x1)
        vv  <- as.character(v[order(x2, decreasing=flag),1])
        hospital  <- as.character(vv[number])
        
      }
    
    if (flag2==TRUE) {
      print (hospital)}
    else {print("NA")}
  
  }
    
    else{
      stop("invalid outcome")
    }
  }
  else{
    stop("invalid state")
  }
  

  ## Check that state and outcome are valid
  ## Return hospital name in that state with the given rank
  ## 30-day death rate
}