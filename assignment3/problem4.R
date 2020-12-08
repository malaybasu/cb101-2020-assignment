problem4_domain <- read.table("./problem_2.csv",header=T, sep = ",")
library(dplyr)
problem4_domain <- problem4_domain %>%
  select(Domain, Variation)

problem4_freq <- read.table("./problem_3.csv",header=T, sep = ",")
problem4_freq <- problem4_freq %>%
  select()

merge_data <- merge(variation_p4, abundance, by = "hmmname")
cor.test(x = merge_data$Freq, y = merge_data$Variation , method = "pearson")
library(ggplot2)
ggplot(merge_data, aes(x = merge_data$Freq, y = merge_data$Variation)) + geom_point() +
  geom_smooth(method = 'lm')

```