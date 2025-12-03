# Day 5 

library(tidyverse)


raw_data <- readLines("day_5_input.txt")

raw_data_matrix <- raw_data |> 
  rbind() |> 
  t()|> 
  as.matrix()
 

 
# Find all the rules by working out where the gap is 
 
list_of_rules <- lapply(str_split(raw_data[1:(which(raw_data=="") - 1 )], "\\|"),as.numeric)  

list_of_sequences <- lapply(str_split(raw_data[(which(raw_data=="") + 1): length(raw_data)], ","),as.numeric)  


rules_df <- as.data.frame(do.call(rbind, list_of_rules))

colnames(rules_df) <- c("before", "after")

sequences_df <- as.data.frame(do.call(rbind, list_of_sequences)) 



# pass rate counter set to 0 
pass_rate <- 0 


# Go through each sequence, row by row
for (i in 1:nrow(sequences_df)) {
  
  # And then look at each element
  
  for (j in 1:ncol(sequences_df)){
    
    # filter the rules df to see what numbers need to go after
    
    numbers_after <- rules_df |> 
      filter(before == sequences_df[i,j])
    
    
    # Now need a statement to work out IF any of those numbers are present after.... 
    
    if (!any(sequences_df[i, j:ncol(sequences_df)] %in% numbers_after$after)){
      
    passed_sequences <- sequences_df[i,]
      
      
    }  
  
    
  }
}





