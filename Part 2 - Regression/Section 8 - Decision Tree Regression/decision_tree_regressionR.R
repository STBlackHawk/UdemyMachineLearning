#Importing the dataset
dataset = read.csv("Position_Salaries.csv")
dataset = dataset[2:3]


#Fitting The Decision Tree Regression to the dataset
regressor = rpart(formula = Salary ~.,
                 data = dataset,
                 control = rpart.control(minsplit = 1))


#Visualizing the Decisio Tree Regression with higher resolution
install.packages("ggplot2")
X_grid = seq(min(dataset$Level), max(dataset$Level), 0.01)
ggplot() + 
  geom_point(aes(x = dataset$Level, y = dataset$Salary),
             color = "Red") +
  geom_line(aes(x = X_grid, y = predict(regressor, newdata = data.frame(Level = X_grid))),
            color = "blue") +
  ggtitle("Truth or Bluf(Decision Tree)") +
  xlab("Postion") +
  ylab("Salary") 

