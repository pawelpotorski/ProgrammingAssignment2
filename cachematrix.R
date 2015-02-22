## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
  ## Creating structure containing list of functions such as set, get, setsolve, getsolve
  s <- NULL
  set <- function(y) {
    x <<- y
    s <<- NULL
  }
  get <- function() x
  setsolve <- function(solve) s <<- solve
  getsolve <- function() s
  list(set = set, get = get,
       setsolve = setsolve,
       getsolve = getsolve)
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
  ## The aim of this function is returning a matrix (denoted by s in this code) that is the inverse of 'x'
  s<-x$getsolve()
  ## Condition that checks whether inverse of 'x' is computed
  if(!is.null(s)){
    message("I get cached data for you")
    return(s)
  }
  ## New computation in case of new data
  data<-x$get()
  s<-solve(data,...)
  x$setsolve(s)
  s
}
