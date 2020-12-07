# Problem 1
#(a) Calculate the pairwise Pearson correlation of all the variables of this dataset and create a dataframe that has columns like this.

# | var1 | var2 | corr|
# |------|------|-----|
# |Ozone |Solar | 0.4 |

#You can call `data(airquality)` in R. It will generate the following data.

# Install packages and ready dataframe
install.packages("knitr")
library(knitr)
data("airquality")
knitr::kable(head(airquality))

#subset data for for loop
pairs <- combn(names(airquality), 2, simplify=FALSE)
df <- data.frame(var1=rep(0,length(pairs)), var2=rep(0,length(pairs)),
                 Cor=rep(0,length(pairs)))

# For loop
for(i in 1:length(pairs)){
  df[i,1] <- pairs[[i]][1]
  df[i,2] <- pairs[[i]][2]
  df[i,3] <- cor(airquality[,pairs[[i]][1]], airquality[,pairs[[i]][2]], use="pairwise.complete.obs")
}
pairwise.df <- df


head(pairwise.df)

# (b) Using `ggplot` draw the scatterplot of the variables that show the highest 
# correlation. You can arbitrarily choose one of the two variables as independent. 
# Make the scatterplot publication quality. Also calculate the r.sq of the plot and 
# put it on the top of the plot as subtitle of the plot. 


# clean dataframe and remove na values
sort(pairwise.df$Cor, decreasing = TRUE) # highest correlation is between Ozone and Temp.
is.na.data.frame(airquality) # Identify NA values
a <- airquality$Ozone # reassing Ozone values to "a"
a <- a[!is.na(a)] # Remove NA values from a

b <- airquality$Temp



## Apparently geom_point within ggplot can handle NA values.

plot.1 <- ggplot(airquality, aes(x = Ozone, y = Temp))+
  geom_point(na.rm = TRUE)+ 
  ggtitle("Correlation Between Ozone and Temp", subtitle = "Adjusted R-squared = 0.4832")+
  theme(plot.title = element_text(size = rel(2.0), hjust = 0.5))+
  theme(plot.subtitle = element_text(hjust = 0.5))
theme(axis.title = element_text(size = 15.0))

theme_bw()

print(plot.1)

# Calculate r-squared value using linear regression:
air.model <- lm(formula = airquality$Ozone ~ airquality$Temp)
summary(air.model) # Adjusted R2 = 0.4832