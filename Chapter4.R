### Chapter 4 ###


### R FUNCTION ### 


plot(height, weight)


## the real joy is writing your own function ##

#fname <- function (arg1 <, arg2, ...>) 

# ◦ fname is the name of the function
# ◦ function is a keyword
# ◦ arg1, arg2, etc are the formal arguments to be satisfied on the call
# ◦ function.body, defines the body of the function that can be any R statement, which is usually a group of statements and enclosed within brackets

set.seed(91786)
vec1 <- rnorm(100)
sum(abs(vec1-mean(vec1))>2*sd(vec1))

set.seed(12345)
vec2 <- rnorm(100, 2, 4)
sum(abs(vec2-mean(vec2))>2*sd(vec2))

extreme <- function (vec){
  extreme_n<- sum(abs(vec-mean(vec))>2*sd(vec))
  extreme_n
  #return(extreme_n)  ## here not required (but not a problem to include) return is used to end the function 
}
extreme(vec1)
typeof(extreme(vec1))

#note that anything can take the place of vec
#return: by default a list. Can make this a vector if all returns are the same data type # you will makes a list, vector etc. because you often want to return multiple elements
extreme1 <- function (vec){
  extreme_n <- sum(abs(vec-mean(vec))>2*sd(vec))
  list(extreme_num=extreme_n, average=mean(vec), SD=sd(vec))
}
extreme1(vec1)



extreme2 <- function (vec){
  extreme_n <- sum(abs(vec-mean(vec))>2*sd(vec))
  c(extreme_num = extreme_n, average=mean(vec), SD=sd(vec)) 
}
extreme2(vec1)
#return: usually you will make a list (extreme1) but you can make a vector if you have all of the same data type (this is less common, usually should use a list)



extreme3 <- function (vec){
  extreme_n <- sum(abs(vec-mean(vec))>2*sd(vec))
  structure(extreme_n, average=mean(vec), SD=sd(vec))
}
extreme3((vec1))
#using strucution makes the output a list? that is a bit more user friendly 


##### CONDITIONAL STATEMENTS ####



x <- rnorm(10) #random normal distribution of 10 numbers
x

test1<-function(y){
  result<-if (mean(y) > median(y)) print ("Mean > Median") else print ("Mean <= Median")
}

test1(x)
## Some rules
#if can be extended over more than one line, use the {} to inclose
#When the if statement is not in a block and if the else statement is present, the else statement must appear on the same line as the if statement
#When the if statement is in a block and if the else statement is present, the else statement must appear on the same line after the closing braces }
#If the if statement is enclosed in a function, the else statement can be placed in a new line
#When there are multiple cases to choose from, we can use the if and else if structures

#Since if/else statements are the same as other statements, you can assign the value of them to a variable. For example, the following two statements are equivalent
if (any (x <= 0)) y <- log(10 + x) else y = log(x)
y <- if (any (x <= 0)) log(10 + x) else log(x) # I like this way :-)



#### the difference between &, | and &&, || ####



# & and && indicate logical AND, while | and || indicate logical OR
#& and | perform element-wise comparisons, while && and || do not
#&& and || evaluate left to right examining only the first element of each vector
#With &&, the right-hand expression is only evaluated if the left-hand one is true, and with || , only if it is false
# Note: & and && are often interchangable 
a <- 3
b <- 3
a == 3 & b == 3
a == 3 && b == 3
#but not always
x <- c(T, T, T)
y <- c(T, F, T)
x & y
x&&y ## this only looks at the first element
y <- matrix(1:2, 1)
nrow(y) > 1 && y[2,1] ==2 ## think about why this doesn't fail, the code never reaches the second erronous code




sqrtAndLog <- function(x){
  if (is.numeric(x) && min(x) > 0){
    xSqrt <- sqrt(x)
    xLog <- log(x)
    } else stop ("x must be numeric and all components positive")  ## else stop means stop this loop
  return (list(xSqrt, xLog))
}
sqrtAndLog(c(-2,4,3))


central <- function (y, measure){
  if (measure == "mean") return (mean(y))
  else if (measure == "harmonic") return (1/mean(1/y))
  else if (measure == "median") return (median(y))
  else stop ("Your measure is not supported")
  }
z = rnorm(10, mean=2, sd=3)
central (z, "mean")



### LOOPING ###


# three statements for making loops (for, while and repeat)
# two statements to break a loop (break, next)
  #break causes an exit from the inner most loop
  #next makes go back to the top of the loop and go to the next element if there is one

# for #

ss <- 0
total <- 0
for (i in c(20,30,25,40)){
  total <- total + i
  ss <- ss + i^2
  }
total


# while # 
x <- 0
test <- 1
while (test >0){
  x <- x + 1
  print (x^2)
  test <- (x<6)
}

# repeate #

x <- 0
repeat{
  x <- x + 1
  print (x^2)
  if (x == 6) break
}

testfunct<-function(input){
  fin<- c()
  for (inp in input){
    inp<- inp +1
    fin2<- c(fin,inp)
  return(fin2)
  }
}
a<-c(2,3,5,6)
testfunct(a)


## see if you can get this to work during the lecture :-)
load("datList.RData")

stackDataInList = function(alist){
  result = data.frame()
  for (i in 1:length(alist)){
    result = rbind(result, alist[[i]])
    }
return(result)
}
stackDataInList(datList[1])


fun01 <- function(dat){
  result <- c()
  for (i in 1:length(dat)){
    result[i] <- dat[i] + 1
  }
  return(result)
}
fun01(a)


c(F, F, F) || c(T, F, T)


