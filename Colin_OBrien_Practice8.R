### Colin OBrien Practice Exercise 8 ####


id <- c("1M931LA", "0F1472SB", "1M238LA", "1M32La")

## locate the starting position of Consent and ID
bothLoc <- gregexpr("[0-9]+", id)
bothLoc  ## first part is "indexes" of where numberic characters are. Second is length
bothLoc[[1]] ##just the first index of id

## just consent
bothLoc[[1]][1]  ##notice for the first once you need the double
##just ID
bothLoc[[1]][2]

##taking the consent starting point of each
consent_start <- sapply(bothLoc, function(x) x[1])
consent_start
## takign the ID starting point of each
ID_start <- sapply(bothLoc, function(x) x[2])
ID_start

### finding lengths

attributes(bothLoc[[1]])
attributes(bothLoc[[1]])$match.length

## lengths of consent
attributes(bothLoc[[1]])$match.length[1] ##first [[]] is the index you are testing, second [[]] is the subindex which in this case is the first(consent)
##lengths of id
attributes(bothLoc[[1]])$match.length[2]


#pulling the ID and consent for all using an apply function (lapply to get list)
all_length <- lapply(bothLoc, function(x) attributes(x)$match.length) ## notice that you still need the function(x) when using apply functions!!!!
all_length
typeof(all_length)

#just consent from each
consent_length <- sapply(all_length, function(x) x[1])
##just ID for each
id_length <- sapply(all_length, function(x) x[2])

#consent_length <- sapply(bothLoc, function(x) attributes(x)$match.length[1]) ##this would also work

consent_length
id_length


substr(id, consent_start, consent_length) ##once you have made a variable, you can use it similar to a function in substr
substr(id, ID_start, ID_start+id_length-1)  #these are needed since the lengths are > 1
#substr(id, ID_start, +id_length) #this doesn work

##over and over
id
create_consent_id<-function(id_vec){
  bothLoc <- gregexpr("[0-9]+", id_vec) ## make a variable of each numer (since thats the only thing we need)
  consent_start <- sapply(bothLoc, function(x) x[1]) ## starting point of each "consent" variable
  id_start <-sapply(bothLoc, function(x) x[2]) ## starting point of each "ID" variable
  all_length <- lapply(bothLoc, function(x) attributes(x)$match.length) ##list of the length of both variables
  consent_length <- sapply(all_length, function(x) x[1])
  id_length <- sapply(all_length, function(x) x[2])
  consent <- substr(id, consent_start, consent_length)
  id <- substr(id, id_start, id_start+id_length-1) ##these use substr to pull out the starting point and length of each
  r <- data.frame(orig_ID = id_vec, consent = consent, id = id) ##adding to the data frame
  return(r) 
}
create_consent_id (id)


prop_case <- function(x){
  x_split <- strsplit(x, " +") ### set every letter as an index
  result <- sapply(x_split, function(one){ 
    First <- toupper(substr(one, 1, 1))
    Rest <- tolower(substr(one, 2, nchar(one)))
    all = paste0(First, Rest, collapse=" ") #use paste to bring them all together
    return(all)
    })
  return(result)
}

prop_case(c("john doe", "mary jane", "TOM"))


##broken out (much easier to follow :-) )
x <- c("john doe", "mary jane", "TOM")

#break each name into a differnt index of a list, with the spaces seperating into subindexes
x_split <- strsplit(x, " +")
x_split

##just john doe
x_split[[1]]

#now pulling the first letter (or index) of each subindex
substr(x_split[[1]], 1, 1)

#uppercase and lowercase the first letter and rest of each
First_foo<- toupper(substr(x_split[[1]], 1, 1))
First_foo

Rest_foo <- tolower(substr(x_split[[1]], 2, nchar(x_split[[1]])))
Rest_foo

##combine using paste
paste(First_foo, Rest_foo, collapse=" ") 

##finally, repeate for each using sapply:

sapply(x_split, function(one){
  First <- toupper(substr(one, 1, 1))
  Rest <- tolower(substr(one, 2, nchar(one)))
  all = paste0(First, Rest, collapse=" ")
  return(all)
})






