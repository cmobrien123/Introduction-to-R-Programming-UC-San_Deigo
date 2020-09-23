##
## Colin OBrien
## Practice 1
##

score1=c(2, NA, 10, 1)
score2=c(pi, sqrt(10), 6, 8)
##compute the sum of squares
score3=score1^2 + score2^2
##sum, mean and the length of score3
sum(score3, na.rm=T)
mean(score3, na.rm=T)
length(score3)
##storage and class
typeof(score3)
class(score3)
##Standard dev. 
help.search("standard deviation")
## arguments of the sd function
args(sd)
## documentation of sd function
##help.search("documentation")
help(sd)
## standard deviation of score3
sd(score3, na.rm=T)
##all function names with "sum"
apropos("sum")
##make matrix
mat3=matrix(score3, nrow=2)
## store and class
typeof(mat3)
class(mat3)
## is function
is.vector(mat3)
## contains characters
is.character(mat3)
## making a vector
char1= c("A", "A", "B", "B")
## data frame
dat1=data.frame(score3, char1)
## displaing the data frame
str(dat1)
head(dat1, n=2)
tail(dat1, n=2)
## missing values
miss1=is.na(score3)
typeof(miss1)
sum(miss1)
#working directory
getwd()
dir()
#change working directory
setwd("C:/Users/colinobrien/Desktop")
###find all objects created
ls()
##saving file
save.image("Practice1.RData")
##save to foo
save(score3, mat3, file = "foo.RData")
##remove all objects and then reload them in
rm(list=ls())
load("foo.RData")
ls()
load("Practice1.RData")
ls()
#
