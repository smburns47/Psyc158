# This chapter uses some packages that take a few minutes to download on Google Colab. 
# Run this first so it's ready by the time you need it
install.packages("readr")
install.packages("ggformula")
library(readr)
library(ggformula)

fingers <- read_csv("https://raw.githubusercontent.com/smburns47/Psyc158/main/fingers.csv")

#Write your code here for making a boxplot of Thumb ~ RaceEthnic, with varying colors


#Write your code here for making a violin plot of Thumb ~ RaceEthnic


# Make at least one change to this plot to make the data stand out better
gf_point(Middle ~ Sex, data = fingers, color = "orange", size = 5) 


# Switch this to a better plot type, and make the group colors different
gf_point(Middle ~ Sex, data = fingers, color = "orange", size = 5) 


gf_point(Middle ~ Thumb, data = fingers) %>% 
    gf_refine(., coord_cartesian(ylim = c(0,140))) #the argument ylim takes a vector 
                                                 #defining the min and max of the axis

gf_point(Middle ~ Thumb, data = fingers) %>%
    gf_refine(., coord_cartesian(ylim = c(0, 200), xlim = c(0,200))) 

install.packages("dplyr")
library(dplyr)

filter(fingers, RaceEthnic %in% c("Asian","White")) %>%
    gf_bar( ~ RaceEthnic, data = .)      #piping the filtered data to the data argument

filter(fingers, RaceEthnic %in% c("Asian","White")) %>%
    gf_bar( ~ RaceEthnic, data = .) %>%
    gf_refine(., coord_cartesian(ylim = c(48, 56)))


gf_jitter(MathAnxious ~ Interest, data = fingers, height = 0.1, width = 0.1)

gf_jitter(MathAnxious ~ Interest, data = fingers, height = 0.1, width = 0.1, xlab = "Interest in Statistics")

gf_jitter(MathAnxious ~ Interest, data = fingers, height = 0.1, width = 0.1, 
          xlab = "Interest in Statistics", ylab = "Math Anxiety")

gf_jitter(MathAnxious ~ Interest, data = fingers, height = 0.1, width = 0.1, 
          xlab = "Interest in Statistics", ylab = "Math Anxiety", title = #YOUR CODE HERE)

gf_jitter(Thumb ~ Sex, data = fingers, width = 0.2, height = 0, color = ~ Sex, alpha = .5, size = 3) %>%
    gf_labs(.,
        title = "YOUR TITLE HERE",
        subtitle = "give it a subtitle",
        color = "rename the legend",
        x = "x-label",
        y = "what's here?",
        caption = "describe the point of this plot"
      )

gf_histogram(~ Thumb, data = fingers, fill = ~ Sex) %>%
    gf_refine(., scale_fill_manual(values = c("purple", "orange")))

install.packages("viridis") 
library(viridis)            

viridis(5)

gf_histogram(~ Thumb, data = fingers, fill = ~ Sex) %>%
    gf_refine(., scale_fill_viridis(discrete = TRUE))

gf_point(Middle ~ Thumb, data = fingers, color = ~ Thumb, size = 3) %>%
    gf_refine(., scale_color_viridis(discrete = FALSE)) #FALSE is the default value, so not required to add it here

gf_point(Middle ~ Thumb, data = fingers, color = ~ Thumb, size = 3) %>%
    gf_refine(., scale_color_viridis(discrete = FALSE, option = "magma"))

colorpalette <- viridis(5, option = "plasma")
print(colorpalette)

#using the 2nd and 4th generated colors
gf_histogram(~ Thumb, data = fingers, fill = ~ Sex) %>%
    gf_refine(., scale_fill_manual(values = c(colorpalette[2], colorpalette[4])))

#using the 3rd and 5th generated colors
gf_histogram(~ Thumb, data = fingers, fill = ~ Sex) %>%
    gf_refine(., scale_fill_manual(values = c(colorpalette[3], colorpalette[5])))
