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
  mutate(cumulative_total = cumulative_total %% 100) 



zeros <- df |> 
  filter(cumulative_total == 0 ) |> 
  summarise(zero_count = n())


unique(zeros)
