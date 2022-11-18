# Run this first so it's ready by the time you need it
install.packages("supernova")
install.packages("ggformula")
library(supernova)
library(ggformula)

set.seed(10)
predictor <- abs(rnorm(100, 0, 2))
error <- rnorm(100, 0, 1)

outcome <- 2*predictor^2 + error

sim_data <- data.frame(predictor, outcome)
linear_model <- lm(outcome ~ predictor, data = sim_data)
gf_point(outcome ~ predictor, data = sim_data) %>% gf_lm()

#Use supernova() to tell us how good this model is


gf_point(outcome ~ predictor, data = sim_data) %>% gf_smooth()

#Square the values of predictor to make a new variable, predictor_squared
sim_data$predictor_squared <- #YOUR CODE HERE

squared_model <- lm(outcome ~ predictor_squared, data = sim_data)
gf_point(outcome ~ predictor_squared, data = sim_data) %>% gf_lm()
supernova(squared_model)

sim_data$outcome2 <- 85 + 4*log(sim_data$predictor) + error

linear2_model <- lm(outcome2 ~ predictor, data = sim_data)
gf_point(outcome2 ~ predictor, data = sim_data) %>% gf_lm()
supernova(linear2_model)

gf_point(outcome2 ~ predictor, data = sim_data) %>% gf_smooth()

#Take the log of predictor to make a new variable, predictor_log
sim_data$predictor_log <- #YOUR CODE HERE

log_model <- lm(outcome2 ~ predictor_log, data = sim_data)
gf_point(outcome2 ~ predictor_log, data = sim_data) %>% gf_lm()
supernova(squared_model)

sim_data$predictor_log <- log(sim_data$predictor)
lm(outcome2 ~ predictor_log, data = sim_data)

lm(outcome2 ~ log(predictor), data = sim_data)

log(0)

sim_data$linear_resid <- resid(linear_model)
gf_histogram( ~ linear_resid, data = sim_data)

sim_data$squared_predicted <- predict(squared_model)
sim_data$squared_resid <- resid(squared_model)
gf_point(squared_resid ~ squared_predicted, data = sim_data) 

sim_data$linear_predicted <- predict(linear_model)
sim_data$linear_resid <- resid(linear_model)
gf_point(linear_resid ~ linear_predicted, data = sim_data)

sim_data$predictor_rank <- rank(sim_data$predictor, na.last="keep", ties.method="average")
sim_data$outcome_rank <- rank(sim_data$outcome, na.last="keep", ties.method="average")

gf_point(outcome_rank ~ predictor_rank, data = sim_data) %>% gf_lm()

#simulation for the situation above
set.seed(10)
dose <- abs(runif(100, 0, 100)) #uniformly distributed doses
age <- abs(rnorm(100, 45, 20)) #normally distributed ages
error <- rnorm(100, 0, 10)
cholesterol <- 0.5*dose + 0.02*age + 0.01*dose*age + error
cholesterol_data <- data.frame(cholesterol, dose, age)

#fitting interaction model
cholesterol_model <- lm(cholesterol ~ dose + age + dose*age, data = cholesterol_data)
cholesterol_model

install.packages("interactions")
library(interactions)

#plotting interaction
interact_plot(cholesterol_model, pred = dose, modx = age)

#plotting interaction with datapoints 
interact_plot(cholesterol_model, pred = dose, modx = age, plot.points = TRUE)
