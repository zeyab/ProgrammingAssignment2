## Assignment: Programming Assignment 2: Lexical Scoping

## makeCacheMatrix accepts a matrix and saves it in the cache for other consumers. 
## The function provides interfaces to retrieve and save matrix.
## Caching is beneficial in avoiding calculation on large data sets where it can deteriorate performance
## by repeating the same task over large amounts of data.
## cacheSolve(): solves the matrix.
makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  
  get = function(){
    print('---Original Matrix---')
    x
  } 
  getInverseMatrix <- function(){
    print('---Inversed Matrix---')
    m
  }
  
  list(set = set, 
       get = get,
       setInverseMatrix = function(mat) m <<-mat,
       getInverseMatrix = getInverseMatrix)
}


## Write a short comment describing this function
## This is the read/write-through access interface. Interface manages wheter the requested data is 
# saved and when request is made it first checks in the local storage and then try accepig
cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  m <- x$getInverse()
  # Check if matrix is available in cache
  if (!is.null(m)) {
    print('From cache')
    return(m)
  }else{
    print('No cache')
  }
  #solve inverses matrix
  m <- solve(x$get(), ...)
  x$setInverse(m)
  return(m)
}
