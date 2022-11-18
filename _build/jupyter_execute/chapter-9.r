# This chapter uses the package ggformula, which takes a few minutes to download on Google Colab. 
# Run this first so it's ready by the time you need it
install.packages("ggformula")
install.packages("dplyr")
library(ggformula)
library(dplyr)

student_ID <- c(1, 2, 3, 4, 5, 6)
thumb <- c(56, 60, 61, 63, 64, 68)

tiny_fingers <- data.frame(student_ID, thumb)
tiny_fingers

gf_histogram(~ thumb, data = tiny_fingers) %>% #pipe the base histogram into a layer that adds the mean line
  gf_vline(., xintercept = mean(tiny_fingers$thumb), color = "blue")

lm(thumb ~ NULL, data = tiny_fingers)

tiny_empty_model <- lm(thumb ~ NULL, data = tiny_fingers)

tiny_empty_model

fingers <- read_csv("https://raw.githubusercontent.com/smburns47/Psyc158/main/fingers.csv")

# modify this to fit the empty model of Thumb
empty_model <- #YOUR CODE HERE

# this prints the best-fitting number
empty_model

# make a histogram of Thumb and draw the line for the mean
gf_histogram(#YOUR CODE HERE) %>% 
  gf_vline(., xintercept = #YOUR CODE HERE)

predict(tiny_empty_model)

# modify this to save the predictions from the tiny_empty_model
tiny_fingers$predicted <-

# this prints tiny_fingers
tiny_fingers


tiny_fingers$thumb - tiny_fingers$predicted

# modify this to save the residuals from the tiny_empty_model
tiny_fingers$residual <-

# this prints TinyFingers
tiny_fingers


resid(tiny_empty_model)

# modify this to save the residuals from the tiny_empty_model (calculate them the easy way)
tiny_fingers$easy_residual <-

# this prints TinyFingers
tiny_fingers


# this code from before fits the empty model for Fingers
Empty.model <- lm(Thumb ~ NULL, data = fingers)

# generate predictions from the Empty.model
fingers$Predicted <-

# generate residuals from the Empty.model
fingers$Residual <-

# this prints out 10 lines of Fingers
head(select(fingers, Thumb, Predicted, Residual), 10)


# make a histogram for Thumb
gf_histogram(  )

# make a histogram for Predicted
# leave the gf_lims() part -- it makes the graph easier to read
gf_histogram(  ) %>%
gf_lims(x = range(fingers$Thumb))

# make a histogram for Residual
gf_histogram(  )


lm(thumb ~ NULL, data = tiny_fingers)
