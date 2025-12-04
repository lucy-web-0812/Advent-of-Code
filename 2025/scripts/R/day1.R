# Day 1 - Advent of code!!! 

library(tidyverse)


file_path <- "2025/inputs/day_1_input.txt"



input_raw <- read.table(file_path, col.names = "turn")


start = 50


df <- input_raw |> 
  mutate(direction = substr(turn,1,1), 
         direction_num = ifelse(direction == "L", -1, 1), 
         number = as.numeric(substr(turn,2,length(turn))) * direction_num) |> 
  mutate(cumulative_total = start + cumsum(number)) |> 
  mutate(cumulative_total_mod = cumulative_total %% 100) 



zeros <- df |> 
  filter(cumulative_total_mod == 0 ) |> 
  summarise(zero_count = n())


unique(zeros)



# Part 2....


df <- df |> 
  mutate(
    prev_total = lag(cumulative_total, default = start),
    prev_clicks = prev_total %/% 100,
    current_clicks = cumulative_total %/% 100,
    passes_zero = abs(current_clicks - prev_clicks)
  ) 


sum(df$passes_zero) # 
