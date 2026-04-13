# -*- coding: utf-8 -*-
"""
Created on Mon Apr 13 14:50:33 2026

@author: Amadu
"""

import pandas as pd


def dataPreprocessing(df):
    """
    This is the description of function
    """
    # 2. Clean Data (The logic is "stuck" here)
    df["temperature"] = df["temperature"].fillna(df["temperature"].mean())
    df["date"] = pd.to_datetime(df["date"])
    return df
