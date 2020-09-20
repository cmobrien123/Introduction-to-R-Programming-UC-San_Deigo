##### Chapter 5 Notes ####


### Table Function ###


### OVERVIEW ###


a <- c(rep("A", 3), rep("B", 2), rep(NA, 3))
aTable <- table(a, useNA = "ifany")   #### useNA needs to be used with tables, by default na are skiped
aTable2<-table(a)
a
aTable
aTable2
class(aTable)
typeof(aTable)
##indexing##
aTable['A']
aTable['B']
as.data.frame(aTable)


## tables with multiple vectors ##
race <- c(rep("A", 10), rep("W", 6), rep("B", 4))
gender <- c(rep("M", 4), rep("F", 3), rep("M", 6), rep("F", 7))
grade <- c(3, 3, rep(c(1,2,3),6))
table(race, grade, gender)

as.data.frame(table(grade, race, gender)) ## this is all possible combinations of the table()



### addmargins ###


tableRaceGender <- table(gender, race)
addmargins(tableRaceGender) ### by default, just takes the sum of rows/columns
addmargins(tableRaceGender, 2, mean) ##this looks at the mean of the rows, 1 would do columns
addmargins(tableRaceGender, c(1,2), c(mean,sum)) 



### pro.table ###

prop.table(tableRaceGender) ## does a porportion of 1 (basically a %) for each. total adds up to 1 by default
prop.table(tableRaceGender, margin = 1) # rows add up to one
prop.table(tableRaceGender, margin = 2)  ## columns add up to one



### apply function ###

# For a more general operation on successive sections of an array, you can use the apply function,
# which has the following arguments:
#   X: is an array or a matrix (a two-dimensional array)
# MARGIN: is an integer vector that gives the subscripts of the dimension to which the function will
# be applied over. For example, for a matrix, 1 indicates rows, 2 indicates columns, and c(1, 2)
# indicates rows and columns
# FUN: is a function which can be either a built-in or user-defined function that is used to apply
# separately to each section
# ...: any additional arguments needed by the function can be inserted after the function
# The returned value from the apply function is either a vector or a matrix
# # 


x <- matrix(rnorm(12),3)
x
apply(x, 1, min) ##minimum of each column
apply(x, min) ## minumum of each row
apply(x, 2, sd)  ## calc standard deviation 

x1 <- x
x1[1,1] <- NA
apply(x1, 1, sd)
apply(x1, 1, sd, na.rm = TRUE) ## not including this will result in pulling the NA values into the calc by default



### using apply across multiple dimensions ###

dimnames(iris3)
as.data.frame(iris3)
apply (iris3, c(2,3), mean) ## you are using 2,3 since it is the second and third elements of the list dimnames(iris3)
apply (iris3, 2, mean) ##this just looks at element 2 of the list
 


#### lappy and sapply ####



set.seed(1)
aList <- list(a = rnorm(20, 3, 4), b = rnorm(10, 5, 2), c = c(rnorm(15, 2, 1)))
aList
lapply(aList, mean, na.rm = T) 
test=apply(aList, 2, mean)  ## note that this will not work since aList is a list

#sapply function simplifies the result as a vector or an array if possible, 
#while the lapply function will always return a list
lapply(aList, mean, na.rm = T) 
sapply(aList, mean, na.rm = T) 

## SD calc##
#1
mean_sd = function(x) c(MEAN = mean(x, na.rm = T), SD = sd(x, na.rm = T))
lapply(aList, mean_sd)
#2
lapply(aList, function(x) c(MEAN = mean(x, na.rm = T), SD = sd(x, na.rm = T))) # note that this and #1 return the same thing
#3
sapply(aList, function(x) c(MEAN = mean(x, na.rm = T), SD = sd(x, na.rm = T)))




#### tapply ####


library(MASS)
head(quine)
quine

ageTable <- tapply(quine$Days, quine$Age, mean) #the average days for each age
ageTable1 <- tapply(quine$Age, quine$Days, mean) ##note that this won't work, order matters.this tries to take the average age for each days, which doesn't make sense 
ageTable
ageTable1

as.data.frame(as.table(ageTable)) ## have the table calc run but then return a data frame 
ageSexTable <- tapply(quine$Days, list(quine$Age, quine$Sex), mean) # note that a list() is used here instead of a c()
ageSexTable

 
####split function ####



DaysByAge <- split(quine$Days, quine$Age,)  ## this makes a  list for each age 
DaysByAge
ageTableNew <- sapply(DaysByAge, mean)
ageTableNew


ageTable   ## the above method of making a list and then running sapply returns the same thing as the orignial ageTable method. The make a list method is considered simplier


ageTable1New <- sapply(split(quine$Days, quine$Age), function(x) return(c(Mean = mean(x), Median = median(x))))
ageTable1New ## you made a list for each age, then calculated the mean and median for each

ageSexTableNew <- sapply(split(quine$Days, list(quine$Age, quine$Sex)), function(x) return(c(Mean=mean(x), Median=median(x))))
ageSexTableNew  ##you made a matrix for each combination for each sex and age. once you have more than 1 thing you want to clac, have to do the function---return thing
class(ageSexTableNew)


##quiz

