# Run this first so it's ready by the time you need it
install.packages("readr")
install.packages("supernova")
install.packages("ggformula")
library(readr)
library(supernova)
library(ggformula)

student_ID <- c(1, 2, 3, 4, 5, 6)
Thumb <- c(56, 60, 61, 63, 64, 68)
Height <- c(62, 66, 67, 63, 68, 71)

tiny_fingers <- data.frame(student_ID, Thumb, Height)
tiny_fingers

#Boolean variable, 0 = less than avg height 1 = greater than or equal to avg height
tiny_fingers$Height2Group <- tiny_fingers$Height >= mean(tiny_fingers$Height) 

#Recode to meaningful labels
tiny_fingers$Height2Group <- factor(tiny_fingers$Height2Group, levels = c(FALSE, TRUE), 
                                    labels = c("short", "tall"))

tiny_fingers

height2group_model <- lm(Thumb ~ Height2Group, data=tiny_fingers)

height2group_model

supernova(height2group_model)

# modify this to fit Thumb as a function of Height
tiny_Height_model <- lm()

# this prints the best-fitting estimates
tiny_Height_model


tiny_fingers$GroupNum <- c(1,1,2,1,2,2)

tiny_fingers

# fit a model of Thumb length based on Height2Group
Height2Group_model <- lm()

# fit a model of Thumb length based on GroupNum
GroupNum_model <- lm()

# this prints the parameter estimates from the two models
Height2Group_model
GroupNum_model


fingers <- read_csv("https://raw.githubusercontent.com/smburns47/Psyc158/main/fingers.csv")

# modify this to fit the Height model of Thumb for the Fingers data
Height_model <- lm()

# this prints best estimates
Height_model


gf_point(Thumb ~ Height, data = fingers, size = 4) %>%
gf_lm(color = "orange")


b0 <- Height_model$coefficients[[1]]
b1 <- Height_model$coefficients[[2]]

b0 + b1*60

#how would you output a prediction for someone who is 73.5 inches tall?


# modify to save the residuals from Height_model
fingers$Height_resid <- resid()

# modify to make a histogram of Height_resid
gf_histogram()


fingers$Height2Group <- fingers$Height >= mean(fingers$Height, na.rm=TRUE)
Height2Group_model <- lm(Thumb ~ Height2Group, data=fingers)

print("Height2Group model")
supernova(Height2Group_model)
print("Height model")
supernova(Height_model)

# this transforms all Thumb lengths into zscores
fingers$Thumb_z <- scale(Fingers$Thumb)

# modify this to do the same for Height
fingers$Height_z <- 


# this makes a scatterplot of the raw scores
# size makes the points bigger or smaller
gf_point(Thumb ~ Height, data = fingers, size = 4, color = "black")

# modify this to make a scatterplot of the zscores
# feel free to change the colors
gf_point( #FORMULA HERE, data = fingers, size = 4, color = "firebrick")


#fit a regression model Thumb_z ~ Height_z
Height_z_model <- lm(Thumb_z ~ Height_z, data = fingers)

# compare ANOVA tables for each model
supernova(Height_model)
supernova(Height_z_model)

Height_z_model$coefficient[[2]]

# this calculates the correlation of Thumb and Height
cor(fingers$Thumb, fingers$Height)


height_w_NA <- fingers$Height
height_w_NA[10] <- NA

#This will output NA, since the 10th item of height_w_NA is missing
cor(fingers$Thumb, height_w_NA)

#This fixes it by leaving out that observation on both variables
cor(fingers$Thumb, height_w_NA, use="pairwise.complete.obs")

# this calculates the correlation of Thumb and Height
cor(fingers$Thumb, fingers$Height)

# calculate the correlation of Thumb and Pinkie


cor(fingers$Middle, fingers$Pinkie)
cor(fingers$Pinkie, fingers$Middle)

