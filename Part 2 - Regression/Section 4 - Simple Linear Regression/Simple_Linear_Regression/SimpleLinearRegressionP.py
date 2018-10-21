# -*- coding: utf-8 -*-
"""
Spyder Editor

This is a temporary script file.
"""
#importing the libraries
import numpy as np
import matplotlib.pyplot as plt
import pandas as pd


#importin the data sets
dataset = pd.read_csv("Salary_Data.csv")
X = dataset.iloc[:,:-1].values
y = dataset.iloc[:,1].values



#Spliting the dataset into test set and training set
from sklearn.cross_validation import train_test_split
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size = 1/3, random_state = 0)


#Fitting Simple Linear Regression to the Training set
from sklearn.linear_model import LinearRegression
regressor = LinearRegression()
regressor.fit(X_train, y_train)

#prediction the test results
y_pred = regressor.predict(X_test)

#Visualizing the Training Set Result 
plt.scatter(X_train, y_train, color = "red")
plt.plot(X_train, regressor.predict(X_train), color = "blue")
plt.title("Salary Vs Experience (Training Set)")
plt.xlable("Years of Experience")
plt.ylabel("Salary")
plt.show()


#Visualuzung the Test Set Result
plt.scatter(X_test, y_test, color = "red")
plt.plot(X_train, regressor.predict(X_train), color = "blue")
plt.ttitle("Salary Vs Experience (Test Set)")
plt.xlabel("Years of Experience")
plt.ylabel("Salary")
plt.show()
