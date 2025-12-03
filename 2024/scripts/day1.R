library(tidyverse)

raw_data <- read_table("day_1_input.txt", col_names = FALSE) |> 
  order(X1)


a <- raw_data$X1 |> 
  sort()


b <- raw_data$X2 |> 
  sort()


ordered_df <- data.frame(a,b)


difference_calculated <- ordered_df |> 
  mutate(diff = b - a) |> 
  mutate(absolute_diff = abs(diff))

difference_calculated |> 
  summarise(total_difference = sum(absolute_diff))


# Secondary part on the similarity score..... 


counted_occurences <- ordered_df |> 
  group_by(b) |> 
  summarise(frequency = n()) |> 
  rename(number = "b")


similarity_score_df <- ordered_df |> 
  select(a) |>
  left_join(counted_occurences, by = join_by("a" == "number")) |> 
  mutate(running_similarity = a * frequency) |> 
  summarise(total_similarity = sum(running_similarity, na.rm = T))
  