#### Chapter 7 Character Manupulations ###

##Basics

char1 <- c("This", "is", "Chapter 7")
length(char1)

nchar(char1)  ## this gives you the character length of each string

c1 <- ""
length(c1)
nchar(c1)
## nchar is 0 since the length of the string is 0 while length gives you 1, since the length of the string is 1

c2 <- character(0)
length(c2)
nchar(c2) 
## now they are both 0

####chartr, tolower and toupper functions

x<- ("How are you doing?")
####replacing  charters with new characters
chartr("ado", "uhi", x) ## in x, now a=u, d=h and o=i

toupper (c("AB", "Ab", "ab")) ## makes all uppercase
tolower (c("AB", "Ab", "ab")) ## makes all lowercase


#### paste Function ####

## paste is used to combine a set of arguments 
paste("The p value is: ", 0.001," penis", sep="") ## the sep="" must be at the end for this to work. sep is "Seperator"
paste0("The p value is: "," penis", 0.001)
paste0("The p value is: ", 0.001," penis", sep="")

paste(c("X", "Y"), 1:5, sep=":") ##ususal recylcing rules apply
paste(letters[1:4], collapse = " + ") ## collapse makes it one long string
paste(c("X", "Y"), 1:5, sep="", collapse = " + ") ## both colapse and sep can be used together


##substrings###
###this is used for extracting characters

greetings <- c("hello", "hola", "bonjour", "konnichiwa", "ni-hao", "ciao")
substr(greetings, 3, 5) #takes the 3rd through 5th of each character
substr(greetings, 1:3, 3:5) # takes the 1-3, then 2-4, then 3-5
## substring gets you the same thing
substring(greetings, 3, 5) #takes the 3rd through 5th of each character
substring(greetings, 1:3, 3:5)




##substring is different only with the recyling rules
substr(c("abcde", "bcdef"), c(1,2), 2:4)
substring(c("abcde", "bcdef"), c(1,2), 2:4) ##this gives the length of the longest of the 3 arguments, takes the longest possible argument
substring(c("abcde", "bcdef"), c(1,2)) 

substring(c("abcde", "bcdef", "trew" ,"poiu"), 1:2, 2:4) ##easier to see here. First thing (1:2) is the starting index (2:4) is the ending index



##finding which indexes of something are from a certan letter, in this case "i"
greetJapan<- "konnichiwa"
greetJapanSplit<- substring (greetJapan, 1:nchar(greetJapan), 1:nchar(greetJapan))
greetJapanSplit
loc=which(greetJapanSplit=="i")
loc


foo<-bar<- "abcdef"
substr(foo, 2,4)="AAA"  ##use this to replace the 
foo

#spliting different pieces of a character
strsplit("Programming stuff in R", " ")
strsplit("Programming in R", " ") ## this needs to have 
#This splits every single letter/space
strsplit("Programming stuff in R", "+")
strsplit("Programming stuff in R", "")


phone <- c("323.345.1800", "714.111.2876")
strsplit(phone, ".") ## character by default matches any character, so this doesn't give anything meaning
strsplit(phone, "\\.") ## you need the \\ here, since its a metacharacter
strsplit(phone, ".", fixed=TRUE) ## this also works

## once split, use the apply functions to access 
sapply(strsplit(phone, "\\."), function(x) x[1])


### searching for a pattern 

##finding everything that has a set of characters in a location
dir()
grep("\\.txt$", dir()) ##find indexes of everything in dir() that ends in .text
grep("\\.txt$", dir(), value=T) ##returns the actual values
grepl("\\.tex$", dir()) ## same things but as a logical



id <- c("1M931LA", "0F1472SB", "1M238LA", "1M32La")
id


###review this in the lecture, If you need these for the assingment, go to the PDF

consentLoc <- regexpr("1|0", id)
consentLoc


#search and replace
sub("1|0", "", id) ##substute the ID (first character) with "", so get ride of it 
id <- c("1M931LA", "0F1472SB", "1M238LA", "1M32La")



paste("Y", paste("X", 1:5, collapse=" + "), sep=" ~ ")



bar <- c("abc.tex", "xyzdoc")


paste("Y", paste0("X", 1:5, collapse=" + "), sep=" ~ ")
