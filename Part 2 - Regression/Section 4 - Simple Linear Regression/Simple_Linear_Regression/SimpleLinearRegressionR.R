#Spliting the data set into training set and test set
library(caTools)
set.seed(123)
split = sample.split(dataset$Salary, SplitRatio = 2/3 )
training_set =subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

#Fitting Simple Linear regression to the training set

regressor = lm(formula = Salary ~ YearsExperience, 
               data = training_set)

#Predicting thet test set results
y_pred = predict(regressor, newdata = test_set)

#Visualizing the Training set
install.packages("ggplot2")
library(ggplot2)

ggplot() +
    geom_point(aes(x = training_set$YearsExperience, y = training_set$Salary),
               colour = 'red') + 
    geom_line(aes(x = training_set$YearsExperience, y = predict(regressor, newdata = training_set)),
                colour = 'blue') +
              ggtitle('Salary Vs Experience (Training Set)') +
              xlab('Years of Experience') +
              ylab('Salary')

#Visualizing the Test set


ggplot()+
  geom_point(aes(x = test_set$YearsExperience, y = test_set$Salary),
             color = "red") +
  geom_line(aes(x = training_set$YearsExperience, y = predict(regressor, newdata = training_set)), 
            color = "blue") +
  ggtitle("Salary Vs Experience (Test Set)") +
  xlab("'Years of Experience") +
  ylab("Salary")
  
