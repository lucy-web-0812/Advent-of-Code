# -*- coding: utf-8 -*-
"""
Created on Wed Dec  3 15:25:35 2025

@author: webst
"""

import pandas as pd
import numpy as np
import re # for splitting with multiple delimiters & regex


file_path = "G:/My Drive/Advent-of-Code/2025/inputs/day_2_input.txt"

         

# ---- Load ranges ----
with open(file_path, "r") as file:
    line = file.read().strip()

ranges = []
for r in line.split(","):
    start, end = map(int, r.split("-"))
    ranges.append((start, end))

invalid_ids = []

# ---- For each range, generate only FULL repeating IDs ----
for start, end in ranges:
    # up to max digit length in this range
    min_len = len(str(start))
    max_len = len(str(end))

    for length in range(min_len, max_len + 1):
        # only even lengths can be full repetitions
        if length % 2 != 0:
            continue
        
        half = length // 2
        lower = 10**(half - 1)
        upper = 10**half - 1

        for first_half in range(lower, upper + 1):
            candidate = int(str(first_half) * 2)
            if start <= candidate <= end:
                invalid_ids.append(candidate)

# ---- Sum up all invalid FULL repeating IDs ----
answer = sum(invalid_ids)
print("Total invalid IDs:", answer)




# Part 2......

invalid_ids_pt_2 = []

# ---- For each range, generate only FULL repeating IDs ----
for start, end in ranges:
    # up to max digit length in this range
    min_len = len(str(start))
    max_len = len(str(end))

    for length in range(min_len, max_len + 1):
 
        half = length // 2
        lower = 10**(half - 1) # First length digit number (e.g. first 3 digit number = 100)
        upper = 10**half - 1   # Last length digit number (e.g.last 3 digit number = 999)

        for first_half in range(lower, upper + 1):
            candidate = int(str(first_half) * 2)
            if start <= candidate <= end:
                invalid_ids_pt_2.append(candidate)

# ---- Sum up all invalid FULL repeating IDs ----
answer = sum(invalid_ids_pt_2)
print("Total invalid IDs part 2:", answer)