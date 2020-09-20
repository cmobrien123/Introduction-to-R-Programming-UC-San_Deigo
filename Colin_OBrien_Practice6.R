#### Colin Obrien practice 6 ####

charvar <- c(rep("A", 3), rep("B", 4), NA, rep("C", 2))
charvar


##replace NA with the most common value
tab<-table(charvar)
replaceValue <- names(tab)[which(tab == max(tab))]  ##found the Max of the table and replaced Na with that value
charvar[is.na(charvar)]<-replaceValue
charvar


##finding variance of mat
set.seed(91765)
mat <- matrix(rnorm(20), 4)
dim(mat)
#using loop
row.var <- numeric(4)
for (i in 1:4){
  row.var[i] <- var(mat[i,])}
row.var
#using Apply
apply(mat, 1,var)


##now with NA
mat[1,1] <- NA
mat
#using loop
row.var <- numeric(4)
for (i in 1:4){
  row.var[i] <- var(mat[i,], na.rm=T)}  
row.var
#using apply
apply(mat, 1,var, na.rm=T)



### chol ###
chol<-read.table("/Users/colinobrien/Desktop/R_Programing/chol.txt")
head(chol)


#mean of everything but sex
apply(chol[2:12], 2, mean, na.rm=T)
#or
apply(chol[,-1], 2, mean, na.rm=T)
#or
sapply(chol[,-1], mean, na.rm=T)


#sex specific mean for age
sexTable <- tapply(chol$age, chol$sex, mean)
sexTable
#or
sapply(split(chol$age, chol$sex), mean)
#or


#chol2
##making a list where each element is either the hi or low from the mean
chol2 <- rep("LOW", nrow(chol))
chol2[chol$chol > mean(chol$chol, na.rm=T)]= "HI"
chol2[is.na(chol$chol)]= NA

tapply(chol$bmi, chol2, sd)
tapply(chol$age, chol2, sd)


tapply(chol$bmi, list(chol$sex, chol2), sd)
#or
sapply(split(chol$bmi, list(chol$sex, chol2)), sd)

#sex_chol2 
sex_chol2 <- table(chol$sex, chol2)
addmargins(sex_chol2, 2, mean)





### 
library(MASS)
cutpt <- quantile(painters$Drawing, seq(0, 1, by=0.2))
cutpt
painters$DrawingCat <- cut(painters$Drawing, cutpt, labels=1:5, include.lowest=T)
table(painters$DrawingCat)

tapply(painters$Drawing, painters$DrawingCat, min)
tapply(painters$Drawing, painters$DrawingCat, max)
#or
tapply(painters$Drawing, painters$DrawingCat, function(x) c(MIN=min(x), MAX=max(x)))
## using sapply
sapply(split(painters$Drawing, painters$DrawingCat), function(x) c(MIN=min(x), MAX=max(x)))


#### Comparing compositions ###
lm(Composition ~ School, data=painters)
result <- apply(painters[,1:4], 2, function(x){lm(x ~ School, data=painters)})
result 
#or
result <- lapply(painters[,1:4], function(x){lm(x ~ School, data=painters)})

result[[1]]
##extracting indiv. parts
r_1.coeff <- result[[1]]$coefficients
#r_1.coeff[2] if you just want schoolB 

sapply(result, function(x) x$coefficients)

