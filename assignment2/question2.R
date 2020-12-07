
#BiocManager::install("Biostrings")
library(Biostrings)
library(stringr)

###write fild containing homologene ID of gene##
##Load homologene data
#ids <- "~/CB2-101/test_class/assignment2/homologene.data"

##read homologene data as a table
#ids <- read.table(ids, stringsAsFactors = F, header = F, fill = T)

##Search for your ID of interest V1=HomologeneID
#ids <- ids[ids$V1 == "460",]

##pull out the IDs you want (row 1 is human)
#ids <- ids$V6[c(1)]

##write the ID(s) of interest to a table
#write.table(ids, "human_tp53.ids", quote = F, row.names = F, col.names = F)

##fasta arg is fasta file of choice
##ids arg is ids of choice
##save output file as .fas

args <- commandArgs(trailingOnly = T)
fasta <- args[1]
ids <- args[2]
outfile <- args[3]

# Read fasta and extract ids
seqs <- readAAStringSet(fasta)
idset <- names(seqs)

pattern <- "^(\\S+)\\."
matches <- str_match(idset, pattern)
idset <- matches[,2]

# Read required id files
required_ids <- read.table(ids, stringsAsFactors = F, header = F, fill = T)
matches <- str_match(required_ids$V1, pattern = pattern)
required_ids <- matches[,2]

# Which ids matches
matching_index <- which(idset %in% required_ids)

# Subset the fasta files
seq_subset <- seqs[matching_index]

# Write out the subset as fasta
writeXStringSet(seq_subset, outfile)
