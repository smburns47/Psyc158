# Run this first so it's ready by the time you need it
install.packages("readr")
install.packages("supernova")
install.packages("dplyr")
install.packages("ggformula")
library(readr)
library(supernova)
library(dplyr)
library(ggformula)
GSS <- read_csv("https://raw.githubusercontent.com/smburns47/Psyc158/main/GSS.csv")

#smaller dataset, more similar in size to most psychology studies
set.seed(10)
GSS_subset <- GSS_subset <- sample_n(GSS, 100)

model_obj <- lm(highest_year_of_school_completed ~ highest_year_school_completed_mother +
                highest_year_school_completed_father, data = GSS_subset)
summary(model_obj)

model_summary <- summary(model_obj)
model_summary$r.squared

supernova(model_obj)

#creating an empty vector of 1000 spots
null_R2 <- vector(length=1000)

#generate 1000 unique samples, saving each R2
for (i in 1:1000) {
    GSS_subset$shuffled_mother <- sample(x=GSS_subset$highest_year_school_completed_mother, 
                                         size=length(GSS_subset$highest_year_school_completed_mother), 
                                         replace=FALSE)
    GSS_subset$shuffled_father <- sample(x=GSS_subset$highest_year_school_completed_father, 
                                         size=length(GSS_subset$highest_year_school_completed_father), 
                                         replace=FALSE)
    model <- lm(highest_year_of_school_completed ~ shuffled_mother + shuffled_father, data=GSS_subset)
    null_R2[i] <- summary(model)$r.squared
}

R2_df <- data.frame(null_R2)
gf_histogram( ~ null_R2, data=R2_df)

#creating an empty vector of 1000 spots
null_b1 <- vector(length=1000)

#generate 1000 unique samples, saving each b1
for (i in 1:1000) {
    GSS_subset$shuffled_mother <- sample(x=GSS_subset$highest_year_school_completed_mother, 
                                         size=length(GSS_subset$highest_year_school_completed_mother), 
                                         replace=FALSE)
    model <- lm(highest_year_of_school_completed ~ shuffled_mother, data=GSS_subset)
    null_b1[i] <- model$coefficients[[2]]
}

b1_df <- data.frame(null_b1)

#cut-off values for extremeness
b1s_sd <- sd(b1_df$null_b1)
high_cutoff <- sd(b1_df$null_b1)*1.96
low_cutoff <- sd(b1_df$null_b1)*-1.96

#marking something as extreme if it is greater than 1.96*sd or less than -1.96*sd
b1_df$extreme <- b1_df$null_b1 > high_cutoff | b1_df$null_b1 < low_cutoff

gf_histogram(~ null_b1, data = b1_df, fill = ~extreme)

simple_model <- lm(highest_year_of_school_completed ~ highest_year_school_completed_mother, data=GSS_subset)
b1 <- simple_model$coefficients[[2]]

quantile(null_b1, 0.025)
quantile(null_b1, 0.975)
b1
b1 > quantile(null_b1, 0.975) | b1 < quantile(null_b1, 0.025)

full_model <- lm(highest_year_of_school_completed ~ highest_year_school_completed_mother +
                highest_year_school_completed_father, data = GSS_subset)
R2 <- summary(full_model)$r.squared

quantile(null_R2, 0.95)
R2 
R2 > quantile(null_R2, 0.95)

more_positive <- null_R2 > R2
num_more_positive <- sum(more_positive)

num_more_positive / length(null_R2)

summary(full_model)

#Fit a linear model predicting highest_year_of_school_completed with highest_year_school_completed_mother
#in GSS_subset
mother_model <- 

#return the summary of that model

#Fit a linear model predicting highest_year_of_school_completed with highest_year_school_completed_father
#in GSS_subset
father_model <- 

#return the summary of that model


#creating an empty vector of 1000 spots
null_deltaR2 <- vector(length=1000)

#generate 1000 unique samples, saving each R2
for (i in 1:1000) {
    GSS_subset$shuffled_mother <- #YOUR CODE HERE
    mother_model <- lm(highest_year_of_school_completed ~ shuffled_mother, data=GSS_subset)
    R2_mother <- summary(mother_model)$r.squared
    GSS_subset$shuffled_father <- #YOUR CODE HERE
    father_model <- lm(highest_year_of_school_completed ~ shuffled_father, data=GSS_subset)
    R2_father <- summary(father_model)$r.squared
    null_deltaR2[i] <- R2_mother - R2_father
}

deltaR2_df <- data.frame(null_deltaR2)

gf_histogram(~ null_deltaR2, data = deltaR2_df)

more_positive <- null_deltaR2 > 0.067
num_more_positive <- sum(more_positive)
more_negative <- null_deltaR2 < -0.067
num_more_negative <- sum(more_negative)

(num_more_positive + num_more_negative) / length(null_deltaR2)

linear_model <- lm(highest_year_of_school_completed ~ highest_year_school_completed_father, 
                   data=GSS_subset)
summary(linear_model)$r.squared

#Converting to log, adding a small value to any 0s so that the log isn't -Inf
GSS_subset$nonlinear_father <- log(GSS_subset$highest_year_school_completed_father + 0.001)
nonlinear_model <- lm(highest_year_of_school_completed ~ nonlinear_father, data=GSS_subset)
summary(nonlinear_model)$r.squared

#creating an empty vector of 1000 spots
null_deltaR2 <- vector(length=1000)

#generate 1000 unique samples, saving each R2
for (i in 1:1000) {
    GSS_subset$shuffled_father_linear <- #YOUR CODE HERE
    #Add a small value to any 0s so that the log isn't -Inf
    GSS_subset$shuffled_father_nonlinear <- log(GSS_subset$shuffled_father_linear + 0.001)
    linear_model <- lm(highest_year_of_school_completed ~ shuffled_father_linear, data=GSS_subset)
    R2_linear <- summary(linear_model)$r.squared
    nonlinear_model <- lm(highest_year_of_school_completed ~ shuffled_father_nonlinear, data=GSS_subset)
    R2_nonlinear <- summary(nonlinear_model)$r.squared
    null_deltaR2[i] <- R2_linear - R2_nonlinear
}

deltaR2_df <- data.frame(null_deltaR2)

gf_histogram(~ null_deltaR2, data = deltaR2_df)

more_positive <- null_deltaR2 > 0.047
num_more_positive <- sum(more_positive)
more_negative <- null_deltaR2 < -0.047
num_more_negative <- sum(more_negative)

(num_more_positive + num_more_negative) / length(null_deltaR2)

simple_model <- lm(highest_year_of_school_completed ~ highest_year_school_completed_father, 
                   data=GSS_subset)
summary(simple_model)$r.squared

full_model <- lm(highest_year_of_school_completed ~ highest_year_school_completed_father + 
                                                     number_of_brothers_and_sisters + 
                                                     born_in_us, data=GSS_subset)
summary(full_model)$r.squared

#creating an empty vector of 1000 spots
null_deltaR2 <- vector(length=1000)

#generate 1000 unique samples, saving each R2
for (i in 1:1000) {
    GSS_subset$shuffled_father <- sample(GSS_subset$highest_year_school_completed_father, 
                                              size=nrow(GSS_subset), 
                                              replace=FALSE)
    #Have to shuffle all predictors
    GSS_subset$shuffled_siblings <- sample(GSS_subset$number_of_brothers_and_sisters, 
                                              size=nrow(GSS_subset), 
                                              replace=FALSE)
    GSS_subset$shuffled_usborn <- sample(GSS_subset$born_in_us, 
                                              size=nrow(GSS_subset), 
                                              replace=FALSE)
    simple_model <- lm(highest_year_of_school_completed ~ shuffled_father, data=GSS_subset)
    R2_simple <- summary(simple_model)$r.squared
    full_model <- lm(highest_year_of_school_completed ~ shuffled_father + shuffled_siblings + 
                                                         shuffled_usborn, data=GSS_subset)
    R2_full <- summary(full_model)$r.squared
    null_deltaR2[i] <- R2_full - R2_simple
}

deltaR2_df <- data.frame(null_deltaR2)

gf_histogram(~ null_deltaR2, data = deltaR2_df)

more_positive <- null_deltaR2 > 0.047
num_more_positive <- sum(more_positive)
more_negative <- null_deltaR2 < -0.047
num_more_negative <- sum(more_negative)

(num_more_positive + num_more_negative) / length(null_deltaR2)
