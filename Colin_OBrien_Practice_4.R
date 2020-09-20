## Colin O'Brien Practice Exercise 4

a <- c(seq(1,10, by=2), NA, 20)
names(a) <- c(LETTERS[1:6], "A")
a

#select odd positions

a[seq(1,7,by=2)]

# all not na
a[!is.na(a)]

## is less than 10
a[a<10&!is.na(a)]
#or
a[which(a < 10)]


## everything but first and last
a[-c(1,3)]

## C or D
a[c("C", "D")]

##names equal to A or D
a[names(a) %in% c("A","D")]  # note the difference in notation from her and the C&D example
#or 
a[is.element(names(a), c("A","D"))] 

## matrix b
b <- matrix(1:12, nrow=3)
dimnames(b) <- list(c("I","II","III"), letters[1:4])
b

#first and second row and first and third column
b[c(1,2),c(1,3)]

##Select rows with row names equaling to I and III.
b[c("I", "III"),]

#rows with row names equaling to I and III, and all the columns except for the last one.
b[c("I", "III"),-4]

#Select one single column with column names equaling to a. Make sure the result is still a matrix.
b[,"a",drop=F]

#the data frame, quine,
library(MASS)
head(quine)


# the quines

quine1<-quine[,c("Eth", "Days")]
quine1
quine2 <- quine[is.element(quine$Age, c("F0", "F1")),]  ##ask about on discussion board
quine2 
quine3<-quine["Age"]
quine3
quine4<-quine[quine$Days>10,"Age", drop=F]  ## good example of using $ while indexing


## days absent from school 

Days.Age <- lm(Days~Age, data = quine)
Days.Age

typeof(Days.Age)
class(Days.Age)
str(Days.Age)

#names
names(Days.Age)

# coefficients 
Days.Age.Coef <- Days.Age$coefficients
Days.Age.Coef

# type of and class of coeffiecents 
typeof(Days.Age.Coef)
class(Days.Age.Coef)

Days.Age.Coef[c("AgeF1","AgeF2")]


## Anova 

Days.Age.Anova <- anova(Days.Age)
Days.Age.Anova

typeof(Days.Age.Anova)
class(Days.Age.Anova)

Days.Age.Anova[["F value"]][1]

#F.p data frame  #use this method for anming going forward
F.p <- c(F = Days.Age.Anova[["F value"]][1], p = Days.Age.Anova[["Pr(>F)"]][1])
F.p
##
