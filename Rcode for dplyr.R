data<-read.csv("per.csv",header = TRUE)
View(data)
str(data)

library(dplyr)

#the function of select
select(data, Zmyr)
select(data, Zmyr, Zcyr,gender)
select(data, 1:3)
select(data, starts_with("Z"))

#the functionn of filter
filter(data, Zmyr > 1)
filter(data, Zmyr > 1, gender == 1)