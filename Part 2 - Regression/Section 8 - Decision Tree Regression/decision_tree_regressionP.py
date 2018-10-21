#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Sat Oct 20 21:19:50 2018

@author: blackhawk
"""

#Importing the Libraries
import numpy as np
import matplotlib.pyplot as plt
import pandas as pd


#Importing the dataset
dataset = pd.read_csv("Position_Salaries.csv")
X = dataset.iloc[:,1:2].values
y = dataset.iloc[:,2].values 

#Fitting the Decision Tree to the dataset
from sklearn.tree import DecisionTreeRegressor
regressor = DecisionTreeRegressor(random_state=0)
regressor.fit(X,y)


#Predicting the new result
y_pred = regressor.predict(6.5)


#Visualizing the Decision Tree Regression Result(Higher Resolution Results)
X_grid = np.arange(min(X), max(X), 0.01)
X_grid = X_grid.reshape((len(X_grid), 1))
plt.scatter(X, y, color ="Red")
plt.plot(X_grid, regressor.predict(X_grid), color = "Blue")
plt.title("Truth or Bluff(Decision Tree Regression)")
plt.xlable("Position")
plt.ylable("Salary")
plt.show