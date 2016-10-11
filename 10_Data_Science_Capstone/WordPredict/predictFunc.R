# Coursera Data Science Specialization
# Capstone
# Kun Zhu

########################
# Precition function
########################

library(tm)

WORDS_RETURN = 10

# read data files for word prediction

message <- ""
singleWord <- readRDS("singleWord.rds")
bigram <- readRDS("biGram.rds")
trigram <- readRDS("triGram.rds")
quagram <- readRDS("quaGram.rds")

# words prediction using ngram

ngramPredict <- function(lastWords, n) {
  lastWords <- paste0('^', lastWords, ' ')
  
  if(n==3)
    selectedWords <- subset(quagram, grepl(lastWords, quagram$Words))
  else
    if(n==2)
      selectedWords <- subset(trigram, grepl(lastWords, trigram$Words))
  else
    if(n==1)
	    selectedWords <- subset(bigram, grepl(lastWords, bigram$Words))
  
  if(nrow(selectedWords) > 0) 
    {
    returnWords <- head(gsub(lastWords,"", selectedWords$Words), WORDS_RETURN)
    message <<- sprintf("Words are predicted from %1dgram.", (n+1))
    return(returnWords)
    }
  
  else{
    n <- n-1;
    
    if(n == 2) { 
      lastWords <- substr(lastWords, 2, nchar(lastWords))
      myInput <- as.data.frame(strsplit(lastWords, " "))
      len <- nrow(myInput)
      num <- 2
      if(len < num) nun<-len 
      lastWords <- paste(myInput[(len-(num-1)) : len, ], collapse=" ")
      ngramPredict(lastWords, n)
    }
    
    else {
      
      if(n == 1) { 
        lastWords <- substr(lastWords, 2, nchar(lastWords))
        myInput <- as.data.frame(strsplit(lastWords, " "))
        len <- nrow(myInput)
        num <- 1
        if(len < num) num<-len 
        lastWords <- paste(myInput[(len-(num-1)) : len, ], collapse=" ")
        ngramPredict(lastWords, n)
      }
      
      else {
        
        lastWords <- substr(lastWords,2,nchar(lastWords))
        message <<- paste("Cannot predict next words, returing the most frequent word instead.")
        nrows <- nrow(singleWord)
        singleWordList <- vector("list", length=50)
        for(i in seq_len(25))
          singleWordList[i] <- as.character(singleWord[i, 1])
        return(head(singleWordList, WORDS_RETURN))
      }
    }
  }
}

wordPredict <- function(user_input) {
  
  myInput <- as.data.frame(strsplit(user_input, " "))
  
  len <- nrow(myInput)
  num <- 3
  
  if(len < 3) 
    num <- len 
  
  lastWords <- paste(myInput[(len-(num-1)):len, ], collapse=" ")
  
  return(ngramPredict(lastWords, 3))
}
