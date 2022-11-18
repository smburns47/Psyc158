# Run this first so it's ready by the time you need it
install.packages("readr")
install.packages("dplyr")
install.packages("ggformula")
library(readr)
library(dplyr)
library(ggformula)

kidney_disease <- read_csv("https://raw.githubusercontent.com/smburns47/Psyc158/main/ckd.csv")
head(kidney_disease)

lm(Appetite ~ Hemoglobin, data = kidney_disease)

kidney_disease$Appetite_dummy <- recode(kidney_disease$Appetite, "poor" = "0", "good" = "1")
kidney_disease$Appetite_dummy <- as.numeric(kidney_disease$Appetite_dummy)

#checking our work
str(kidney_disease$Appetite_dummy)

gf_point(Appetite_dummy ~ Hemoglobin, data = kidney_disease)

gf_point(Appetite_dummy ~ Hemoglobin, data = kidney_disease) %>% gf_lm()

log(3.064854) - log(3.004166)
log(3.064854/3.004166)

exp(0.02)

#probability of a 31-year-old having kids
3.064854 / (1 + 3.064854)

1.02*0.7502601

gf_point(Appetite_dummy ~ Hemoglobin, data = kidney_disease) %>% 
  gf_smooth(method="glm", method.args = list(family = "binomial"))

kidney_model <- glm(Appetite_dummy ~ Hemoglobin, data = kidney_disease, family = binomial)
kidney_model

logodds <- kidney_model$coefficients[[1]] + kidney_model$coefficients[[2]]*10
odds <- exp(logodds)
probability <- odds / (1 + odds)
probability

GSS <- read_csv("https://raw.githubusercontent.com/smburns47/Psyc158/main/GSS.csv")

str(GSS$should_marijuana_be_made_legal)
table(GSS$should_marijuana_be_made_legal)

#resetting values
GSS$marijuana_dummy <- recode(GSS$should_marijuana_be_made_legal, 
                             "Legal" = "1",
                             "Not legal" = "0")
GSS$marijuana_dummy <- as.numeric(GSS$marijuana_dummy)

#confirming we did it right
str(GSS$marijuana_dummy)

str(GSS$rs_religious_preference)
table(GSS$rs_religious_preference)

included_religions <- c("Buddhism", "Catholic", "Christian", "Jewish", "Moslem/islam", "None", 
                       "Other", "Protestant")
GSS_subset <- filter(GSS, rs_religious_preference %in% included_religions)

#confirming we did it right
table(GSS_subset$rs_religious_preference)

#fitting the logistic regression with glm(), including family argument for binary data
marijuana_model <- glm(marijuana_dummy ~ rs_religious_preference, data = GSS_subset, family = binomial)
marijuana_model

logodds <- marijuana_model$coefficients[[1]] 
odds <- exp(logodds)
probability <- odds / (1 + odds)
probability

#the Catholic coefficient is the second one, b1
logodds <- marijuana_model$coefficients[[1]] + marijuana_model$coefficients[[2]] 
odds <- exp(logodds)
probability <- odds / (1 + odds)
probability

predict(marijuana_model, GSS_subset[1:10,], type="response")

marijuana_model

#finding DEVnull and DEVresidual from model output
(marijuana_model$null.deviance - marijuana_model$deviance) / marijuana_model$null.deviance


(kidney_model$null.deviance - kidney_model$deviance) / kidney_model$null.deviance
