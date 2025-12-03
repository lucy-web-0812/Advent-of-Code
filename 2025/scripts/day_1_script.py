# -*- coding: utf-8 -*-
"""
Created on Tue Dec  2 10:06:40 2025
Advent of Code 2025
@author: webst
"""
import pandas as pd
import numpy as np


file_path = "G:/My Drive/Advent of Code/2025/day_1_input.txt"



df = pd.read_csv(file_path, header=None, names=["value"])

df = df.assign(direction = df.value.str[0], 
               magnitude = df.value.str[1:].astype(float)) 

 
df = df.assign(direction_num = np.where(df.direction == "L", -1, 1).astype(int))


df = df.assign(combined_num = df.magnitude * df.direction_num)

df = df.assign(running_total = df.combined_num.cumsum())


df = df.assign(running_total_high_check = np.where(df.running_total , df.running_total - 100, df.running_total))

df = df.assign(running_total_low_check = np.where(df.running_total < 0, df.running_total + 100, df.running_total))


for i in range(1, len(df)):
    df.totals = df.assign(df.combined_num([i] + [i+1]))
    print(df.combined_num[i])


