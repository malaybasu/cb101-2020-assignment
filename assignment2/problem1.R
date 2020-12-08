data("airquality")
knitr::kable(head(airquality))

```
(a) Calculate the pairwise Pearson correlation of all the variables of this dataset and create a dataframe that has columns like this.

| var1 | var2 | corr|
  |------|------|-----|
  |Ozone |Solar | 0.4 |
  
  ```{r}
head(airquality)

correlation_matrix <- cor(airquality, method = "pearson", use = "pairwise.complete.obs")

library(Hmisc)

format_df_test <- function(cormat) {
  ut <- upper.tri(cormat)
  data.frame(
    var1 = rownames(cormat)[row(cormat)[ut]], 
    var2 = rownames(cormat)[col(cormat)[ut]], 
    corr = (cormat)[ut]
  )
}

formated_table <- format_df_test(correlation_matrix)
formated_table
knitr::kable(formated_table, digits = 2)

```


(b) Using `ggplot` draw the scatterplot of the variables that show the highest correlation. You can arbitrarily choose one of the two variables as independent. Make the scatterplot publication quality. Also calculate the r.sq of the plot and put it on the top of the plot as subtitle of the plot. 
```{r}

library(ggplot2)
#install.packages("ggpmisc")
library(ggpmisc)

my.formula <- y ~ x
ggplot(data = airquality, aes(x = Ozone, y = Temp)) +
  geom_smooth(method = "lm", se=FALSE, formula = my.formula) +
  stat_poly_eq(formula = my.formula, 
               aes(label = paste(..rr.label.., sep = "~~~")), 
               parse = TRUE) +
  geom_point() +
  ggtitle("Temperature Generally Increases with Ozone") +
  theme(plot.title = element_text(hjust = 0.5)) +
  labs(y = "Temperature")
