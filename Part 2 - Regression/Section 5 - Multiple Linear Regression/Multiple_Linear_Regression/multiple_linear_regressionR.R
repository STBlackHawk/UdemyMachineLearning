#Multiple Linear Regression

#Importing the Dataset 
dataset = read.csv("50_Startups.csv")


#Encoding categorical Data
dataset$State = factor(dataset$State,
                       levels = c('New York', 'California', 'Florida'),
                       labels = c(1,2,3))


#Spliting the Dataset into Training set and Test set
library(caTools)
set.seed(123)
split = sample.split(dataset$Profit, SplitRatio = 0.8)
training_set = subset(dataset, split==TRUE)
test_set = subset(dataset, split==FALSE)


# Fitting multiple Linear Regression to the Training set
regressor = lm(formula = Profit ~ .,
               data = training_set)

# Predecting the test set
y_pred = predict(regressor, newdata = test_set)

# Building the optimal model using Backward Elimination
regressor = lm(formula = Profit ~ R.D.Spend + Administration + Marketing.Spend + State,
               data = dataset)

summary(regressor)
