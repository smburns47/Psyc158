print("server is ready")

#execute your first bit of R code

print("Hello world!")

# a few basic arithmetic things
5 + 1
10 - 3
2 * 4
9 / 3

# type whatever you want
# see... blah blah blah

# This code will assign the number 47 to the R object favorite_number
favorite_number <- 47

# This code returns the value of my_favorite_number. Notice that you don't need to use the print() function 
# to print the contents of an R object; you can just type the name of the object
favorite_number

# now try making a new object, called 'birthday', and assign it the day of the month that you were born.


step1 <- 2*3
step2 <- 9/3
step3 <- step1 + step2

all_steps <- (2*3) + (9/3)

step3
all_steps

# Use the print() function to print the word "hello" (with the quotations)

# Use the sum() function to add up the numbers 5, 10, and 15. 


# Run the code below by pressing Run

# Now debug the code - fix the mistake and press Run

Sum(1,2)


read_csv("mindsetmatters.csv")

#readr is a package that makes it easy to load datasets into R. Step 1, download it (this can take a few moments)
install.packages("readr")

#next, load it so that all the functions are available to R
library(readr)

#now, try re-running the code from above. What happens now?
read_csv("mindsetmatters.csv")


