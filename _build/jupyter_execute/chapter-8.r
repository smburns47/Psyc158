# This chapter uses the package ggformula, which takes a few minutes to download on Google Colab. 
# Run this first so it's ready by the time you need it
install.packages("ggformula")
library(ggformula)

#possible values of the die
sample_space <- c(1,2,3,4,5,6)

#probabilities of each value
probs <- c(0.167,0.167,0.167,0.167,0.167,0.167)

#sample() takes a sample space vector, sample size, replace flag, and probability vector
outcomes <- sample(x = sample_space, size = 1000000, replace = TRUE, prob = probs)

#put the outcomes into a dataframe for plotting
outcome_df <- data.frame(outcomes)

#plot all the die rolls
gf_dhistogram(~ outcomes, data = outcome_df, color= "gray", fill = "blue", bins = 6)

#sample() function, but no prob argument
outcomes <- sample(x = sample_space, size = 1000000, replace = TRUE)
#put the outcomes into a dataframe for plotting
outcome_df <- data.frame(outcomes)
#plot all the die rolls
gf_dhistogram(~ outcomes, data = outcome_df, color = "gray", fill = "blue", bins = 6)

#finish the sample() command below
outcomes <- sample(#your code here, with a sample size of 30)

#put the outcomes into a dataframe for plotting
outcome_df <- data.frame(outcomes)
#plot all the die rolls
gf_dhistogram(~ outcomes, data = outcome_df, color = "gray", fill = "blue", bins = 6)

# Set a seed before this sample function. Then run this code multiple times to verify that
# the sample is always the same. 

outcomes <- sample(x = sample_space, size = 30, replace = TRUE)
#put the outcomes into a dataframe for plotting
outcome_df <- data.frame(outcomes)
#plot all the die rolls
gf_dhistogram(~ outcomes, data = outcome_df, color = "gray", fill = "blue", bins = 6)

sample_space <- c(1,2,3,4,5,6)
weighted_outcomes <- sample(x = sample_space, size = 30, replace = TRUE, 
                            prob = c(0.22, 0.11, 0.22, 0.11, 0.22, 0.11))
outcome_df <- data.frame(weighted_outcomes)
#plot all the die rolls
gf_dhistogram(~ weighted_outcomes, data = outcome_df, color = "gray", fill = "blue", bins = 6)
#count number of rolls of each number in a table
table(weighted_outcomes)

sample_space <- c(1,2,3,4,5,6)
#roll 1 die 1,000,000 times
die1 <- sample(x = sample_space, size = 1000000, replace = TRUE)
#repeat for the other die
die2 <- sample(x = sample_space, size = 1000000, replace = TRUE)

#make a boolean variable for whether die1 or die2 has a 6, at each index
any6 <- (die1 == 6) | (die2 == 6) 

#count number of "true" results for rolling at least one 6
sum(any6)

#compute probability (proportion of total complex event sample that is true)
sum(any6) / length(any6)

sample_space <- c(1,2,3,4,5,6)  #sample space
any6_sum <- 0    #a counter object

for (i in 1:1000000) {  #making a for loop of 1,000,000 tosses of two dice
    twodice <- sample(x = sample_space, size = 2, replace = TRUE) #sample two dice at once
    if (6 %in% twodice) {   #if there is at least one 6 in this two-dice sample,
        any6_sum <- any6_sum + 1    #increase the counter object by 1
    }
}

#count number of times there was at least 1 six in two-dice samples, across 1,000,000 tosses
sum(any6_sum)

#compute probability (proportion of times we found a 6 out of tosses we made)
sum(any6_sum) / 1000000

sample_space <- c(1,2,3,4,5,6)
#roll 1 die 1,000,000 times
phys_power <- sample(x = sample_space, size = 1000000, replace = TRUE)
#repeat for the other die
mag_power <- sample(x = sample_space, size = 1000000, replace = TRUE)

#make a new total power variable by adding both subtypes together
total_power <- phys_power + mag_power

#make a table of the frequency each total power result across 1,000,000 simulations
table(total_power)

#make a dataframe out of the new variable
outcome_df <- data.frame(total_power)

#Use gf_dhistogram to plot the histogram of scores in outcome_df


#sampling from the uniform distribution, between values of 0 and 6
outcomes <- runif(n = 1000000, min = 0, max = 6)

#putting sample into a dataframe
outcome_df <- data.frame(outcomes)

#look at first few values sampled from uniform distribution
head(outcome_df)

#plot the histogram of sample
gf_dhistogram(~ outcomes, data = outcome_df, bins = 500)

outcome_df$rounded_outcomes <- ceiling(outcome_df$outcomes)
head(outcome_df)
gf_dhistogram(~ rounded_outcomes, data = outcome_df, bins = 6)

# first argument is the value you want the probabilty of; second and third arguments are the min and max of the
# (continuous) distribution
dunif(4, min=0, max=6)

#sampling from the normal distribution 
outcomes <- rnorm(n = 1000000, mean = 8, sd = 1)

#putting sample into a dataframe for plotting
outcome_df <- data.frame(outcomes)

#plot all the sampled values
gf_dhistogram(~ outcomes, data = outcome_df)

dnorm(6, mean = 8, sd = 1)

# Write your code below 


prob_3 <- dunif(3, min = 0, max = 6)
prob_not_3 <- dunif(1, min = 0, max = 6) + dunif(2, min = 0, max = 6) + 
                dunif(4, min = 0, max = 6) + dunif(5, min = 0, max = 6) + 
                dunif(6, min = 0, max = 6)

# does prob_not_3 have the same value as 1 - prob_3?
prob_not_3 
1 - prob_3

punif(3,                  # The max (or min) of the cumulative
      min = 0,            # Lower limit of the distribution 
      max = 6,            # Upper limit of the distribution 
      lower.tail = TRUE)  # If TRUE, calculate cumulative below 3. 
                          # If FALSE, calculate cumulative above 3. 


sample_space <- c(1,2,3,4,5,6)

#roll 1 die 1,000,000 times
die1 <- sample(x = sample_space, size = 1000000, replace = TRUE)
#repeat for the other die
die2 <- sample(x = sample_space, size = 1000000, replace = TRUE)

#make a new boolean variable for whether both dice equal 6 for each index
both6 <- (die1 == 6) & (die2 == 6) 

# can count the number of true values in a boolean just by summing,
# since TRUE also equals 1 and FALSE equals 0
# then divide by the number of total rolls
sum(both6) / length(both6)

#verify it's about the same as the axiom P(E6)*P(F6)
(1/6)*(1/6)


sample_space <- c(1,2,3,4,5,6)

#roll 1 die 1,000,000 times
die1 <- sample(x = sample_space, size = 1000000, replace = TRUE)
#repeat for the other die
die2 <- sample(x = sample_space, size = 1000000, replace = TRUE)

#make a new boolean variable for whether either dice equal 6 for each index
both6 <- (die1 == 6) | (die2 == 6) 

# can count the number of true values in a boolean just by summing,
# since TRUE also equals 1 and FALSE equals 0
# then divide by the number of total rolls
sum(both6) / length(both6)

#verify it's about the same as the axiom P(E6) + P(F6) - P(E6)*P(F6)
1/6 + 1/6 - (1/6)*(1/6)

