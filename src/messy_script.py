# -*- coding: utf-8 -*-
"""
Created on Tue Mar 31 07:46:21 2026

@author: Taufik Sutanto
"""

# Intentionally poorly-formatted code for illustration
import pandas as pd
import numpy as np


def calculate_sum(a, b):
    return a + b


my_list = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15]

for i in my_list:
    print(calculate_sum(i, i + 1))

df = pd.DataFrame({"Col1": np.random.randint(1, 10, 5), "Col2": np.random.random(5)})
