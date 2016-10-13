makeCacheMatrix <- function(x = matrix()) {
## Clear up for variable "inverse"
  inverse <- NULL
## set x and empty "m"inverse" in the cache
  set <- function(y) {
    x <<- y
    inverse <<- NULL
  }
## get x
  get <- function() x
## set the value for "inverse"
  setsolve <- function(solve) inverse <<- solve
## get the value from "inverse"
getsolve <- function() inverse
## Define makeCaheMatrix as a list including four functions. 
  list(set = set, get = get,
       setsolve = setsolve,
       getsolve = getsolve)
}