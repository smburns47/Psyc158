suppressPackageStartupMessages({
    library(dplyr)
    library(ggformula)
    library(mosaic)
    library(supernova)
    library(lsr)})

feardata <- read.csv("https://bit.ly/3pXyGSW", header = TRUE, sep = ",")
colnames(feardata)[1:2] <- c("Fear.General", "Enjoyment.General")
head(feardata)

#Type code for plot here

cor(Fear.Zombies~Enjoyment.Zombies, data= feardata)
cor(Fear.Piggy~Enjoyment.Piggy, data= feardata)
cor(Fear.Scientist~Enjoyment.Scientist, data= feardata)
cor(Fear.General~Enjoyment.General, data= feardata)

# Write your code here

# Write your code here

# Write your Code here

#add some code to save the predictions
gf_point(tengrouppred~EXPLANATORYVARIABLE)
