#SVR 

#Imorting the dataset 
dataset = read.csv("Position_Salaries.csv")
dataset = dataset[2:3]

#Fitting the SVR to the dataset
install.packages("e1071", dependencies = TRUE)
library(e1071)
regressor = svm(formula = Salary ~.,
                data = dataset,
                type = "eps-regression")


#Predicting a new result
y_pred = predict(regressor, data.frame(Level = 6.5))



#Visualizing the SVR with higher resolution
install.packages("ggplot2")
library(ggplot2)
x_grid = seq(min(dataset$Level), max(dataset$Level), 0.1)
ggplot()+
  geom_point(aes( x = dataset$Level, y= dataset$Salary),
             color = "red") +
  geom_line(aes(x = x_grid, y = predict(regressor, newdata = data.frame(Level = x_grid))),
            color = "blue") +
  ggtitle("Truth or Bluf (SVR)") +
  xlab("Position level") +
  ylab("Salary")


