#Problem 2:

library(tidyverse)
# Read in "humsavar.txt" file
r <- read.table( "ftp://ftp.uniprot.org/pub/databases/uniprot/current_release/knowledgebase/variants/humsavar.txt", header = F,
                 skip = 49, sep = "", fill = T,
                 stringsAsFactors = F, flush = T,
                 nrows=78710)
r<- r[, -ncol(r)]

# make domain.loop dataframe simple and only one column.
domain.id <- domain["V7"]

# Simplify "r" data frame.
r.id <- r["V2"]

r.combined <- rbind(r.id, domain.id)

# Cannot seem to get dataframes to merge together. Had they merged, I would do the 
#following after renaming the columns to fit the question:

r.tally <- r.combined %>% 
  group_by(Domain) %>% 
  count(Variation) %>% 
  arrange(desc())