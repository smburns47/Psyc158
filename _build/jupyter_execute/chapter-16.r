# Run this first so it's ready by the time you need it
install.packages("readr")
install.packages("dplyr")
install.packages("ggformula")
install.packages("interactions")
library(readr)
library(dplyr)
library(ggformula)
library(interactions)
fingers <- read_csv("https://raw.githubusercontent.com/smburns47/Psyc158/main/fingers.csv")

#drawing a sample of 50 heights from the fingers dataset
#if we leave out the probs argument, probability of each item will correspond to 
#its frequency in the dataset
bootstrap_sample <- sample(x = fingers$Height, size = 50, replace = TRUE)
bootstrap_sample

mean(bootstrap_sample)

mean(fingers$Height)

#creating an empty vector of 1000 spots
bootstrap_means50 <- vector(length=1000)

#generate 1000 unique samples, saving each mean
for (i in 1:1000) {
    #draw a sample of 50 heights from fingers$Height, replace = TRUE
    bootstrap_sample <- #YOUR CODE HERE
    m <- mean(bootstrap_sample)
    bootstrap_means50[i] <- m
}

head(bootstrap_means50)

bootstrap_df <- data.frame(bootstrap_means50)
gf_histogram(~ bootstrap_means50, data=bootstrap_df, fill = "red") %>%
gf_refine(coord_cartesian(x=c(58,77))) %>%
gf_vline(., xintercept = mean(fingers$Height))

gf_histogram(~ Height, data=fingers) %>% gf_refine(coord_cartesian(x=c(58,77))) %>%
    gf_vline(., xintercept = mean(fingers$Height))

mean(bootstrap_means50)
mean(fingers$Height)

#creating an empty vector of 1000 spots
bootstrap_means5 <- vector(length=1000)

#generate 1000 unique samples, saving each mean
for (i in 1:1000) {
    #draw a sample of 5 heights from fingers$Height, replace = TRUE
    bootstrap_sample <- #YOUR CODE HERE
    m <- mean(bootstrap_sample)
    bootstrap_means5[i] <- m
}

bootstrap_df$bootstrap_means5 <- bootstrap_means5

#plotting distribution of n=50 samples
gf_histogram(~ bootstrap_means50, data=bootstrap_df, fill = "red") %>%
gf_refine(coord_cartesian(x=c(58,77))) %>% gf_vline(., xintercept = mean(fingers$Height))

#plotting distribution of n=5 samples
gf_histogram(~ bootstrap_means5, data=bootstrap_df, fill = "blue") %>%
gf_refine(coord_cartesian(x=c(58,77))) %>% gf_vline(., xintercept = mean(fingers$Height))

#distribution of population data
gf_histogram(~ Height, data=fingers) %>% gf_refine(coord_cartesian(x=c(58,77))) %>% 
gf_vline(., xintercept = mean(fingers$Height))

mean(bootstrap_means5)
mean(fingers$Height)

#creating an empty vector of 1000 spots
bootstrap_means1 <- vector(length=1000)

#generate 1000 unique samples, saving each mean
for (i in 1:1000) {
    #draw a sample of 1 height value from fingers$Height, replace = TRUE
    bootstrap_sample <- #YOUR CODE HERE
    m <- mean(bootstrap_sample)
    bootstrap_means1[i] <- m
}

bootstrap_df$bootstrap_means1 <- bootstrap_means1

#plotting distribution of n=50 samples
gf_histogram(~ bootstrap_means50, data=bootstrap_df, fill = "red") %>%
gf_refine(coord_cartesian(x=c(58,77))) %>% gf_vline(., xintercept = mean(fingers$Height))

#plotting distribution of n=5 samples
gf_histogram(~ bootstrap_means5, data=bootstrap_df, fill = "blue") %>%
gf_refine(coord_cartesian(x=c(58,77))) %>% gf_vline(., xintercept = mean(fingers$Height))

#plotting distribution of n=1 samples
gf_histogram(~ bootstrap_means1, data=bootstrap_df, fill = "orange") %>%
gf_refine(coord_cartesian(x=c(58,77))) %>% gf_vline(., xintercept = mean(fingers$Height))

#distribution of population data
gf_histogram(~ Height, data=fingers) %>% gf_refine(coord_cartesian(x=c(58,77))) %>% 
gf_vline(., xintercept = mean(fingers$Height))

mean(bootstrap_means1)
mean(fingers$Height)

#fit a linear model of Thumb predicted by Height, in the fingers dataset
height_model <- lm(#YOUR CODE HERE)
height_model
gf_point(Thumb ~ Height, data=fingers) %>% gf_lm()

#creating an empty vector of 1000 spots
bootstrap_b1 <- vector(length=1000)

#generate 1000 unique samples, saving each mean
for (i in 1:1000) {
    #draw a sample of 50 height value from fingers$Height, replace = TRUE
    bootstrap_sample <- sample_n(fingers, size=50, replace=TRUE)
    bootstrap_model <- lm(Thumb ~ Height, data=bootstrap_sample)
    bootstrap_b1[i] <- bootstrap_model$coefficients[[2]]
}

bootstrap_df <- data.frame(bootstrap_b1)

#plotting distribution of n=50 samples
gf_histogram(~ bootstrap_b1, data=bootstrap_df, fill = "red")

set.seed(10)
bootstrap_sample <- sample_n(fingers, size=50, replace=TRUE)
lm(Thumb ~ Height, data=bootstrap_sample)
gf_point(Thumb ~ Height, data=bootstrap_sample) %>% gf_lm()

set.seed(138)
bootstrap_sample <- sample_n(fingers, size=50, replace=TRUE)
lm(Thumb ~ Height, data=bootstrap_sample)
gf_point(Thumb ~ Height, data=bootstrap_sample) %>% gf_lm()

set.seed(179)
bootstrap_sample <- sample_n(fingers, size=50, replace=TRUE)
lm(Thumb ~ Height, data=bootstrap_sample)
gf_point(Thumb ~ Height, data=bootstrap_sample) %>% gf_lm()

summary(height_model)

#2.5th and 97.5th quantiles of the normal distribution 
qnorm(p=c(0.025,0.975))

#15th and 85th quantiles of the normal distribution
qnorm(p=c(0.15,0.85))

summary(height_model)

#For the intercept:
confint(height_model, "(Intercept)", level=0.95)

#For the Height coefficient: 
confint(height_model, "Height", level=0.95)

#plotting group differences, showing data points
gf_boxplot(Thumb ~ Sex, data = fingers, color = ~ Sex) %>%
    gf_jitter(., width = 0.3, alpha = 0.5)

#plotting a regression, showing data points
gf_point(Thumb ~ Height, data = fingers) %>% 
    gf_lm()

#plotting an interaction
interactionmodel <- lm(Thumb ~ Sex*Weight, data = fingers)
interact_plot(interactionmodel, pred = Weight, modx = Sex)

gf_jitter(Thumb ~ Sex, data = fingers, color = ~ Sex, width = 0.1, alpha = 0.3) %>%
  gf_summary(fun.data = "mean_cl_boot", size = 2, color = ~ Sex)

gf_jitter(Thumb ~ Sex, data = fingers, color = ~ Sex, width = 0.1, alpha = 0.3) %>%
  gf_summary(fun.data = "mean_cl_boot", size = 1, color = "black")

gf_point(Thumb ~ Height, data = fingers) %>% 
    gf_lm(interval = "confidence")

interact_plot(interactionmodel, pred = Weight, modx = Sex,
             interval = TRUE, int.width = 0.95)

install.packages("forestplot")
library(forestplot)

multimodel <- lm(Thumb ~ Height + Weight + Pinkie + Middle, data = fingers)
bs <- multimodel$coefficients[2:5] #saving bs of all predictors
predictors <- c("Height", "Weight", "Pinkie length", "Middle finger length") #vector of predictor names
CI <- confint(multimodel)
upper_ci <- CI[2:5,2] #place to hold all upper CI values
lower_ci <- CI[2:5,1] #place to hold all lower CI values

forest_data <- data.frame(mean = bs,             #the point to visualize on plot
                         upper = upper_ci,       #the value of the top error bar
                         lower = lower_ci,       #the value of the lower error bar
                         predictors = predictors)#names of predictors to put on plot

forestplot(forest_data, labeltext = predictors, boxsize = 0.05)
