mydata=c(2.9, 3.5, 4.5, NA, 3, 2.4)
print(mydata)
typeof(mydata)
length(mydata)
class(mydata)
mydataL=c(2L, 3L, 4L, NA, 3L, 2L)
print(mydataL)
print(mydataL)
typeof(mydataL)
length(mydataL)
class(mydataL)

colors <- c("red", "green", "blue", "yellow", NA, "purple")
typeof(colors)
class(colors)



#### the "defalut false/0/"" fucntions
numeric(5)
logical(5)
character(5)


newLogic <- c(TRUE, NA, T, F)

#some examples of built in constrants
print(month.abb)
print(LETTERS)

#indexing
mydata=c(2.9, 3.5, 4.5, NA, 3, 2.4)
mydata[3:4]
mydata[c(2,4,6)]


#naming vectors - used to give names to indexes
mydata=c(2.9, 3.5, 4.5, NA, 3, 2.4)
names(mydata) = letters[1:6]
print(mydata[3:4])
### another exmaple, the first bit each time is the name, second is the elemenet
vec1 <- c(first=1, second=pi, third = sqrt(2))
## another exmaple, the whole first bit is the element, the secont is the name(the structure function below is can also do this)
vec2 <- setNames(c(1, pi, sqrt(2)), c("first", "second", "third"))
## names can repeate
vec3 <- c(first=1, first=pi, third = sqrt(2))
## not every element must have a name
vec4 <- c(1, pi, third = sqrt(2))
## can remove the names
vec5 <- unname(vec2)
print(vec2)
print(vec5)



###object atributues
## "names" is an example of an atribute 
## you can add attributes
attr(vec1, "New att")="This is the new att"
## you can see all the attributes at once
attributes(vec1)
## you can add a list of different attributes. Write vector, then add attributes after
vec6= structure(c(1,pi,sqrt(2)), names=c("first", "second", "third"), new_attr="this is the new attributes")
### note that most attributes will be lost if we modify a vector (names are not lost, as well as dim and class)
vec7= structure(c(1,pi,sqrt(2)), new_attr="this is the new attributes")


### Concatenating a vector, aka adding stuff to vector
newdata <- c(mydata, 3.6)
print(newdata)




## vectors can be coersed from one type of vector to another. AKA when you do type of, it has to pick the "highest"
#this has an order
#logical, interger, double and character (Character is the highest)
typeof(c(FALSE, 1L))
typeof(c(1L, pi))
typeof(c(pi, "pi"))
## you can store seomthing as a different type using as.
test=c(1,0,1,1,0)
as.logical(test)
                
#Recyling - vectors of different lengths work the same in R as in linear algabra. Similar but not the same as lin alg.
a <- c(1,4)
b <- c(2,3)
a + b
c=c(3,4,5,6,7)
a+c   ## you usually don't want to do thi


###########Numberic Vectors#############
numlist=2:15
numlist2=10:1
# or another way to make a sequence of numbers
numlist3= seq(2,15)
## we can add step size and legth(in this case they both make the same thing)
numlist4=seq(2,20, by=3,)
numlist5=seq(2,20, length.out = 7)
## we can make vectors repeat a numerica sequence
i=rep(2,4)
x=c(1,3,5,6)
y=rep(x,2)
print(y)
z=rep(x,i)

### many different ways to generate a randome muber, always starts with r
#runif(n, min=0, max=1) Uniform
#rnorm(n, mean=0, sd=1) Normal
#rbinom(n, size, prob) Binomial
#rpois(n, lambda) Poisson
#rexp(n, rate = 1) Exponential
#rt(n, df) T
#rf(n, df1, df2) F
#rchisq(n, df) Chi square



##### Logical vectors
## common operators <, <=, >, >=, == (exact equality), and != (exact inequality)
a <- c(seq(2, 4), NA)
b1<- a!=2

## looking for na
q<- c(2,5,7,4,7,NA,4)
is.na(q)
#### DO NOT DO q== NA, not the same thing
q==NA  #just makes a list of NA the same length as q

### if doing math with logicals, it becomes 1 and 0 (T and F)
### below is an examples of how to use logical
g <- c(seq(1,6, by=0.5), 10)
h<- sum(g<9)
print(h)
### any and all function
Test1<- any(h==10)
Test2<- any(g==10)
print(Test1)
print(Test2)
###



### == and indentical() function
identical (3, c(3,4))
3 == c(3,4)


## the which function
h<- c(1,10,3.5,8,8)
h1<-h>5  ## this just gives a true/false
h2 <- h == 8
z1<- which(h>5) ## this shows which indexs
z2<-which(h2)
##
h1&h2  ## this is their "overlap" or intersection, False if each index is not the same and true/false if they match
h1 | h2 ## this is a union, easier to understand looking at indexes
h1 & !h2


##### factors
### there is a factor class to store categorical data, w/out the "". a level is each unique elelment of the factor
countyVector <- c("la", "sb", "la", "oc", "oc", "sb")
county<- factor(countyVector)
reverse_county <- as.character(county)
### you can index as well
small_county<- county[1:3] ## even tho if you print small_county you won't see it, the levels (like oc) are ALL still there
### see the below if you want to completely get ride of the levels you don't want
county1<- factor(county[1:3])
county2<- county[1:3, drop =T]  ## drop = T is how this would be written everywhere for some reason

c(county, factor("sd"))   #### if you try to combine a factor this way, you get a 1 for any new "sd" or anthing else and will convert to integer
#### numeric factors

numFactor<- factor(seq(1,10, by = 2))   ### you can actually factor the sequence by 2
NermFactor<-as.numeric(numFactor) ### then you can make it numeric (and get ride of the levels)

levcounty<-factor(countyVector, levels = c("oa"))

                   
### Matrices and Arrays ###

dim(mydata)<- c(2,3)  #this makes something a matrix
mydata1<- matrix(mydata, nrow = 2, ncol = 3) #or this. Note that it goes downward via columns by default
mydata2<- matrix(mydata, 2, 3, byrow=TRUE)

#t(mydata)  # use this to transpose data

#Combining Matrices
newdata1 <- matrix(1:4, 2)
newdata2 <- matrix(5:10, 2)
cbind(mydata, newdata1)  ##combine by columns
rbind(mydata, newdata2)   ##combine by rows

#Matric atributes

##once mydata is a mtrix, names attributes is gone (sort of) it generalzie to rownames and rowcolumns
rownames(mydata)<- c("r1","r2")
colnames(mydata)<- c("c1","c2", "c3")
## or use this
dimnames(mydata1) <- list(c("r1", "r2"), c("cl", "c2", "c3"))
#can find the lenth of a matrix
length(mydata)
nrow(mydata)
ncol(mydata)
## can still use the atributes function as well
attributes(mydata)

#Acessing indexes of the matrix
##use the (row,column) formate with (row, " ") and (" ", column) to get entire row/column
mydata2
mydata2[2,3]
mydata2[2,]
mydata2[,2]
#


### Array ###

x <- 1:12
dim(x) <- c(2,2,3) # this makes  a 2 by 2 matrix, 3 times
dimnames(x) <- list(c("r1", "r2"), c("cl", "c2"), c("pl", "p2", "p3"))   # this names the 3 matrixes
## there is a quicker way to do this
x<- array(1:12, c(2,2,3))


### NULL###
##true nothingness, no type or modification ability, cannot give NULL atributes
c() #is a way to make NULL
is.null(c())

### LISTS ####
## a list can contain multiple R objects with different storage modes
student <- list(name = "John", year = 2, classTaken = c("PM510", "PM511A", "PM511B"), GPA = 3.85)
attributes(student) ## the "pieces" of a list are attributes
names(student)
nestedList <- list(c1 = 1, letters, list(c1 = 2,c2 = LETTERS))  ##lists within a list
unlist(student) # make not a list anymore

student.vec <- c(name = "John", year = 2, classTaken = c("PM510", "PM511A", "PM511B"), GPA = 3.85)
student.list<-as.list(student.vec)
str(student.list) ## best way to display a list with a large number of elements is with str()
list() # list with length of 0
#indexing in lists##
student[[3]]
student[["classTaken"]]  ## can use names

student
student[[3]][2] ##each index of the list is a vector, so subindexing
student$classTaken[2] ## this only works if there are names in the list
names(student) <- letters[1:4] # can rename

student[3:4] # this return the entire vectors for index 3 and index 4
###Thus, student[3] is a list with one component, but student[[3]] extracts or replaces that component only   ## Look for this in the lecture

### combinging lists ###

list1 <- c(list(letters[1:3], 2:4), list(c(1,3.5)))
str(list1)
list2 <- c(list(letters[1:3], 2:4), c(1, 3.5))  
list3 <- c(list(letters[1:3], 2:4), as.list(c(1, 3.5)))  ##this and list2 both make one long list (no, "lists within the list")
list4<- list(list(letters[1:3], 2:4), c(1, 3.5)) ## using the list(), this makes a list within the list

## using NULL in a list ##

student1 <- student2 <- student3 <- list(name = "John", year = 2, classTaken = c("PM510", "PM511A", "PM511B"), GPA = 3.85)
student1["year"] <- NULL
student2[["year"]] <- NULL ## both of these make the "year" component go away

student3["year"] <- list(NULL)  ##this make year equal to NULL



### Data Frames ###
sex <- c("M", "F", "F", "M", "M")
height <- c(65, 63, 60, 62, 57)
weight <- c(150, 140, 135, 165, 175)
liveOnCampus <- c(TRUE, TRUE, FALSE, FALSE, FALSE)
d <- data.frame(sex, height, weight, liveOnCampus)
##note that usually this will be something we import, not something we creare in the code itself
##note that the "sex" elements are not in "", everything is converted to a factor

### making things into Data Frames
as.data.frame(list1)
#To coerce an object to a data frame, use the as.data.frame() function
#A vector will become a one-column data frame
#A matrix will become a data frame with the same dimension
#A list will become a data frame if its components have the same length

data.frame() ## 0 by 0 data frame

## data from atributes ##

typeof(d) #its a list with equal length vectors
colnames(d)
rownames(d) #how to get names of columns and rows. Note that they are the character type

id<- c(2345, 1236, 2986, 6543, 6544)
rownames(d)<- id
d

## the number of columns is the lenth() of a data frame
length(d)

###indexing###

d[1:3, c(1,3,4)] ## same as a matrix (rows, columns)
d$height[1:3]  ## this gets us a specific vector of goods (column name [rows])

###combining###
d2 <- data.frame(midterm=c(80, NA, 90, 40, 95), final=c(88, 100, 94, 88, 99))
rownames(d2) <- c("John", "Helen", "Mary", "Joe", "Art")
cbind(d, d2)
#note: number of rows MUST be the same
#note: rows do NOT need to be the same names, will take the names of the first data frame

d3 <- data.frame(sex=c("M", "F"), height=c(63, 60), weight=c(160, 146),liveOnCampus=c(FALSE, FALSE))
rbind(d, d3)
#note: number of columns MUST be the same
#note: the names of the column MUST be the same

###Reading and Writing Data Frame### go to min 10 of ch2 part2 for a go walk through of this

#read.table() used to pull data from a file and make a data frame


#setwd("C:/Users/Arthur/Documents/UCSD_courses/IntroductionToR_072417/Reader/chapter2")
#example1 = read.table(file="example1.txt", header= T, na.strings = ".")
#head(example1)
# header =T since variable names are in the file
# na.strigns="." which is the missing values 
##### there are other inputs that may be used. 

#everything comes in as a factor
#use stringAsFactors to prevent this
#example1 = read.table(file="example1.txt", header= T, na.strings = ".", stringsAsFactors = F)

###pulling excel ###
#read.elsx()

###

#write.table() # used to write a data fram/matrix


sex <- c("M", "F", "F", "M", "M")

height <- c(65, 63, 60, 62, 57)

weight <- c(150, 140, 135, 165, 175)

liveOnCampus <- c(TRUE, TRUE, FALSE, FALSE, FALSE)

d <- data.frame(as.character(sex), height, weight, liveOnCampus)
d
d[,c(2,3)]

d[1,c(2,3)]

d$var5=1:5
d


