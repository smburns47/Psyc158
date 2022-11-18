# This chapter uses packages that takes a few minutes to download on Google Colab. 
# Run this first so it's ready by the time you need it
install.packages("ggformula")
library(ggformula)

install.packages("readr")
library(readr)
fingers <- read_csv("https://raw.githubusercontent.com/smburns47/Psyc158/main/fingers.csv")

thumb_model <-   #use lm() here with the variable "Thumb" in dataset "fingers"
fingers$Thumb_residuals <-  #use resid() here on the generated model
head(fingers)

gf_histogram( ~ Thumb_residuals, data = fingers) %>% 
  gf_vline(., xintercept = mean(fingers$Thumb_residuals))

not_the_mean <- 55

fingers$Thumb_bad_residuals <-  fingers$Thumb - not_the_mean
gf_histogram( ~ Thumb_bad_residuals, data = fingers) %>% 
  gf_vline(., xintercept = mean(fingers$Thumb_residuals)) %>%
  gf_vline(., xintercept = mean(fingers$Thumb_bad_residuals), color = "red")

gf_histogram( ~ Thumb_residuals, data = fingers) %>% 
  gf_vline(., xintercept = mean(fingers$Thumb_residuals))

sum(fingers$Thumb_residuals)

sum(fingers$Thumb_residuals**2)

install.packages("supernova")
library(supernova)

thumb_model <- lm(Thumb ~ NULL, data = fingers)

supernova(thumb_model)

var(fingers$Thumb_residuals)

#same as dividing the sum of squares by N-1
sum(fingers$Thumb_residuals^2) / (length(fingers$Thumb) - 1)

supernova(#YOUR CODE HERE)

11880.211/156

#same as the variance in the residuals, just with rounding error 
var(fingers$Thumb_residuals)

sd(fingers$Thumb_residuals)

#same as taking the square root of variance
sqrt(var(fingers$Thumb_residuals))

#same as dividing the sum of squares by N-1 and then taking the square root
sqrt(sum(fingers$Thumb_residuals^2) / (length(fingers$Thumb) - 1))

gf_histogram( ~ Thumb_residuals, data = fingers) %>% 
  gf_vline(., xintercept = mean(fingers$Thumb_residuals))

fingers$Thumb_scaled <- (fingers$Thumb - mean(fingers$Thumb)) / sd(fingers$Thumb)
fingers$Thumb[2] # value of Zelda's thumb length, in original units
fingers$Thumb_scaled[2] # new value of Zelda's thumb length, in new units

fingers$Thumb[3] 
fingers$Thumb_scaled[3] 

z_model <- lm(Thumb_scaled ~ NULL, data = fingers)
fingers$z_residuals <-  resid(z_model)
head(fingers[,c("Thumb_scaled", "z_residuals")])
