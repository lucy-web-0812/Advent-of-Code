# Day 4! 

library(tidyverse)


raw_data <- readLines("day_4_input.txt")


word_search <- matrix(nrow = length(raw_data), ncol = nchar(raw_data[1]))


for (i in 1:length(raw_data)) { 
  # now unlist each row of the input into a row in the word search 
  
  word_search[i,] <- unlist(str_split(raw_data[i], pattern = ""))
  
}


xmas_count <- 0 

# For the simple case where the letters are all in one row.... 

for (i in 1:(nrow(word_search) - 3)){
  
  for(j in 1:ncol(word_search)){
    
    if (word_search[i,j] == "X"  & 
        word_search[i+1, j] == "M" & 
        word_search[i+2, j] == "A" & 
        word_search[i+3, j] == "S") {
      
      xmas_count <- xmas_count + 1
      
    }
     
  }

}


# Or all backwards.... 

for (i in 4:(nrow(word_search))){
  
  for(j in 1:ncol(word_search)){
    
    if (word_search[i,j] == "X"  & 
        word_search[i-1, j] == "M" & 
        word_search[i-2, j] == "A" & 
        word_search[i-3, j] == "S") {
      
      xmas_count <- xmas_count + 1
      
    }
    
  }
  
}




# And where all in one line going down.... 

for (i in 1:(nrow(word_search))){
  
  for(j in 1:(ncol(word_search) - 3)) {
    
    if (word_search[i,j] == "X"  & 
        word_search[i, j+1] == "M" & 
        word_search[i, j+2] == "A" & 
        word_search[i, j+3] == "S") {
      
      xmas_count <- xmas_count + 1
      
    }
    
  }
  
}


# And where all in one line going up.... 

for (i in 1:(nrow(word_search))){
  
  for(j in 4:(ncol(word_search))) {
    
    if (word_search[i,j] == "X"  & 
        word_search[i, j-1] == "M" & 
        word_search[i, j-2] == "A" & 
        word_search[i, j-3] == "S") {
      
      xmas_count <- xmas_count + 1
      
    }
    
  }
  
}


# and now the tricky diagonals...........
 # diagonal down to the right

for (i in 1:(nrow(word_search) - 3 )){
  
  for(j in 1:(ncol(word_search) - 3 )) {
    
    if (word_search[i,j] == "X"  & 
        word_search[i+1, j+1] == "M" & 
        word_search[i+2, j+2] == "A" & 
        word_search[i+3, j+3] == "S") {
      
      xmas_count <- xmas_count + 1
      
    }
    
  }
  
}


# and now the tricky diagonals...........
# diagonal down to left



for (i in 4:(nrow(word_search))){
  
  for(j in 1:(ncol(word_search) - 3 )) {
    
    if (word_search[i,j] == "X"  & 
        word_search[i-1, j+1] == "M" & 
        word_search[i-2, j+2] == "A" & 
        word_search[i-3, j+3] == "S") {
      
       xmas_count <- xmas_count + 1
      
    }
    
  }
  
}


# diagonal up to the right



for (i in 1:(nrow(word_search) - 3)){
  
  for(j in  4:(ncol(word_search))) {
    
    if (word_search[i,j] == "X"  & 
        word_search[i+1, j-1] == "M" & 
        word_search[i+2, j-2] == "A" & 
        word_search[i+3, j-3] == "S") {
      
      xmas_count <- xmas_count + 1
      
    }
    
  }
  
}


# diagonal up to the left



for (i in 4:(nrow(word_search))){
  
  for(j in  4:(ncol(word_search))) {
    
    if (word_search[i,j] == "X"  & 
        word_search[i-1, j-1] == "M" & 
        word_search[i-2, j-2] == "A" & 
        word_search[i-3, j-3] == "S") {
      
      xmas_count <- xmas_count + 1
      
    }
    
  }
  
}

print(xmas_count)




# Part 2 --- 
# need to firstly flip the word search.....

library(Thermimage)


word_search <- word_search[, ncol(word_search):1]

# M  M
#  A 
# S  S


mas_count <- 0 

for (i in 2:(nrow(word_search) - 1)){
  
  for(j in  2:(ncol(word_search)- 1)) {
    
    if (word_search[i,j] == "A"  & 
        word_search[i-1, j-1] == "M" & 
        word_search[i-1, j+1] == "M" & 
        word_search[i+1, j-1] == "S" &
        word_search[i+1, j+1] == "S") {
      
      mas_count <- mas_count + 1
      
    }
    
  }
  
}


# M  s
#  A 
# M  S

for (i in 2:(nrow(word_search) - 1)){
  
  for(j in  2:(ncol(word_search)- 1)) {
    
    if (word_search[i,j] == "A"  & 
        word_search[i-1, j-1] == "M" & 
        word_search[i-1, j+1] == "S" & 
        word_search[i+1, j-1] == "M" &
        word_search[i+1, j+1] == "S") {
      
      mas_count <- mas_count + 1
      
    }
    
  }
  
}

# S  s
#  A 
# M  M

for (i in 2:(nrow(word_search) - 1)){
  
  for(j in  2:(ncol(word_search)- 1)) {
    
    if (word_search[i,j] == "A"  & 
        word_search[i-1, j-1] == "S" & 
        word_search[i-1, j+1] == "S" & 
        word_search[i+1, j-1] == "M" &
        word_search[i+1, j+1] == "M") {
      
      mas_count <- mas_count + 1
      
    }
    
  }
  
}

# S  M
#  A 
# S  M

for (i in 2:(nrow(word_search) - 1)){
  
  for(j in  2:(ncol(word_search)- 1)) {
    
    if (word_search[i,j] == "A"  & 
        word_search[i-1, j-1] == "S" & 
        word_search[i-1, j+1] == "M" & 
        word_search[i+1, j-1] == "S" &
        word_search[i+1, j+1] == "M") {
      
      mas_count <- mas_count + 1
      
    }
    
  }
  
}





