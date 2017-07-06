setwd("C:/Users/gaffar/Desktop/new")

library(readr)
ds <- read_csv("wages.csv")

#name the first column
colnames(ds)[1] <- "serial"

#check the column type
str(ds)

# change all the column types to factor for reression 
num <- 1:4
ds[num] <- lapply(ds[num],as.factor)
str(ds)

#include a new column gender with 0 as male and 1 as female
gender<- factor(ds$sex, levels=c("male","female") , labels=c(0,1))
ds<- cbind(ds,gender)

# rounding off the wage to 2 decimal places 

is.num <- sapply(ds, is.numeric)
ds[is.num] <- lapply(ds[is.num], round, 2)

library(ggplot2)

#converting experience col to numeric or breaks cant be applied
ds$exper<-as.numeric(ds$exper)

#point plot with wage against experince
ggplot (ds, aes(x=exper , y = wage , color = school)) + geom_point() + scale_y_continuous(limits=c(0,15)) + scale_x_continuous(breaks=seq(0,18,2)) + facet_wrap(~gender)
