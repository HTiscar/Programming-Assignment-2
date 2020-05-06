makeCacheMatrix <- function(x = matrix()){
  im <- NULL
  
  # Function set(): set the value of y to the value of x in cache.
  set <- function(y){
    x <<- y
    im <<- NULL
  }
  
  # Function get(): retrieves the value of x
  get <- function() x
  
  # Function setinverse(): sets the value of the resolved inverse
  # matrix to the value of im in cache. 
  setinverse <- function(inverse) im <<- inverse
  
  # Function getinverse(): retrieves the value of im 
  getinverse <- function() im
  
  # list of functions assigned 
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}

cacheSolve <- function(x, ...) {
  im <- x$getinverse()
  
  # Conditional to determine if the is data of the calculation in cache
  if(!is.null(m)){
    message("getting catched data")
    return(im)
  }
  
  # When there is no value in cache it resolves the matrix 
  message("resolving inverse matrix")
  data <- x$get()
  im <- solve(data, ...)
  
  # Sets the value of the inverse matrix to cache for future
  # calling
  x$setinverse(im)
  im
}
