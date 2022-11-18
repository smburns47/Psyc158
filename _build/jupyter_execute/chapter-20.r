pretest <- c(71, 73, 83, 93, 74, 84, 70, 88, 64, 100, 67, 72, 63, 86, 81)
posttest <- c(75, 73, 82, 100, 82, 84, 77, 89, 60, 100, 67, 82, 66, 87, 80)
student <- c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15)

test_scores <- data.frame(student, pretest, posttest)
test_scores

score <- c(71, 75, 73, 73, 83, 82, 93, 100, 74, 82, 84, 84, 70, 77, 88, 89, 64, 60, 100, 100,
          67, 67, 72, 82, 63, 66, 86, 87, 81, 80)
timing <- c("before", "post", "before", "post", "before", "post", "before", "post", "before", "post", 
           "before", "post", "before", "post", "before", "post", "before", "post", "before", "post", 
           "before", "post", "before", "post", "before", "post", "before", "post", "before", "post")
student <- c(1, 1, 2, 2, 3, 3, 4, 4, 5, 5, 6, 6, 7, 7, 8, 8, 9, 9, 10, 10, 11, 11, 12, 12, 
            13, 13, 14, 14, 15, 15)

test_scores2 <- data.frame(student, score, timing)
test_scores2

summary(lm(score ~ timing, data = test_scores2))

test_scores$testchange <- test_scores$posttest - test_scores$pretest

test_scores

summary(lm(testchange ~ NULL, data = test_scores))
