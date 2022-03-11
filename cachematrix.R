## These functions create a special object that stores a matrix and cache's its inverse.

## This first function creates a special "matrix" that sets the value of the matrix, gets the calue of the matrix, sets the value of the inverse, and gets the value of the inverse.

makeCacheMatrix <- function(x = matrix()) {
		i <- NULL
		set <- function(y) {
				x <<- y
				i <<- NULL
		}
		get <- function() x
		setinverse <- function(inv) i <<- inv
		getinverse <- function() i
		list(set=set, get=get,
			setinverse = setinverse,
			getinverse = getinverse)
}

## The second function finds the inverse of the special "matrix". If the inverse was already calculated, it will retreive the inverse from the cache.

cacheSolve <- function(x, ...) {
		i <- x$getinverse()
		if(!is.null(i)) {
				message("getting cached data")
				return(i)
		}
		data <- x$get()
		i <- solve(data, ...)
		x$setinverse(i)
		i
        ## Return a matrix that is the inverse of 'x'
}
