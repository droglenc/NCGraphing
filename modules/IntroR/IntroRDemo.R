library(tidyverse)

# Use r as a calculator
2+3
(2+3)*7

# Demonsratating assignments
a <- 7
b <- 3
a*b  # Multiplying

# Results are not shown unless you ask for them
res <- a*b
res

nums <- c(5,8,9,10,14,16) #concatenate (combine) numbers into one object
nums

nums2 <- a*nums
nums2

mean(nums,trim=0.1)

## Loading a data file
## First, set the working directory ...
setwd("~/GraphingClass")

dfobj <- read.csv("Avocados.csv")
head(dfobj)
str(dfobj)  # structure

plot(Total.Bags~Small.Bags,data=dfobj)
