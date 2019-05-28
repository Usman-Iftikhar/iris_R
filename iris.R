v# IRIS DATASET

#call package readr
library("readr")

#setup working directly
getwd()
setwd("C:/Users/muift/Documents/R_Projects/iris")

#load dataset iris
irisDataset <- read.csv("iris.csv")

#check attributes
attributes(irisDataset)

#summary of dataset
summary(irisDataset)

#check struture of data
str(irisDataset)

#check names of attributes
names(irisDataset)

#histrogram of species
hist(irisDataset$Species)

#plot sepal length
plot(irisDataset$Sepal.Length)

#normal quantile plots
qqnorm(irisDataset)

#change species to numerica
irisDataset$Species <- as.numeric(irisDataset$Species)

#set seed 123
set.seed(123)

#train size & test size
trainSize <- round(nrow(irisDataset)*0.8)
testSize <- nrow(irisDataset) - trainSize

#check train size and test size
trainSize
testSize

#create training and test set
training_indices <- sample(seq_len(nrow(irisDataset)), size = trainSize)
trainSet <- irisDataset[training_indices,]
testSet <- irisDataset[-training_indices,]

#use a different set seet 405
set.seed(123)

#create training and test sets again
trainSet <- irisDataset[training_indices,]
testSet <- irisDataset[-training_indices,]

#create linear model
LinearModel <- lm(Petal.Length ~ Petal.Width, trainSet)

#check summary of linear model
summary(LinearModel)

#create pridicdtion
prediction <- predict(LinearModel, testSet)

#check prediction
prediction

plot(prediction, xlab = "instance", ylab = "Petal Length", main = "Prediction of Petal Length Based on Petal Width")
