## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

#a function used to create a special matrix object that can cache its inverse 
# computing the incerse of a square matrix can be done with the solve function in R 
# on the premise that the matrix supplied is invertible

makeCacheMatrix <- function(x = matrix()) {
    i <- NULL
    set <- function(y){
        x <<- y
        m <<- NULL
    }
    get <- function() x
    setinverse <- function(inverse) i <<-inverse
    getinverse <- function() i
    list(set = set, 
         get = get,
         setinverse = setinverse,
         getinverse = getinverse)
}


## Write a short comment describing this function

# a function computing the inverse of the special matrix 
# if the inverse has already been calculated and the matrix has not changed 
# then the cachesolve should retrieve the inverse from the cache


cacheSolve <- function(x,...){
    i <- x$getinverse()
    if (!is.null(i)){
        message("getting cached data")
        return(i)
    }
    data <- x$get()
    i <- solve(data, ...)
    x$setinverse(i)
    i
}

