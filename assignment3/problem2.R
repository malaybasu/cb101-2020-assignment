```{r}
library(dplyr)

#download and parse swissvar 
swissvar_test <- read.table("./humsavar.txt", header = F, fill = T)
swissvar <- read.table("ftp://ftp.uniprot.org/pub/databases/uniprot/current_release/knowledgebase/variants/humsavar.txt",header = F,skip = 49, sep = "", fill = T, stringsAsFactors = F, flush = T,nrows=78710)

swissvar_clean<- swissvar[, -ncol(swissvar)]
colnames(swissvar_clean)=c("gene","accnum","FTId","change","variant","dbSNP")

#select for only needed data
swissvar_final <- swissvar_clean %>%
  select(gene,accnum, dbSNP)


##load and select domain file
domain_file = read.table(gzfile("9606.tsv.gz"))
colnames(domain_file) = c("accnum", "align_start", "align_end", "env_start", "env_end", "pfam", "hmm_name", "type", "V9", "V10", "V11", "V12", "V13", "V14")
domain_final <- domain_file %>%
  select(accnum, hmm_name)

join_test <- left_join(swissvar_final, domain_final)


grouped_join <- join_test %>%
  group_by(hmm_name) %>%
  count(hmm_name)

colnames(grouped_join) = c("Domain", "Variation")

final_table <- grouped_join[order(-grouped_join$Variation),]

write.csv(final_table, file = "problem_2.csv", sep = ",")

```