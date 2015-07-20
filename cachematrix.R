## This function creates a special matrix object that
## can cache its inverse

## Stores the cache value
makeCacheMatrix <- function(x = matrix()) {
  ## Initialise the value to null
  inv_x <- NULL
  
  ## set the value of the vector
  set <- function(y) {r
    x <<- y
    inv_x <<- NULL
  }
  ## get the value of the matrix
  get <- function() x
  ## invert the matrix and store in cache
  setinverse<- function(inverse) inv_x <<-inverse
  ## get the inverted matrix from cache
  getinverse <- function() inv_x
  ## return the created functions 
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}


## This function computes the inverse of the matrix returned
## by the function above

## if the inverted matrix doesn't exist,
## it is created in the working environment,
## it is inverted value is stored in cache

cacheSolve <- function(x, ...) {
  ## try to get the inverse of the matrix stored in cache
   inv_x <- x$getinverse()
 
   ## return inverted matrix from cache if exists
    if (!is.null(inv_x)) {
    message("getting cached inverse matrix")
      ## display matrix
    return(inv_x)
  } else {
    ## get matrix as it doesn't exist
    ## computing the inverse of a square matrix
    ## display 
    inv_x <- solve(x$get())
    x$setinverse(inv_x)
    return(inv_x)
  }
}
