# Here is the code to create two vectors my_vector and my_vector2. We just made up those names.

# Run the code and see what happens
my_vector <- c(1,2,3,4,5)
my_vector2 <- c(10,10,10,10,10)

# Now write some code to return these two vectors in the R console. Run the code and see what happens.


# Write code to get the 4th value in my_vector


my_vector <- c(1,2,3,4,5)

# Use sum() to total up the values in my_vector


#example of a character value
my_character <- "I am a character."
my_character

many_hellos <- c("hi", "hello", "hola", "bonjour", "ni hao", "merhaba")

# Write code to print out the 5th way of saying hello in this vector


# Read this code and predict what value will come out of the R console. Then run the code and see if you were right.

A <- 1
B <- 5

comparison <- A > B

comparison

#Use str() to print out the type of each object below
object1 <- "What am I?"
object2 <- TRUE
object3 <- 30

#Write your code below this line


zipcodes <- c(01267, 01002, 19081, 91711, 02481, 04011, 21402, 91711, 55057, 05753)
str(zipcodes)

# Use the factor() function on handedness_label, assign it to handedness_factor, and then return the type 
# of that new object
zipcodes_factor <- #replace this comment with your code
str(zipcodes_factor)

handedness_numeric <- as.numeric(handedness_factor)
str(handedness_numeric)

# 4 places, coded by zipcode
places_num <- c(01267, 01002, 19081, 91711)
places_factor <- factor(places_num, levels = c(01267, 01002, 19081, 91711), 
                        labels = c("williams", "amherst", "swarthmore", "pomona")))
# if your command is too wide, hit return after a comma to make it wrap around on a new line, indented

places_factor

my_vector <- c(1,2,3,4,5)

# write code to multiply each number in my_vector by 100

# Run the code below to see what happens
my_vector <- c(1,2,3,4,5)
my_vector * 100

# This will return my_vector
my_vector


# This creates `my_vector` and stores 1, 2, 3, 4, 5 in it
my_vector <- c(1,2,3,4,5)

# Now write code to save `my_vector * 100` back into `my_vector`
my_vector <- #replace this comment with your code


end_score <- c(1400, 1450, 1500, 1200, 1150, 1600)
beginning_score <- c(1350, 1400, 1400, 1200, 1100, 1400)

#write code that will subtract beginning_score from end_score, and return the resulting vector
change_score <- #write your code here

handedness <- c(2,1,1,1,1,2,1,1,1)
str(handedness)

# Use the factor() function on handedness_label, assign it to handedness_factor, and then return the type 
# of that new object
handedness_factor <- #replace this comment with your code

handedness_numeric <- as.numeric(handedness_factor)
str(handedness_numeric)

handedness_bool <- handedness == 1

# This code returns both vectors
handedness_bool


# What do you expect from this code? Run the code to see what happens. Then, fix the bug and run again.

handedness <- c(2,1,1,1,1,2,1,1,1)
footedness <- c(2,1,1,1,1,1,1,2,1)

#a variable to represent whether someone uses both left or both right hands and feet
hand_foot_alignment <- handedness = footedness
hand_foot_alignment

