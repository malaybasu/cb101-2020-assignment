#Problem 4:

# Data have already been filtered for disease variants above. However, I was unable to complete problem 2, so I will write a hypothetical script below:
r.reg <- merge(r.five, r.tally)

#plot data
plot(r.reg$abundance, r.reg$variation)

#perform linear regression
m <- lm(formula = abundance ~ variation, data = r.reg)# lm (y~x)
summary(m)

#plot w/ linear regression model
{plot(iris$Petal.Length, iris$Sepal.Length)}
abline(m)

#perform correlation analysis
cor.test(r.reg$abundance, r.reg$variation)