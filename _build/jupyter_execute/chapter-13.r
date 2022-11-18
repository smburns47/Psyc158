# Run this first so it's ready by the time you need it
install.packages("readr")
install.packages("dplyr")
install.packages("supernova")
install.packages("ggformula")
library(readr)
library(dplyr)
library(supernova)
library(ggformula)
GSS <- read_csv("https://raw.githubusercontent.com/smburns47/Psyc158/main/GSS.csv")


str(GSS)

set.seed(10)
GSS_subset <- sample_n(GSS, 100) #args are dataframe to sample from, and number of observations to sample

#removing NA observations
#does it make sense what this filtering code is doing? Check out chapter 4 for a refresher
GSS_subset <- filter(GSS_subset, !is.na(highest_year_of_school_completed) & 
                    !is.na(highest_year_school_completed_father) &
                    !is.na(number_of_brothers_and_sisters))

#Make a model that predicts highest years of schooling from father's years of education.
#Look at the variable list above to get exact variable names and use GSS_subset as the data.
father_model <- lm(#FINISH CODE HERE, data = GSS_subset)
    
#Make a model that predicts highest years of schooling from number of siblings    
sibling_model <- lm(#FINISH CODE HERE, data = GSS_subset)

#Plotting father model
gf_jitter(highest_year_of_school_completed ~ highest_year_school_completed_father, data=GSS_subset) %>%
    gf_lm()    
    
#Plotting sibling_model    
gf_jitter(highest_year_of_school_completed ~ number_of_brothers_and_sisters, data=GSS_subset) %>% 
    gf_lm()

# Generate the ANOVA tables for both father_model and sibling_model


#Plotting father model
gf_jitter(highest_year_of_school_completed ~ highest_year_school_completed_father, data=GSS_subset,
        size=4) 

#Add in the color argument to the gf_jitter() function
gf_jitter(highest_year_of_school_completed ~ highest_year_school_completed_father, data=GSS_subset, 
          size = 4) %>% gf_lm()

#Save the residuals of father_model to a residual variable
GSS_subset$father_resid <- #YOUR CODE HERE

#plotting these residuals against number of siblings
gf_jitter(father_resid ~ number_of_brothers_and_sisters, data=GSS_subset, 
          size = 4)

# use lm() to find the best fitting coefficients for our multivariate model and output the coefficient values
full_model <- #YOUR CODE HERE

# save the multivariable model here
full_model <- 


GSS_subset$education_predicted <- predict(full_model)


subsetsubset <- filter(GSS_subset, number_of_brothers_and_sisters == 0 |
                      number_of_brothers_and_sisters == 7)
gf_point(education_predicted ~ highest_year_school_completed_father, 
          data = subsetsubset, color = "red", size = 5) 

# generate the ANOVA table for full_model


182.376 + 388.286

father_model
sibling_model

gf_jitter(highest_year_school_completed_father ~ number_of_brothers_and_sisters, data=GSS_subset, 
          size = 4)

cor(GSS_subset$highest_year_school_completed_father, GSS_subset$number_of_brothers_and_sisters)

supernova(full_model)

#resetting GSS_subset, since we deleted some rows earlier
set.seed(10)
GSS_subset <- sample_n(GSS, 100) 

#check variable type of respondents_sex
str(GSS_subset$respondents_sex)

#check variable type of born_in_us
str(GSS_subset$born_in_us)

#table of respondents_sex values
table(GSS_subset$respondents_sex)

#table of born_in_us values
table(GSS_subset$born_in_us)

#Write some code that will output the results of a model with two categorical predictors


#table of race_of_respondent values


#model predicting education years with race of respondent


#number_of_children was saves as a character type because one response option is "8 or more" - 
#always check your data types before modeling!
GSS_subset$number_of_children <- as.numeric(GSS_subset$number_of_children)

lm(number_of_children ~ general_happiness, data=GSS_subset)
gf_boxplot(number_of_children ~ general_happiness, data=GSS_subset, color= ~general_happiness)

#converting general_happiness to new labels, and as numeric
GSS_subset$happiness_num <- as.numeric(recode(GSS_subset$general_happiness, "Not too happy" = "0",
                                  "Pretty happy" = "1", 
                                  "Very happy" = "2"))

lm(number_of_children ~ happiness_num, data=GSS_subset)
gf_jitter(number_of_children ~ happiness_num, data=GSS_subset, width=0.2, height=0.2) %>% gf_lm()

categ_model <- lm(number_of_children ~ general_happiness, data=GSS_subset)
continuous_model <- lm(number_of_children ~ happiness_num, data=GSS_subset)

supernova(categ_model)
supernova(continuous_model)

lm(highest_year_of_school_completed ~ highest_year_school_completed_father + born_in_us, data = GSS_subset)

father_model
supernova(father_model)

cor(GSS_subset$highest_year_school_completed_father, GSS_subset$highest_year_school_completed_mother, 
   use="complete.obs") #dealing with NAs
cor(GSS_subset$highest_year_of_school_completed, GSS_subset$highest_year_school_completed_mother, 
   use="complete.obs")

bothparents_model <- lm(highest_year_of_school_completed ~ highest_year_school_completed_father + 
                       highest_year_school_completed_mother, data = GSS_subset)

bothparents_model
supernova(bothparents_model)
