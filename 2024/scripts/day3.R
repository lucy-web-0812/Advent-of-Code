# Day 3 
library(tidyverse)

raw_text <- read_file("day_3_input.txt")

patterns_to_find <- c( "mul\\(\\d+,\\d+\\)")

correct_formats <- str_extract_all(raw_text, pattern ="mul\\(\\d+,\\d+\\)") 

numbers_only <- str_extract_all(correct_formats, pattern = "\\d+,\\d+") |> 
  unlist()

vector_of_numbers <- str_split(numbers_only, ",") |> 
  unlist() |>
  as.numeric()

col_1 <- vector_of_numbers[seq(1, length(vector_of_numbers), by = 2)]


col_2 <- vector_of_numbers[seq(2, length(vector_of_numbers), by = 2)]


data.frame(col_1, col_2) |> 
  mutate(product = col_1 * col_2) |> 
  summarise(total_product = sum(product))



# And Part 2 where we need to work out where there are do and don't and only multiple the values that are after this....


patterns_to_find_part2 <- c( "do\\(\\)", "don't\\(\\)")


pattern_locater <- function(pattern) {
  
  locations <- str_locate_all(raw_text, pattern)[[1]]
  
  data.frame(pattern = pattern, 
             start = locations[, "start"], 
             end = locations[, "end"])
}

location_of_does_and_donts <- lapply(patterns_to_find_part2, pattern_locater) 

# Combine all matches into a single data frame
location_of_does_and_donts_df <- do.call(rbind, location_of_does_and_donts) 
  

characters <- strsplit(raw_text, split = "")[[1]]

position_of_characters_in_string <- data.frame(position = 1:length(characters), character = characters)


location_of_does_and_donts_df_with_flags <- position_of_characters_in_string |> 
  left_join(location_of_does_and_donts_df, join_by("position" == "start")) |> 
  fill(pattern, .direction = "down") |> 
  fill(end, .direction = "down") |> 
  mutate(pattern = ifelse(is.na(end) == T,  "do\\(\\)", pattern)) |> 
  filter(pattern != "don't\\(\\)")
  


# Extract from the original string by the start and end positions..... 
do_statments <- paste(location_of_does_and_donts_df_with_flags$character, collapse = "")


correct_formats_part_2 <- str_extract_all(do_statments, pattern ="mul\\(\\d+,\\d+\\)")

# And then repeating the same code from above....
numbers_only_part2 <- str_extract_all(correct_formats_part_2, pattern = "\\d+,\\d+") |>
  unlist()

vector_of_numbers_part2 <- str_split(numbers_only_part2, ",") |>
  unlist() |>
  as.numeric()

col_1_part2 <- vector_of_numbers_part2[seq(1, length(vector_of_numbers_part2), by = 2)]


col_2_part2 <- vector_of_numbers_part2[seq(2, length(vector_of_numbers_part2), by = 2)]


data.frame(col_1_part2, col_2_part2) |>
  mutate(product = col_1_part2 * col_2_part2) |>
  summarise(total_product = sum(product, na.rm = T))
