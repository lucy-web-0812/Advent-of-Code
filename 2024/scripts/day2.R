# Day 2

# Need to find the number of reports that are safe.... 
# Levels need to be either all increasing or all decreasing 
# AND two adjacent levels differ by at least one and at most three 

library(tidyverse)

raw_data  <- readLines("day_2_input.txt")

reports <- lapply(str_split(raw_data, " "),as.numeric)

is_safe <- function(report){
  
  d <- diff(report)
  
  if((all(d>=1) && all(d<=3)) || (all(d<=-1)&& all(d>=-3))){
    
    d <- TRUE
    }
  else{
    d <- FALSE
    }
  d
  
  }

sum(sapply(reports,is_safe)) # does the is safe function on all of the reports..... # and adds together the number of correct



# Part 2 

is_maybe_safe <- function(report){
  
  if (is_safe(report)){
    return(TRUE) # So if it is definitely safe return true..
  } 
  else {
    # If not safe, check how many "bad" numbers there are
    d <- diff(report)
    print(report)
    print(d)
    
    # Count the number of not allowed differences....
    
    trend_breaks <- sum(diff(sign(d)) != 0)
    print(trend_breaks)
    
    bad_count <- sum(d < -3 | d > 3 | d == 0)  # counting bad differences
    
    print(bad_count)
    
    
    if (bad_count == 1 & trend_breaks <= 1){ 
      # allowable if 1 AND the sequence is going in one direction... 
      
      return(TRUE)
            }
    else {
    return(FALSE)
  }
  
  }}


is_maybe_safe <- function(report){
  
  
  ### if it is safe, return TRUE
  if(is_safe(report)){
    return(TRUE)
    } # So if it is definitely safe return true..
  
  
  # otherwise, set to false
  
  maybe_safe  <- FALSE
  
  i <- 1 
  
  while(!pd&&i <=  length(report)){ # cycle through removing level one at a time
    
    maybe_safe <- is_safe(report[-i]) # stop as soon as either a level is removed that makes the report safe
    
    i <- i + 1
    
    }
  return(maybe_safe)}


sum(sapply(reports,is_maybe_safe))


