# install.packages("readxl")
library(readxl)
dataset = read_excel('is300_cars.xlsx')
# install.packages("caTools")
library(caTools)
set.seed(123)

# Split dataset 
split = sample.split(dataset$Cost, SplitRatio = 2/3)

# Training set from split items that are TRUE
training_set = subset(dataset, split == TRUE)

# Test set from split items that are FALSE
test_set = subset(dataset, split == FALSE)

# Train the model. Formula is Cost depends on all other features
regressor = lm(formula = Cost ~ ., data = training_set)


summary(regressor)

# Predict 
# y_pred = predict(regressor, newdata = tes)