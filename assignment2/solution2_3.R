library(seqinr)
library(Biostrings)
library(protr)

#Read blosum62 table - reads in as a data frame.

blosum <- read.table("BLOSUM62", header = TRUE)
blosum
str(blosum)
dim(blosum)

# Read in the ex_align.fas file - reads in as a list.
readAAStringSet()

example <- read.fasta("ex_align.fas", as.string = TRUE, seqtype = "AA")
example
str(example)

example.ff <- readAAStringSet(example, skip = "-") # I can't read the sequences and I don't understand why.Receive an eroror of "filepath must be character vector with no NAs"
seq.name <- names(example)
sequence <- paste(example)

ex.split <- split(x = example$P1, f = example$P2)
ex.split

readAAStringSet(ex.split) # will not read data even when split into just P1 sequence. 

# Since I canont read the sequence I will instead just write a generic for loop that resembles the one I would write for the actual data.

loop <- rep(seq.name,sequence)

for (i in 1:x){
  loop [i] <- blosum[sequence[1,i], sequence [2,1]]
  cat(loop)
}

