# Run this first so it's ready by the time you need it
install.packages("readr")
install.packages("dplyr")
install.packages("ggformula")
library(readr)
library(dplyr)
library(ggformula)
GSS <- read_csv("https://raw.githubusercontent.com/smburns47/Psyc158/main/GSS.csv")

#smaller dataset, more similar in size to most psychology studies
set.seed(10)
GSS_subset <- GSS_subset <- sample_n(GSS, 100)

unstandardized_model <- lm(highest_year_of_school_completed ~ highest_year_school_completed_father, 
                           data=GSS_subset)
summary(unstandardized_model)

GSS_zscore <- select(GSS_subset, highest_year_of_school_completed, highest_year_school_completed_father) %>%
    na.omit(.) %>% #removes rows with any NAs
    scale(.) %>%
    as.data.frame(.)

standardized_model <- lm(highest_year_of_school_completed ~ highest_year_school_completed_father, data=GSS_zscore)
summary(standardized_model)

standardized_model$coefficients[[2]]

cor(GSS_subset$highest_year_of_school_completed, GSS_subset$highest_year_school_completed_father,
   use="pairwise.complete.obs")

cor(GSS_subset$highest_year_of_school_completed, GSS_subset$highest_year_school_completed_father,
   use="pairwise.complete.obs")**2

summary(unstandardized_model)$r.squared

#install.packages("lsr")
#library(lsr)

#education for people born in US
inUS <- GSS_subset$highest_year_of_school_completed[GSS_subset$born_in_us == "Yes"]
#education for people born outside US
outsideUS <- GSS_subset$highest_year_of_school_completed[GSS_subset$born_in_us == "No"]

mean(inUS, na.rm=TRUE)
mean(outsideUS, na.rm=TRUE)
cohensD(inUS, outsideUS)

fingers <- read_csv("https://raw.githubusercontent.com/smburns47/Psyc158/main/fingers.csv")
#education for people born in US
female_height <- fingers$Height[fingers$Sex == "female"]
#education for people born outside US
male_height <- fingers$Height[fingers$Sex == "male"]

mean(female_height, na.rm=TRUE)
mean(male_height, na.rm=TRUE)

cohensD(female_height, male_height)


install.packages("pwr")
library(pwr)

pwr.r.test(n=50, r=NULL, sig.level=0.05, power=0.8)

#Enter values into the arguments below
pwr.r.test(n=, r=, sig.level=, power=)

pwr.r.test(n=NULL, r=0.2, sig.level=0.05, power=0.8)

pwr.f2.test(u=2, v=NULL, f2=0.1, sig.level=0.05, power=0.8)
