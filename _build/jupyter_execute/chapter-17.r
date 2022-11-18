# Run this first so it's ready by the time you need it
install.packages("readr")
install.packages("ggformula")
library(readr)
library(ggformula)
fingers <- read_csv("https://raw.githubusercontent.com/smburns47/Psyc158/main/fingers.csv")

head(fingers$Sex)

shuffled_Sex <- sample(x=fingers$Sex, size=length(fingers$Sex), replace=FALSE)
head(shuffled_Sex)

#creating an empty vector of 1000 spots
null_b1s <- vector(length=1000)

#generate 1000 unique samples, saving each b1
for (i in 1:1000) {
    fingers$shuffled_Sex <- sample(x=fingers$Sex, size=length(fingers$Sex), replace=FALSE)
    model <- lm(Thumb ~ shuffled_Sex, data=fingers)
    null_b1s[i] <- model$coefficients[[2]]
}

b1s_df <- data.frame(null_b1s)
gf_histogram( ~ null_b1s, data=b1s_df)

#cut-off values for extremeness
sorted_nullb1 <- sort(null_b1s)
high_cutoff <- sorted_nullb1[975]
low_cutoff <- sorted_nullb1[25]
high_cutoff
low_cutoff

#marking something as extreme if it is greater than 97.5%ile or less than 2.5%ile
b1s_df$extreme <- b1s_df$null_b1s > high_cutoff | b1s_df$null_b1s < low_cutoff

gf_histogram(~ null_b1s, data = b1s_df, fill = ~extreme)

gf_histogram(~ null_b1s, data = b1s_df, fill = ~extreme, bins= #YOUR CODE HERE)

sex_model <- lm(Thumb ~ Sex, data=fingers)
b1 <- sex_model$coefficients[[2]]

gf_histogram(~ null_b1s, data = b1s_df, fill = ~extreme, bins=100) %>% 
gf_point(x = b1, y = 0, size = 3) %>% 
gf_refine(coord_cartesian(x=c(-7,7))) 

#boolean where 1 = value is greater than 3
more_positive <- null_b1s > 3
num_more_positive <- sum(more_positive)

#boolean where 1 = value is less than -3
more_negative <- null_b1s < -3
num_more_negative <- sum(more_negative)

(num_more_positive + num_more_negative) / length(null_b1s)

more_positive <- null_b1s > 6.447
num_more_positive <- sum(more_positive)

more_negative <- null_b1s < -6.447
num_more_negative <- sum(more_negative)

(num_more_positive + num_more_negative) / length(null_b1s)

summary(sex_model)

confint(sex_model, "Sexmale", level=0.95)

#Write some code to again output the bigger results table for sex_model, not just the coefficients


#creating an empty vector of 1000 spots
null_b1s_n30 <- vector(length=1000)

#generate 1000 unique samples of N=30, saving each b1
for (i in 1:1000) {
    shuffled_Thumb <- sample(x=fingers$Thumb, size=30, replace=FALSE)
    Sex <- sample(x=fingers$Sex, size=30, replace=FALSE)
    small_df <- data.frame(shuffled_Thumb, Sex)
    model <- lm(shuffled_Thumb ~ Sex, data=small_df)
    null_b1s_n30[i] <- model$coefficients[[2]]
}

b1s_df$null_b1s_n30 <- null_b1s_n30
gf_histogram( ~ null_b1s_n30, data=b1s_df)

more_positive <- null_b1s_n30 > 6.447
num_more_positive <- sum(more_positive)

more_negative <- null_b1s_n30 < -6.447
num_more_negative <- sum(more_negative)

(num_more_positive + num_more_negative) / length(null_b1s_n30)

#creating an empty vector of 1000 spots
null_b1s_100k <- vector(length=1000)

#generate 1000 unique samples of N=100000, saving each b1
for (i in 1:1000) {
    shuffled_Thumb <- sample(x=fingers$Thumb, size=100000, replace=TRUE)
    Sex <- sample(x=fingers$Sex, size=100000, replace=TRUE)
    big_df <- data.frame(shuffled_Thumb, Sex)
    model <- lm(shuffled_Thumb ~ Sex, data=big_df)
    null_b1s_100k[i] <- model$coefficients[[2]]
}

b1s_df$null_b1s_100k <- null_b1s_100k
gf_histogram( ~ null_b1s_100k, data=b1s_df)

model_obj <- lm(Thumb ~ Sex, data = fingers)

model_obj$coefficients[[2]]

#Use summary() to see the p-value of the effect of Sex


summary(model_obj)$coefficients[2,4]

summary(model_obj)$coefficients[2,4] < 0.05

#Use confint() to find 95% CI of Sexmale estimate


model_obj <- lm(Thumb ~ Sex + Height, data = fingers)

summary(model_obj)

confint(model_obj, "Sexmale", level=0.95)

model_obj <- lm(Thumb ~ Sex + Height + Sex*Height, data = fingers)

confint(model_obj, "Sexmale:Height", level = 0.95)
