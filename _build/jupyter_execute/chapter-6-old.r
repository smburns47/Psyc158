library(ggformula)

#possible values of the die
sample_space <- c(1,2,3,4,5,6)
#probabilities of each value
probs <- c(0.167,0.167,0.167,0.167,0.167,0.167)
#sample() takes a sample space vector, sample size, replace flag, and probability vector
outcomes <- sample(x=sample_space, size=1000000, replace=TRUE, prob = probs)
#put the outcomes into a dataframe for plotting
outcome_df <- data.frame(outcomes=outcomes)
#plot all the die rolls
gf_dhistogram(~ outcomes, data=outcome_df, color="gray", fill="blue", bins=6)

#sample() function, but no prob argument
outcomes <- sample(x=sample_space, size=1000000, replace=TRUE)
#put the outcomes into a dataframe for plotting
outcome_df <- data.frame(outcomes=outcomes)
#plot all the die rolls
gf_dhistogram(~ outcomes, data=outcome_df, color="gray", fill="blue", bins=6)

#write your sample() function command here
outcomes <- sample(#your code here)
#put the outcomes into a dataframe for plotting
outcome_df <- data.frame(outcomes=outcomes)
#plot all the die rolls
gf_dhistogram(~ outcomes, data=outcome_df, color="gray", fill="blue", bins=6)

#sampling from the uniform distribution 
outcomes <- runif(n=1000000, min=0, max=6)
#putting sample into a dataframe for plotting
outcome_df <- data.frame(outcomes=outcomes)
#plot all the sampled values
head(outcome_df)

outcome_df$outcomes <- ceiling(outcome_df$outcomes)
head(outcome_df)
gf_dhistogram(~ outcomes, data=outcome_df, color="gray", fill="blue", bins=6)

# first argument is the value you want the probabilty of; second and third arguments are the min and max of the
# (continuous) distribution
dunif(4, min=0, max=6)

#sampling from the normal distribution 
outcomes <- rnorm(n=1000000, mean=8, sd=1)
#putting sample into a dataframe for plotting
outcome_df <- data.frame(outcomes=outcomes)
#plot all the sampled values
gf_dhistogram(~ outcomes, data=outcome_df, color="gray", fill="blue")

# Write your code here; the first argument should be the value you are computing a probability for; the second is
# the distribution mean, the third is the sd
dnorm(#your code here)

# Write your code below 

