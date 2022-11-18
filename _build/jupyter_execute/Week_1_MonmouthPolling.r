# This code will load the R packages we will use

suppressPackageStartupMessages({
    library(dplyr)
    library(ggformula)
    library(mosaic)})

font_size = function (size) {
    theme(text = element_text(size = size))}

#change the numbers below to correspond to your guesses
zeros <- 0
ones <- 0
twos <- 0
threes <- 0
fours <- 0
fives <- 250
sixes <- 0
sevens <- 0
eights <- 0
nines <- 0
tens <- 0

#you don't need to change anything past here
#check the sum is equal to 250
sum(zeros, ones, twos, threes, fours, fives, sixes, sevens, eights, nines, tens)

#create a histogram of your expectations
flipguess <- data.frame(guess = c(rep(0, times = zeros), rep(1, times = ones), 
                                  rep(2, times = twos), 
                                  rep(3, times = threes), rep(4, times = fours), 
                                  rep(5, times = fives), rep(6, times = sixes),
                                  rep(7, times = sevens), rep(8, times = eights),
                                  rep(9, times = nines), rep(10, times = tens)))
gf_histogram(~guess, data = flipguess, binwidth = 1) + scale_x_continuous(breaks = 1:10)
