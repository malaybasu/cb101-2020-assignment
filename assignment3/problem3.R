swissvar <- read.table("ftp://ftp.uniprot.org/pub/databases/uniprot/current_release/knowledgebase/variants/humsavar.txt",header = F,skip = 49, sep = "", fill = T, stringsAsFactors = F, flush = T,nrows=78710)

swissvar_clean<- swissvar[, -ncol(swissvar)]
colnames(swissvar_clean)=c("gene","accnum","FTId","change","variant","dbSNP")

write.csv(swissvar_clean, "problem_3.csv")

library(dplyr)

#selected only gene name and variant type
#filtered for only disease causing variants
#grouped by gene
#counted variants for each gene
#arranged in desc order
#only top 5
top5 <- swissvar_clean %>%
  select(gene, variant) %>%
  filter(swissvar_clean$variant == "Disease") %>%
  group_by(gene) %>%
  count(variant) %>%
  arrange(desc(n)) %>%
  head(n=5)

library(ggplot2)

plot <- swissvar_clean %>%
  select(gene, variant) %>%
  filter(swissvar_clean$variant == "Disease")

ggplot(plot, aes(gene)) +
  geom_bar()

calc <- swissvar_clean %>%
  select(gene, variant) %>%
  filter(swissvar_clean$variant == "Disease") %>%
  group_by(gene) %>%
  count(variant)

summary(calc)
#length of gene list 3011
#sum of n = 31177
ave_variants_per_gene <- (sum(calc$n))/(length(calc$gene))
ave_variants_per_gene #=10.354

ggplot(plot, aes(gene)) +
  geom_bar() +
  geom_hline(yintercept = (sum(calc$n))/(length(calc$gene)), color = "red")


```