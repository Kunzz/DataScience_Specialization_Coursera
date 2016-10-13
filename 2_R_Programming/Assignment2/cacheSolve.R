cacheSolve <- function(x, ...) {
  inverse <- x$getsolve()
  # If the "inverse" has a value, i.e., not NULL, print a message and then the value. 
  if(!is.null(inverse)) {
    message("getting cached data")
    return(inverse)
  }
  # If the "inverse" is NULL, calculate the inverse of the x. 
  data <- x$get()
  inverse <- solve(data, ...)
  # set the value of "inverse" to inverse (calculated rather than retrieved from the cache)
  x$setsolve(inverse)
  inverse
}