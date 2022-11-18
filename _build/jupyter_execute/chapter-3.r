# Here is the code to create two vectors my_vector and my_vector2. We just made up those names.

# Run the code and see what happens
my_vector <- c(1,2,3,4,5)
my_vector2 <- c(10,10,10,10,10)

# Now write some code to return these two vectors in the R console. Run the code and see what happens.


my_vector <- c(14,22,31,24,15)

# Use max() to find the largest value in my_vector


# Write code to get the 4th value in my_vector


# This code returns both the 2nd and 4th value in my_vector
my_vector[c(2,4)]

# This code returns the 1st through the 4th values in my_vector
my_vector[1:4]

# This code returns my_vector, but without the 3rd item
my_vector[-3]

# Try using both the colon method and the negative indexing method as different ways to return 
# the vector (2,3,4,5) using my_vector


my_sequence <- c(2,4,6,8,10)         

for (item in my_sequence) {     # for loop over the specified items
    print(item)                 # Print the value of each item
}

my_sequence <- c(2,4,6,8,10)         

for (position in 1:length(my_sequence)) {     # for loop over the position number of each item,
    print(position)                           # from the first item up to the max length of my_sequence
}

# Using indexing, how would you make this code print out (2,4,6,8,10) while still using positions 
# in the for loop?

my_sequence <- c(2,4,6,8,10)         

for (position in 1:length(my_sequence)) {     
    print(position)                           # Make a change to this line to print out the value of my_sequence 
}                                             # at this position using indexing

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

# Use the as.character() function on zipcodes, assign it to zipcodes_char, and then return the type 
# of that new object
zipcodes_char <- #replace this comment with your code
str(zipcodes_char)

zipcodes_numeric <- as.numeric(zipcodes_char)
str(zipcodes_numeric)

# 4 places, coded by zipcode
places_num <- c(01267, 01002, 19081, 91711)
places_factor <- factor(places_num, levels = c(01267, 01002, 19081, 91711), 
                        labels = c("williams", "amherst", "swarthmore", "pomona"))
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


handedness <- c(2,1,1,1,1,2,1,1,1)
handedness_bool <- handedness == 1

handedness_bool


# What do you expect from this code? Make a guess first, then run the code to see what happens. 

handedness <- c(2,1,1,1,1,2,1,1,1)
footedness <- c(2,1,1,1,1,1,1,2,1)

hand_foot_alignment <- handedness == footedness
hand_foot_alignment

end_score <- c(1400, 1450, 1500, 1200, 1150, 1600)
beginning_score <- c(1350, 1400, 1400, 1200, 1100, 1400)

#write code that will subtract beginning_score from end_score, and return the resulting vector
change_score <- #write your code here
