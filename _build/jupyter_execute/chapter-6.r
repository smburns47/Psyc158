library(readr)
fingers <- read_csv("fingers.csv")

library(ggformula)
gf_histogram(~ Thumb, data=fingers)

gf_histogram(~ Thumb, data = fingers, fill = ~ Sex)

# graphics plots can be saved as objects; when you do, they won't automatically print to the console
thumb_by_sex <- gf_histogram(~ Thumb, data = fingers, fill = ~ Sex)
gf_refine(thumb_by_sex, scale_fill_manual(values = c("purple", "orange")))

gf_histogram(~ Thumb, data = fingers, fill = ~ Sex) %>%
    gf_refine(., scale_fill_manual(values = c("purple", "orange")))

gf_histogram(~ Thumb, data = fingers) %>% 
  gf_facet_grid(., ~ Sex)

gf_histogram(~ Thumb, data = fingers) %>% 
  gf_facet_grid(., Sex ~ .)

# Modify this code to create density histograms
gf_histogram(~ Thumb, data = fingers) %>%
gf_facet_grid(., Sex ~ .)


# Write your code here to plot histograms of thumb and another variable


gf_histogram(~ Thumb, data = fingers) %>% 
  gf_facet_grid(., Year ~ .) 

gf_dhistogram(~ Thumb, data = fingers, fill = ~ RaceEthnic) %>% 
  gf_facet_grid(., RaceEthnic ~ .) 

library(dplyr)
mindsetmatters <- read_csv('mindsetmatters.csv')
mindsetmatters$WtLost <- (mindsetmatters$Wt - mindsetmatters$Wt2) < 0 
head(select(mindsetmatters, Condition, WtLost))

gf_bar(~ WtLost, data = mindsetmatters)

# Create a bar graph of WtLost, then use gf_facet_grid() to compare the outcome across groups of Condition


gf_point(Thumb ~ Sex, data = fingers)

gf_point(Thumb ~ Sex, data = fingers, color = "orange", size = 5) 


#Can you tell how many people have each explanatory/outcome pairing?
gf_point(MathAnxious ~ Interest, data=fingers, color = "blue")

gf_jitter(MathAnxious ~ Interest, data = fingers, color = "blue") 

gf_jitter(MathAnxious ~ Interest, data = fingers, color = "blue", width = 0.1, height = 0.1) 

gf_jitter(MathAnxious ~ Interest, data = fingers, color = "blue", size = 3, alpha = 0.2, width = 0.1, height = 0.1) 

# Play around with gf_jitter


gf_jitter(Sex ~ Thumb, data = fingers, color = "orange", size = 3, height = 0.2) 


gf_point(Thumb ~ Height, data=fingers)

gf_boxplot(Thumb ~ Sex, data = fingers)

gf_boxplot(Thumb ~ Sex, data = fingers, color = "orange")

gf_boxplot(Thumb ~ Sex, data = fingers, color = "orange") %>%
    gf_jitter(.)

# Modify this boxplot to look at Thumb length varying by Job instead of Sex
gf_boxplot(Thumb ~ Sex, data = fingers, color = ~ Sex) %>%
gf_jitter(., height = 0, color = "gray", alpha = .5, size = 3)

