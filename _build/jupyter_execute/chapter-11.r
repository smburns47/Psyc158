# Run this first so it's ready by the time you need it
install.packages("readr")
install.packages("supernova")
library(readr)
library(supernova)

student_ID <- c(1, 2, 3, 4, 5, 6)
Thumb <- c(56, 60, 61, 63, 64, 68)
Sex <- c("female", "female", "female", "male", "male", "male")

tiny_fingers <- data.frame(student_ID, Thumb, Sex)
tiny_fingers

lm(Thumb ~ Sex, data = tiny_fingers)

tiny_sex_model <- lm(Thumb ~ Sex, data = tiny_fingers)

#type the name of the saved model below to print out its output


fingers <- read_csv("https://raw.githubusercontent.com/smburns47/Psyc158/main/fingers.csv")

# store the model where Sex predicts Thumb
sex_model <- 

# this prints out the model estimates
sex_model

sex_model$coefficients[[1]] #this will print out the first coefficient, b0
sex_model$coefficients[[2]] #this will print out the second coefficient, b1

predict(sex_model)

fingers$Sex_predicted <-

# this prints the first few lines of the fingers data frame, to check if your variable saved successfully
head(fingers)


tiny_fingers$GrandMean <- c(62, 62, 62, 62, 62, 62) #predictions using grand mean
tiny_fingers$GroupMeans <- c(59, 59, 59, 65, 65, 65) #predictions using group means
tiny_fingers$GrandResid <- tiny_fingers$Thumb - tiny_fingers$GrandMean #grand mean prediction residuals
tiny_fingers$GroupResid <- tiny_fingers$Thumb - tiny_fingers$GroupMeans #group mean prediction residuals

 #equation for RMSE in one-parameter case 
sqrt(sum(tiny_fingers$GrandResid^2) / (length(tiny_fingers$GrandResid) - 1))
 #equation for RMSE in two-parameter case 
sqrt(sum(tiny_fingers$GroupResid^2) / (length(tiny_fingers$GroupResid) - 2))

# ANOVA table of an empty model
empty_model <- lm(Thumb ~ NULL, data = fingers)
supernova(empty_model)

# write code to use supernova() on the sex_model object instead

