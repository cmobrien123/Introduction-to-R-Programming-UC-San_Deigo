## Colin OBrien Practice Exercise 3


#list1

list1 = list(A = 1:10, B = LETTERS[1:4], C = list(C1 = matrix(1:4, nrow=2), C2 = pi))
str(list1)

#acess components

list1[c(1,3)]

#acess a matrix

list1$C[[1]]

#names and components 

length(list1[[3]])
names(list1[[3]])

#list2

list2 = list(D = 10:1, E = factor(c("M", "M", "F", "F")))

# list3

list3 = c(list1, list2)
str(list3)

## data frames

#dat1

#Name<- c("Alfred", "Barabar", "John", "Kerry")
#Sex<-c("M", "F", "M", "F")
#Age<- c(23,35,25,19)
#Height<-c(72, 61, NA, 66)
#Smoke<-c(T,T,F,F)
#dat1<- data.frame(Name, Sex, Age, Height, Smoke)

dat1 <- data.frame(name=c("Alfred", "Barbara", "John", "Kerry"), sex=c("M", "F", "M", "F"), age=c(23, 35, 25, 19), height=c(72, 61, NA, 66), weight=c(160.3, 125.4, 175, 130.2), smoke=c(T, T, F, F))
dat1


#dat2

dat2<- data.frame(smoke_ind = as.integer(dat1$smoke), BMI = 100*dat1$weight /dat1$height ^2 )
dat2

##dat3

dat3 <- cbind(dat1, dat2)
dat3

#dat4

dat4 <- dat3[2:8]
rownames(dat4) <- dat3$name
dat4

#making a file 
#Store this file in your currrent working directory and name it as dat4.txt.
#Make sure to remove the quotations for character values.
#Separate each column by tabs.
#Do not include the row names in the output file.
#Use one single space to represent missing values in the output file.

write.table(dat4, file="dat4.txt", sep="\t", quote=F, row.names=F, na=" ")



##


