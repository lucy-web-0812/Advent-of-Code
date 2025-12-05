# -*- coding: utf-8 -*-
"""
Created on Tue Dec  2 10:06:40 2025
Advent of Code 2025
@author: webst
"""


# Part 1

import pandas as pd
import numpy as np


file_path = "G:/My Drive/Advent-of-Code/2025/inputs/day_1_input.txt"

# The dial starts pointing at 50! 
start = 50 

df = pd.read_csv(file_path, header=None, names=["value"])

df = df.assign(direction = df.value.str[0], 
               magnitude = df.value.str[1:].astype(int)) 

 
df = df.assign(direction_num = np.where(df.direction == "L", -1, 1).astype(int))


df = df.assign(combined_num = df.magnitude * df.direction_num)

df = df.assign(running_total = df.combined_num.cumsum())


df = df.assign(modular_total = (start + df.running_total) % 100) # dont forget to add the start 


password = df.modular_total.eq(0).sum()


# Part 2

# So we already have how many times it lands on zero but now we want how many times it passes thorugh 0.... 

# And a more 'python' way of doing things.....

with open(file_path, "r") as file:
    lines = file.readlines()

rotations = [(rot[0], int(rot[1:])) for rot in lines]

zeros = 0 # Counter for the zeros
dial = 50 # Start the dial at 0

for rot in rotations:
    dial_clicks, rotation = divmod(rot[1], 100) # takes the second element of the rot list (e.g. the number part), gives the quotient and the remainder
    # The quotient is stored as dial clicks, where we are up to is stored as rotation
    zeros += dial_clicks # Add the number of dial clicks to 0

    if rot[0] == "R":
        if dial + rotation >= 100:
            zeros += 1
        dial = (dial + rotation) % 100
    else: 
        if dial and dial - rotation <= 0:
            zeros += 1
        dial = (dial - rotation) % 100

print(zeros)
















