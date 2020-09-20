#### Practice 7 - Colin O'Brien #####


#painters data
library(MASS)
d1 <- painters[painters$Colour>=17 & painters$School=='D',]
d2 <- painters[is.element(row.names(painters), c('Da Udine','Barocci')),]
d3 <- painters[painters$Colour>=17 & painters$School=='D', c('Composition','Drawing')]
d1
d2
d3


##creating data
boundry <- quantile(painters$Composition,seq(0,1,by=1/3))
boundry

Comp_cat <- cut(painters$Composition,boundry,labels=c("I", "II", "III"), include.lowest=T, right=F)
#Comp_cat

Comp_cat2 <- ifelse(painters$Composition < boundry[2], "I", ifelse(painters$Composition < boundry[3], "II", "III"))
#Comp_cat2

identical(Comp_cat, Comp_cat2)
table(Comp_cat, Comp_cat2)

## using the + operator
Comp_ord <- 1 + (painters$Composition >= boundry[2]) + (painters$Composition >= boundry[3])
#Comp_ord
table(Comp_cat, Comp_ord)


## covert vector
convert <- c(A = "One", B = "Two", C = "Three", D = "Four", E = "Five", F = "Six", G = "Seven", H = "Eight")

##School_New coversion
School_new <- convert[as.character(painters$School)]
table(painters$School, School_new)


head(quine)
quine1 <- quine[order(quine$Eth, -quine$Days),]
quine2 <- quine[order(quine$Eth, -xtfrm(quine$Sex), -quine$Days),]
nrow(quine)

#finding data about quine
nrow(unique(quine))
nrow(unique(quine[1:4]))
nrow(unique(quine[c("Eth", "Sex", "Age", "Lrn")]))
nrow(unique(quine[1:2]))
nrow(unique(quine[c("Eth", "Sex")]))


##maximum Days

quine_order <- quine[order(quine$Eth, quine$Sex, -quine$Days),]
dup_vector <- duplicated(quine_order[c("Eth","Sex")])
non_dup_vector <- !dup_vector
quine_order[non_dup_vector, c("Eth","Sex", "Days")]

## solution from PDF to confirm correct (use this to confirm, not way you used before)
sapply(split(quine$Days, list(quine$Eth, quine$Sex)), max)



#Dat

dat <- data.frame(ID = c(rep("A01", 3), rep("A02", 2), "A03", "A04", rep("A05", 2)), visit = c(3:1, 1, 2, 1,1,1,2), score = c(3,8,2,5,8,4,4,4,5))
dat

#one observation for each patient
datSplit <- split(dat, dat$ID)
r <- data.frame()
for (i in 1:length(datSplit)){
  one <- datSplit[[i]]
  index <- which(one$score == max(one$score))
  select <- one[index,]
  r <- rbind(r, select)
  }
r


myTable <- function(dat, varList){
  result <- data.frame()
  for (i in 1:length(varList)){
    tab <- table(dat[[varList[i]]])
    tab.dat <- as.data.frame(tab)
    tab.pct <- as.data.frame(prop.table(tab))
    one.table <- data.frame(
      Varname = c(varList[i], rep(" ", nrow(tab.dat)-1)),
      Levels = tab.dat$Var1,
      count= tab.dat$Freq,
      percent = round(tab.pct$Freq*100, 2)
      )
    result <- rbind(result, one.table)
    }
  return(result)
}

#tests

myTable (quine, c("Eth"))
myTable (quine, c("Eth", "Age"))
myTable (quine, c("Eth", "Age", "Sex"))
myTable (quine, c("Eth", "Age", "Sex", "Lrn"))







