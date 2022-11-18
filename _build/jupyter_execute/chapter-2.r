x <- 10         # Assign some variables
y <- 5

if (x > y) {      # The keyword "if" starts an if statement; # A logical expression follows the "if"
    print(x)    # Curly brace "{" start a chunk of code that you want to execute, only if the logical         
}               # expression is true. Afterwards, close the conditional block with a "}" brace.  
                # The chunk of code within the "{}" braces should be indented, for readibility. 

x <- 10
y <- 25         # Reassign variable y to make it larger than x

if (x > y) {    # The original if statement
    print(x)
} else {        # With a new else statement added
    print(y)
}

# Try writing your own if/else statement with a different arithmatic equation, using the above format as a guide
x <- 12
y <- 15

if (x > y) {    
    print(x)
} else (x < y) {        # What's wrong with this line?
    print(y)
}

x <- 10
y <- 25

if (x > y) {                     
    print(x)
} else if (y == x) {
    print("x and y are equal")
} else {                         
    print(y)
}

my_sequence <- seq(1,10,1)     # A function that creates a set of numbers, from 1 to 10 counting by 1

for (item in my_sequence) {     # Create a new for loop over the specified items
    print(item)                 # Code to execute
}

for (item in my_sequence) {     
    #add an if statement here {
        print(item)
    }
}

for (item in my_sequence) {
    if (item < 5){        # This if statement skips items less than 5
        next
    }
    print(item)
}

for (item in my_sequence) {
    if (item > 5){        # Break out of the loop if item exceeds 5
        break
    }
    print(item)
}

end_time <- 5
hour <- 1

#Study until 5 o'clock
while (hour < end_time) {     # Execute the contents as long as hour < end_time
    print("Studying...")
    hour <- hour + 1    # Increment hour by 1 each time the loop executes
    print(hour)
}
print("Done!")

end_time <- 5
hour <- 1                 

while (hour < end_time) {            # This logical expression is always true!
    print("Studying...")
    hour <- hour - 1    # We made a bug here - subtracting 1 means hour will never increase above end_time
    print(hour)
    break                 # But we immediately break out of the loop
}

#function to convert Fahrenheit to Celsius:
fahrenheit_to_celsius <- function(temp_F) {
  temp_C <- (temp_F - 32) * (5 / 9)
  return(temp_C)
}

#what's freezing temp in Celsius?
fahrenheit_to_celsius(32)

#use the function with today's temperature in F to find out what it is in C


# complete the function below to convert Celsius to Fahrenheit 
celsius_to_fahrenheit <- #your code here
