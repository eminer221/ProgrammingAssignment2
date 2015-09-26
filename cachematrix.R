## the first function creates a special "matrix"
## object that can cache its inverse



makeCacheMatrix <- function(x = matrix()) {
m <- NULL
set <- function(y) {
  x <<- y
  m <<- NULL
}
get <-function() x
setmean <- function(mean) m <<- mean
getmean <- function() m
list(set=set, get=get,
     setmean=setmean,
     getmean=getmean)
}

## the second function computes the inverse of the
## matrix from the first function
## if the inverse has already been calculated then 
## it retrieves the inverse from the cache

cacheSolve <- function(x, ...) {
  m <-x$getmean()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
data <- x$get()
m <- solve(data, ...)
x$setmean(m)
m
  }
