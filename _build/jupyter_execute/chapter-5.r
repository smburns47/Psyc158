install.packages("ggformula")
install.packages("readr")
#If this were our own computer, we wouldn't need to install since we'd already done that in a previous chapter
#But on a web browser like this we're using a new server each time, like a fresh computer

library(readr)
library(ggformula)
mindsetmatters <- read_csv("https://raw.githubusercontent.com/smburns47/Psyc158/main/mindsetmatters.csv")

gf_histogram( ~ Wt, data = mindsetmatters)

#Change the plotted variable to Age
gf_histogram(~ Wt, data = mindsetmatters)

outcome <- c(1,2,3,4,5)
tiny_data <- data.frame(outcome) #gf_histogram only works on dataframe objects, not vectors
#Write some code below here to plot a histogram of the variable "outcome" in the dataframe "tiny_data"


gf_histogram(~ outcome, data = tiny_data, bins = 5)

gf_histogram(~ outcome, data = tiny_data, bins = 5, color = "gray", fill = "blue")

# This is the same code as before but we added in another outcome value, 3.2
outcome <- c(1,2,3,4,5,3.2)
tiny_data <- data.frame(outcome)

# This makes a histogram with 5 bins
gf_histogram(~ outcome, data = tiny_data, bins = 5, color = "gray", fill = "blue")

gf_dhistogram(~ outcome, data = tiny_data, bins = 5, color = "gray", fill = "blue")

#Finish the code below to make a density plot of Age in mindsetmatters
gf_dhistogram(#set formula here, #set dataframe here, #set bin and color options here)


normal_data <- rnorm(n = 1000, mean = 0, sd = 1) #rnorm is a function that generates data in a normal distribution;
# we'll talk about simulating data like this in a later chapter
gf_dhistogram(~ data_pts, data = data.frame(data_pts = normal_data))

test_scores <- c(76,91,86,80,93)
#This computes a mean
sum(test_scores) / length(test_scores)

#Use mean() to calculate the mean of test_scores

#Evaluate the code below. Do you think it will be true or false?
(sum(test_scores) / length(test_scores)) == mean(test_scores)

dist1 <- c(10, 10, 11, 9, 11, 12, 8, 9, 10)
dist2 <- c(10, 10, 11, 9, 11, 12, 8, 9, 10, 100)

#Write code to plot the density plot of each of these distributions, using df_dhistogram()


#Calculate mean of dist1

#Calculate mean of dist2


median(test_scores)

#Visualize a weird distribution. Where is the mean versus the median versus the mode?
weird_dist <- data.frame(data_pts = c(1,2,2,3,3,3,4,4,4,4,5,5,5,5,5))
gf_dhistogram(~ data_pts, data = weird_dist)

table(weird_dist$data_pts)

#Max of test_scores
max(test_scores)

#Min of test_scores
min(test_scores)

#Calculate the range of test_scores by subtracting the min from the max


range(test_scores)

quantile(mindsetmatters$Age, probs = 0.5, na.rm = TRUE)
median(mindsetmatters$Age, na.rm = TRUE)

quantile(mindsetmatters$Age, probs = c(0.25,0.5,0.75), na.rm = TRUE)

IQR(mindsetmatters$Age, na.rm = TRUE)

#subtract the mean of test_scores from the first item in the vector, and find the absolute value
abs(test_scores[1] - mean(test_scores))

mean_score <- mean(test_scores)     # step 1. the mean of the data
AD <- abs(test_scores - mean_score) # step 2. the absolute deviations from the mean
MAD <- mean(AD)                     # step 3. the mean of the absolute deviations
MAD


var(mindsetmatters$Age, na.rm = TRUE)

# Find the standard deviation of mindsetmatters$Age using sd(), and verify that it produces the same result 
# as the square root of var()
age_var <- var(mindsetmatters$Age, na.rm = TRUE)
age_sd <- sd( #type your code here )
sqrt(age_var) == age_sd
