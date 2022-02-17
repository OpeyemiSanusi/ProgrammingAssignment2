## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
## 'makeCacheMatrix' takes in a matrix called 'x'
## it also takes 'var_inv' which we would use to store the inverse of our matrix
## 'var_inv' needs to be set to null
## I then created another function 'set' that takes in the values of x and assigns it
## get - gets the value of x by calling it
## setInverse - this would take in the an inverse and set it to 'var_inv'
## getInverse - would pull out the value of 'var_inv'

makeCacheMatrix <- function(x = matrix()) {
  var_inv <- NULL
  set <- function(y){
    x <<- y
    var_inv <<- NULL
  }
  get <- function()x
  setInverse <- function(inverse) var_inv <<- inverse
  getInverse <- function() var_inv
}


## Write a short comment describing this function
## ... allows you to pass a function that is not defined in the function arg
## if use call the function and pass in for example 'na.rm' this would replace
## all the ... in the function to na.rm

cacheSolve <- function(x, ...) { 
        ## Return a matrix that is the inverse of 'x'
  j <- x$getInverse
  if(!is.null(j)){
    message("getting cached data")
    return(j)
  }
  else {
    mat <- x$get
    j <- solve(mat, ...)
    x$setInverse(j)
    j
  }
}

