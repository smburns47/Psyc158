x1 <- c(1,2,3,4,5)
x2 <- c(18,21,20,23,20)
data.frame(x1, x2)

data.frame(user_id = x1, age = x2)

x1 <- c(1,2,3,4,5)
x2 <- c(18,21,20,23)
data.frame(user_id = x1, age = x2)

# finish the code below to install readr
install.packages("   ")

#finish the code below to load readr
library(   )

getwd()

read_csv("https://raw.githubusercontent.com/smburns47/Psyc158/main/mindsetmatters.csv")

# read the dataframe into an object called mindsetmatters
mindsetmatters <- # your code here

# check the data type of this object
str(mindsetmatters)

#run this code to see the head of the dataframe
head(mindsetmatters)

dim(mindsetmatters)

nrow(mindsetmatters)

#use ncol() to output the number of variables in mindsetmatters


# Use the $ sign to print out the contents of the Age variable in the mindsetmatters dataframe


# Add two years to the value of everyone's age in the variable Age, and print out the result


#Write code to return the 10th row of mindsetmatters

#Write code to return the 5th column of mindsetmatters

#What do you think this code will return?
mindsetmatters[10,5]

install.packages("dplyr")
library(dplyr)

#Make a prediction, what do you think this code will do? 
select(mindsetmatters, BMI, Fat)

head(select(mindsetmatters, BMI, Fat))

select(mindsetmatters, 43)

filter(mindsetmatters, Age == 43)

#How would you use filter() to return a dataframe of everyone who is *at least* 43 years old?


# Using is.na() on the Fat2 variable to see where NA values might be

is.na(mindsetmatters$Fat2) #remember variable names are case sensitive!

sum(is.na(mindsetmatters$Fat2))

#Write your code here


filter(mindsetmatters, Fat2 != "NA")

#Write code here to make your new dataframe mindsetmatters_subset without any NA in Fat2


#make a new dataframe separate from the original
mindsetmatters2 <- mindsetmatters

#Look at all the variables in mindsetmatters
head(mindsetmatters)

# Create a new variable in mindsetmatters2 called Ht from Wt and BMI
mindsetmatters2$Ht <- mindsetmatters2$Wt / mindsetmatters2$BMI

#Look at the updated dataframe, and find where the new variable went
head(mindsetmatters2)

# making a new boolean variable to mark who is at least 40 years old
mindsetmatters2$Older <- mindsetmatters$Age >= 40
head(mindsetmatters2)

# Write some more code below, using filter(), to make a minsetmatters_subset dataframe of only
# participants who are at least 40 years old. Does the size of this dataframe match what you 
# expect from the code above?


mindsetmatters2 <- mutate(mindsetmatters, Ht = Wt/BMI)
head(mindsetmatters2)

#Identify the data type of Cond
str(mindsetmatters2)

#Recode Cond into a factor, and save it over the original Cond variable


#Identify the data type of Cond again. Did it change?
str(mindsetmatters2)

# Save the recoded version of `Cond` to `CondRecode`
mindsetmatters2$CondRecode <- recode(     )

# Write code to print the first 6 observations of `Cond` and `CondRecode` only



#saving a data frame into a csv file
write_csv(mindsetmatters2, "mindsetmatters2.csv")
