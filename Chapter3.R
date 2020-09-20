## Chapter 3 #### indexing or subsetting



## logical ##



a <- c(1, 3, 5, NA, 7)
is.na(a) 
!is.na(a)  ##is not na
a[is.na(a)]  ## returns all  the na
a[!is.na(a)]  ## returns everything that is not na
a>3  # T/F for all of a
a[a>3] ## returns all of the a elements where a>3

a[c(T, F, T)]   #Dont do these
a[c(rep(T, 7), NA)]



## postive integer ##



a[c(1:3, 2)]  ### indexs 1 through 3 and then the second element again
test<- c(a[c(1:3)], 2)  ### if you wanted to just add 2 to the a new vector with index 1 through 3

a[a > 3]
a[which(a>3)]  ## this doesn't include the NA elements 

length(a)
a[6]  ## all indexes that are greater than the length are NA

a[c(0,3)]  ## there is no 0 index
a[3.8] ## rounds down towards 0



## vector of a negative integer ##



#this is used to get ride of indexes
a[-c(1,4)] ## positive and negative indexes cannot get mixed together



## a vector of character strings ##



a[c("a", "c")]  ## this just gives you NA because it needs to have names first

names(a) = c(letters[1:4], "d")
a[c("a", "c")]
a[c("a", "d")]  ## in this example, you only get the first d

is.element(names(a), 7) ## helps you find indexs with the name "d", so you can find duplicates
names(a) %in% "d" #ditto
a[is.element(names(a), 7)]  #returns the elements with the name d
a[names(a) %in% "d"] #ditto

names(a)[3] <- NA  # this removes the name of the third index
a[c(NA, "b")] ## you cannot get the element of a index with NA name, you would just get NA
a[is.na(names(a)) | names(a) == "b"] # this is how you would get around the above issue

a[c("e", "f")]  ## this just returns NA and no error messages



## Index position may be empty ##

a[] ## this returns all indexs of a vector



## index vector: replacement ##



x <- c(3, 6, NA, -1)
x[is.na(x)]<- 0  ## this replaces all of the NA with 0
x[1:3]<-c(9,8,7) # replaces indexs 1 through 3 with numbers 9,8,7
x[7]<-"end" ## you can add an index outside of the orignial length, indexes inbetween are replaced with NA
x[-c(2,5)] <- 10  #removes the index 2 and 5 and replaces the elements with 10

names(x) <- c(NA, letters[1:6])
x[c(NA, "a")] <- 3  ## when there are NA names, you cannot just replace the element like above, a new element is created at the end of the vector

ex<-names(x)<-letters[1:4]
ex[]<-"All the same" ## this can be used to change all the indexes at once



#### ARRAYS ####

y <- array(c(1:20, rep(NA,4)), dim = c(2,3,4))
dimnames(y) <- list(d1 = c("i", "ii"), d2 = c("I", "II", "III"), d3 = letters[1:4]) ### each d is a demension, d1= rows, d2, columns, d3, # of times

y[3:6]

y[1,2,3]  ## first row, second column, third page
y[2,1,2:3]
x[,c("I", "III"),-c(2,4)]  ## can remove pieces as well


### using matrixes  ####

square.matrix <- matrix(1:9, 3, 3)

n <- nrow(square.matrix)
ad <- matrix(c(1:n, n:1), n)
ad

square.matrix[ad] <- 0   #### im not really sure on this one



### DATA FRAME ###


d <- data.frame(L = c("A", "B", "C"), M = 1:3, N = c(T, F, NA))
d[c(2,3), ]


d[d$L == "A", ]  ## THIS PUlls the rows where L is equal to "A"
d[, c("M", "N")] ## this pulls the columns M and N 
d[d$L == "A", c("M", "N")] #this pulls rows where L=A and columsn equla M and N


d[,3]
d[3] ## Not that there is a difference here. 



### More detail on the operators ###



#The type of object returned by using the [ operator is the same data type as the object [
#applies to. For instance, using [ to subset a list returns a list

#You can use [ to extract any numbers of elements of an object, while you can only use [[ and
#$ to extract one element

#$ does not evaluate its argument, while [[ and [ do. Thus, you can include an expression
#inside [[ or [

#$ uses partial matching to extract elements, while [[ and [ do not, THIS IS NOT RECOMENDED


## simpliying and preserving ##

#vectors
## Simplifying : using the [[ operator. The names attribute will be removed
## Preserving : using the [ operator
vec <- 1:5
names(vec) <- letters[1:5]
vec[[1]]

vec[1]

#Factors
#Simplifying : using the [ operator and setting the drop option to TRUE will drop unused level
#Preserving : using the [ operator
fact <- factor(c("A", "B", "C"))
fact[1:2, drop=T]

fact[1:2]

#matrix and Array
#Simplifying : using the [ operator. If the result’s dimension has length of 1, the dim attribute will be dropped
#Preserving : using the [ operator and setting the drop option to FALSE will preserve the dim attribute
mat <- matrix(1:4, 2)
mat[, 1]


#list
#Simplifying : using the [[ operator. It will return the list content
#Preserving : using the [ operator. It will return a list
lis <- list(a = 1:3, b = "A")
lis[[1]]

## Data frame ##
#Simplifying : using the index vector with [ operator at the second index position or using the [[ operator when selecting a column
#Preserving : using the index vector the [ operator at the second index position and setting the drop option to FALSE or using the 
#[ operator when selecting a column

dat <- data.frame(V1=1:3, V2=c("a", "b", "c"), V3=c(T, T, F))

dat[, 2]
dat[[2]]

dat[, 2, drop = F]
dat[2]

