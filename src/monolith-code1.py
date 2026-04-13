# -*- coding: utf-8 -*-
"""
Created on Mon Apr 13 14:45:58 2026

@author: Amadu
"""

from modularlib1 import dataPreprocessing

import matplotlib.pyplot as plt

# climate_analysis.py
import pandas as pd

# 1. Load Data
df = pd.read_csv("raw_data.csv")
df = dataPreprocessing(df   )

# 3. Plot
plt.plot(df["date"], df["temperature"])
plt.show()
