```{bash}
curl -O ftp://ftp.ncbi.nih.gov/blast/matrices/BLOSUM62
```


```{r}
library(Biostrings)
#install.packages("seqinr")
library(seqinr)

data("BLOSUM62")
str(BLOSUM62)


test <- readAAStringSet("~/CB2-101/test_class/assignment2/ex_align.fas")

pattern <- AAString(test$P1)
subject <- AAString(test$P2)

pal <- pairwiseAlignment(pattern, subject, substitutionMatrix="BLOSUM62", gapOpening=0, gapExtension=0)


```