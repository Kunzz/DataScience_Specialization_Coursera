rankall_one <- function(outcome, num = "best") 
  ##options(warn=-1)
  { #starting of the function
  ## Read outcome data
  hospital <<- character(0)
  valid_state  <<- character(0)
  xx<- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  ## Check that state and outcome are valid
  small  <- data.frame(xx$Hospital.Name, xx$State, xx[, 11], xx[, 17], xx[, 23])
  names(small)[2]<-paste("State")
  names(small)[3]<-paste("heart attack")
  names(small)[4]<-paste("heart failure")
  names(small)[5]<-paste("pneumonia")
  
  if (num=="best") 
  {flag <- FALSE
   number  <- 1}
  
  else if (num=="worst")
  {flag <- TRUE
   number  <- 1}
  
  else 
  {flag <- FALSE
   number <- num}

  if (outcome == 'heart attack') 

  # starting of the if outcome bracket 1
  {  
      xx  <- split(small, small$State)
      i  <- 1
      while (i <=length(xx))
      # staring of the while loop
        {
        v<- as.data.frame(xx[i])
        names(v)[2]<-paste("State")
        names(v)[1]<-paste("Hospital")
        v  <- v[!grepl ("Not Available", v[, 3]), 1:3]
        x1  <- as.character(v[,3])
        x2 <- as.numeric(x1)
        vv  <- v[order(x2, decreasing=flag),1:2]
        hospital[i] <- as.character(vv[number,"Hospital"])      
        valid_state[i]  <- as.character(vv[number,"State"])
        idx<- which(is.na(valid_state)==TRUE)  
        valid_state[idx]  <- as.character(vv$State[1])
        i  <- i+1
        } #end of the while loop
      data.frame(hospital=hospital,state=valid_state,row.names=valid_state)
  } # end of the if outcome bracket 1
 
  else if (outcome == 'heart failure') 
    # starting of the if outcome bracket 2
  {  
    xx  <- split(small, small$State)
    i  <- 1
    while (i <=length(xx))
      # staring of the while loop
    {
      v<- as.data.frame(xx[i])
      names(v)[2]<-paste("State")
      names(v)[1]<-paste("Hospital")
      v  <- v[!grepl ("Not Available", v[, 4]), c(1,2,4)]
      x1  <- as.character(v[,3])
      x2 <- as.numeric(x1)
      vv  <- v[order(x2, decreasing=flag),]
      
      value  <- as.numeric(as.character(vv[number, 3]))
      new_number  <- as.numeric(which(as.numeric(as.character(vv[, 3]))==value))   
      hh  <- as.character(vv[new_number,"Hospital"])
      hh  <- hh[order(hh)]
      hospital[i]  <- hh[1]
          
      valid_state[i]  <- as.character(vv[number,"State"])
      idx<- which(is.na(valid_state)==TRUE)  
      valid_state[idx]  <- as.character(vv$State[1]) 
      i  <- i+1
    } #end of the while lsoop
      data.frame(hospital=hospital,state=valid_state,row.names=valid_state)
   
  } # end of the if outcome bracket 2

  
  else if (outcome == 'pneumonia') 
   # starting of the if outcome bracket 3
 {  
   xx  <- split(small, small$State)
   i  <- 1
   while (i <=length(xx))
     # staring of the while loop
   {
     v<- as.data.frame(xx[i])
     names(v)[2]<-paste("State")
     names(v)[1]<-paste("Hospital")
     v  <- v[!grepl ("Not Available", v[, 5]), c(1,2,5)]
     x1  <- as.character(v[,3])
     x2 <- as.numeric(x1)
     vv  <- v[order(x2, decreasing=flag),1:2]
     hospital[i] <- as.character(vv[number,"Hospital"])      
     valid_state[i]  <- as.character(vv[number,"State"])
     idx<- which(is.na(valid_state)==TRUE)  
     valid_state[idx]  <- as.character(vv$State[1])
     i  <- i+1
   } #end of the while loop
   data.frame(hospital=hospital,state=valid_state,row.names=valid_state)
 } # end of the if outcome bracket 3
 
 else{
   stop("invalid outcome")
 }
 
} #End of the function