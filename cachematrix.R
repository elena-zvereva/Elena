## This two functions are created in order to ease the operation of matrix inversion.
##The first function (makeCaheMatrix) creates a list with the functions will be used in getting the inverted matrix.
##The second fuction (cacheSolve)checks if there is the inverted verson of needed matrix in the cache, and if there is none,
##creats the inverted matrix.
##The function for inverting matrices in R is sove() so the supporting functins are naimed accordingly (setsolve and getsolve).
##The inverted matrix is presented as i. 

##This function (makeCaheMatrix) creates a list with the functions that set the value of matrix, get its value,
##set the value of inverted matrix and get value of inverted matrix.

makeCacheMatrix <- function(x = matrix()) {
  i<- NULL
  set<- function(y){
    x<<- y
    i<<- NULL
  }
  get <- function() x
  setsolve<- function(solve) i <<-solve
  getsolve<- function () i
  list(set=set, get=get, 
       setsolve = setsolve,
       getsolve = getsolve)
}


## This function searches in te cache for already inverted matrices, and if there are none,
## counts the inverted matrix and prints it. 

cacheSolve <- function(x, ...) {
  i <- x$getsolve()
  if(!is.null(i)){
    message("getting cached data")
    return(i)
  }
  data <- x$get()
  i <- solve(data, ...)
  x$setsolve(i)
  i
}

