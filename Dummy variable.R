
#Dummy variable creation
library(readr)
install.packages("fastDummies")
library(fastDummies)


animal <-read.csv(file.choose())
str(animal)
attach(animal)

Dummy_animal <-dummy_columns(animal,select_columns = c("Animals","Gender","Homly","Types"),
                             remove_first_dummy = TRUE,remove_most_frequent_dummy = FALSE)


Dummy_animal

#Other approach

library(rlang)
library(caret)

dmy <-dummyVars("~.",data=animal[c(2,3,4)],fullRank = TRUE)
Data_transformed <-data.frame(predict(dmy,newdata = animal[c(2,3,4)]))
finaldata <-cbind(animal[c(1,2,3,4,5)],Data_transformed)



