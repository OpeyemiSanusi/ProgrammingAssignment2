##The function takes in a matrix, converts it to an inverse
## It then stores the value of the inverse so it does not have to recompute




## 'makeCacheMatrix' takes in a matrix called 'x'
## it also takes 'var_inv' which we would use to store the inverse of our matrix
## 'var_inv' needs to be set to null
## I then created another function 'set' that takes in the values of x and assigns it
## get - gets the value of x by calling it
## setInverse - this would take in the an inverse and set it to 'var_inv'
## getInverse - would pull out the value of 'var_inv'
## put the results in a list so it returns the result of all the function
## so we can call it
## ... allows you to pass a function that is not defined in the function arg
## if use call the function and pass in for example 'na.rm' this would replace
## all the ... in the function to na.rm

makeCacheMatrix <- function(x = matrix(), ...) {
  var_inv <- NULL
  set <- function(y){
    x <<- y
    var_inv <<- NULL
  }
  get <- function()x
  setInverse <- function(inverse) var_inv <<- inverse
  getInverse <- function() var_inv
  list(set = set, get = get, 
       setInverse = setInverse, 
       getInverse = getInverse)
}




## cacheSolve takes in a matrix as x 
## it assigns x$getInverse() (from makeCacheMatrix) to var_inv
## if x$getInverse does not have a value yet it would return NULL
## the function then checks if var_inv is not empty
## if that's true it fetches the existing data contained in var_inv
## if not in fetches the matrix provided then inverts it and assigns it to var_inv
## it then sets the var_inv to the new value and prints the inverse

cacheSolve <- function(x, ...) { 
        ## Return a matrix that is the inverse of 'x'
  var_inv <- x$getInverse()
  if(!is.null(var_inv)){
    message("getting cached data")
    return(var_inv)
  }
    message("creating it now")
    data <- x$get()
    var_inv <- solve(data, ...)
    x$setInverse(var_inv)
    var_inv
}

