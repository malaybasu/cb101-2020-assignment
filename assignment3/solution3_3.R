#Problem 3:

# A) list top five genes that are mutated in human disease

# count the instnaces of mutation
r.five <- r %>% 
  group_by(V5 = "disease") %>% 
  count(r$V1) %>% 
  arrange(desc(n))

head(r.five) # 5 most common disease-casuing mutations reside in TP53, F8, SCN5A, SCN1A, and FBN1


# B) plot the frequency distribution.

plot.1 <- ggplot(r.five, aes(x = n))+
  geom_histogram()

plot.1

# C) Calculate mean number of variants per gene

r.stats <- r.five %>% 
  summarise(mean.var = mean(n))

r.stats


# plot vertical red line on graph

plot.2 <- ggplot(r.five, aes(x = n))+
  geom_histogram()+
  geom_vline(xintercept = 6.194711, color = "red")

plot.2