#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Sun Oct 28 13:45:04 2018

@author: blackhawk
"""

import numpy as np
import matplotlib.pyplot as plt
import pandas as pd 


#importing the dataset 
dataset = pd.read_csv("Position_Salaries.csv")
X = dataset.iloc[:,1:2].values
y = dataset.iloc[:,2].values




#Building the RandomForrest Decission Tree Regression 
from sklearn.ensemble import RandomForestRegressor
regressor = RandomForestRegressor(n_estimators = 300)
regressor.fit(X,y)


#Predicting a new result
y_pred = regressor.predict(6.5)



#Visualizing the RandomForrest Decission Tree Regression 
X_grid = np.arange(min(X),max(X), 0.01)
X_grid = X_grid.reshape((len(X_grid),1))
plt.scatter(X,y, color ="Red")
plt.plot(X_grid, regressor.predict(X_grid), color = "Blue")
plt.title("Bluff or Truth(Random Forrest Regression)")
plt.xlabel("Position")
plt.ylabel("Salary")
plt.show