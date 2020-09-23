#Colin OBrien Practice Exercise 2


##names
foo1<- c(1,pi,10)
names(foo1)<-c("e1","e2","e3")

foo1<-c("e1"=1, "e2"= pi, "e3"= 10)

foo1<-  setNames(c(1,pi,10), c("e1", "e2", "e3"))

##accessing
foo1[c(1,3)]
foo1[c("e1", "e3")]

##make character vector
foo2<-names(foo1)


## foo3

foo3<- rep(foo2,4)
names(foo3)<-month.abb
attr(foo3, "new_attr")="foo3 is created from foo2"


#foo4
foo4<- attributes(foo3)
typeof(foo4)

#foo5
foo5<- seq(2,12, by=2)

#foo6

foo6<-foo3[foo5]
attributes(foo6)

#foo7

foo7<-unname(foo6)


#foo8

foo8<-c(foo1,foo7)
typeof(foo8)


##foo9

foo9<- rnorm(100, 5, 6)
mean(foo9)
sd(foo9)

## example vector

example <- c(seq(1, 10, by=0.5), NA, 0.6)
foo10<-example>2
sum(foo10, na.rm=T)

sum(example>median(example, na.rm=T), na.rm=T)
sum(is.na(example))


##any()

f <- c(3.01, 3.001, 3.0001, 3.00001)
any (f == 3.001)


log_1<- f==3.001
sum_log_1<- sum(log_1)
sum_log_1>0

sum(f==3.001)>0


##all function

sum(f > 3) == length(f)


# comparing using the boolean algabra
bar1 <- c(2, 5, 7, 10, 20)
logical_1<-bar1>5
logical_2<-bar1==10 | bar1==20
num_1=which(logical_1)
num_2=which(logical_2)

logical_1 & logical_2
intersect(num_1, num_2)

logical_1 | logical_2
union(num_1, num_2)

logical_1 & !logical_2
setdiff(num_1, num_2)



## factors

gender_char <- c("M", "F", "F", "M", "F")
gender<- factor(gender_char)
typeof(gender)
class(gender)
nlevels(gender)
levels(gender)
as.character(gender)

## matrixes
vec1 <- 1:6

mat1<- vec1
dim(mat1)<- c(3,2)

matrix(vec1, nrow=3)

nrow(mat1)
ncol(mat1)
dim(mat1)

rownames(mat1)<-letters[1:3]
colnames(mat1)<-c("I", "II")


dimnames(mat1) <-list(letters[1:3], c("I", "II"))

mat2<-t(mat1)
mat3<-mat1[c(1,3),]
mat4<-cbind(mat2,mat3)
mat4[c(2),c(1,3)]



##vec 2

vec2<- rep(c("A","B","C"), 3:5)



array1<-vec2
dim(array1)<- c(3,2,2)

array1 <- array(vec2, c(3,2,2))
