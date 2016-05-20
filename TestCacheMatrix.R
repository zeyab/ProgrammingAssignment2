'------------'
source("cachematrix.R")
cachedMatrix <- makeCacheMatrix(matrix(1:4, 2, 2))
cachedMatrix$get()

is.null(cachedMatrix$getInverseMatrix())
'^^ Not cached yet:^^'

cacheSolve(cachedMatrix)
cacheSolve(cachedMatrix)

cachedMatrix$get()
cachedMatrix$getInverseMatrix()