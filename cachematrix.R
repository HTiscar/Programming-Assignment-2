## Description of functions 

# The script consists of two functions, que first one which covers a list 
# of anonymous functions that will be called to solve the inverse matrix and 
# save the result to cache. 

# The second function will employ an if clause in order to evaluate if the 
# matrix was been solved before, and if it is the case it will return the 
# value stored in cache. 

## Write a short comment describing this function.

# Function makeCacheMatrix(): Lists of anonymous functions that will solve the
# matrix and will save the result in cache. 
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

# Function cacheSolve(): It evaluates if the value for the calculation
# of the inverse matrix is in cache and, if it is so, returns it. 
cacheSolve <- function(x, ...) {
  im <- x$getinverse()
  
  # Conditional to determine if the is data of the calculation in cache
  if(!is.null(im)){
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

#Test 
test <- matrix(c(3, 4, 5, 6), nrow = 2, ncol = 2)

# First time displays the message that it calculates the inverse
# matrix. Second time it displays the cache valued. 
a <- makeCacheMatrix(test)
cacheSolve(a)
