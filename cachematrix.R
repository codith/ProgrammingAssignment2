## makeCacheMatrix and cacheSolve are tools to work with large matrices
## and their inverses. The matrix inverse is saved along with the matrix
## to avoid having to recompute the matrix.


## makeCacheMatrix returns a list containing a matrix, its inverse
## and functions to set the matrix and its inverse. 

makeCacheMatrix <- function(x = matrix()) {
        inv <- NULL
        set <- function(y) {
                x <<- y
                inv <<- NULL
        }
        get <- function() x
        setinverse <- function(solve) inv <<- solve
        getinverse <- function() inv
        list(set = set, get = get, 
             setinverse = setinverse, 
             getinverse = getinverse)
}


## cacheSolve
## is a version of matrix inversion that can operate on the list
## generated by makeCacheMatrix

cacheSolve <- function(x, ...) {
        inv <- x$getinverse()
        if(!is.null(inv)) {
                message("getting cached data")
                return(inv)
        }
        data <- x$get()
        inv <- solve(data, ...)
        x$setinverse(inv)
        inv
}
