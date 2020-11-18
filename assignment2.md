---
title: "FengyuanHuang_Assignment2"
output: github_document
---
# Problem 1
You can call `data(airquality)` in R. It will generate the following data.
```{r}
data("airquality")
knitr::kable(head(airquality))
```
(a) Calculate the pairwise Pearson correlation of all the variables of this dataset and create a dataframe that has columns like this.
| var1 | var2 | corr|
|------|------|-----|
|Ozone |Solar | 0.4 |
```{r}
res=NULL
for (i in 1:(ncol(airquality)-1)){
  for (j in (i+1):(ncol(airquality))){
    res=rbind(res,c(colnames(airquality)[i],colnames(airquality)[j],cor.test(airquality[,i],airquality[,j], method = "spearman")$estimate
                    ))
  }
}
      
res_df=as.data.frame(res)
colnames(res_df)=c('var1','var2','corr')
#print(res_df)
write.csv(res_df, "airquality_cor_df.csv", quote = F)
 
```

(b) Using `ggplot` draw the scatterplot of the variables that show the highest correlation. You can arbitrarily choose one of the two variables as independent. Make the scatterplot publication quality. Also calculate the r.sq of the plot and put it on the top of the plot as subtitle of the plot. 
```{r}
library(ggplot2)
summary(lm(Ozone ~ Temp, data=airquality))
g <- ggplot(airquality, aes(Ozone, Temp))
g + geom_point() + 
  geom_smooth(method="lm", se=F) +
  labs(subtitle="R_sq =48.77%", 
       y="Ozone", 
       x="Temp", 
       title="Scatterplot with Ozone and Temp")+
  theme_bw() + theme(panel.border = element_blank(), panel.grid.major = element_blank(),
                     panel.grid.minor = element_blank(), axis.line = element_line(colour = "black")) + 
  theme(plot.title = element_text(hjust = 0.5),
        plot.subtitle = element_text(hjust = 0.5))
                     

       
```

# Problem 2
Write an R script that takes two arguments: (1) a fasta file name, (2) a sequence ID. The script should print out the sequence matching the id in FASTA format to the terminal.
###fasta parsing
```{r}
#BiocManager::install("seqinr")
library(seqinr)
library(stringr)

unipro<- read.fasta("/media/sf_emmahuang/Downloads/course/CBS101/test_class/assignment2/uniprot_sprot.fasta.gz",seqtype = "AA", as.string = T)
pattern<-"\\S+\\|(\\S+)\\|\\S+"
matches<-str_match(string=names(unipro),pattern=pattern)
ids <-matches[,2]
vogel_ids<-read.table("/media/sf_emmahuang/Downloads/course/CBS101/test_class/assignment2/reviewed.txt")
vogel_ids <-vogel_ids[,1]
subset_unipro<-unipro[ids %in% vogel_ids]
write.fasta(subset_unipro,names=names(subset_unipro), file.out="R_retrieve_uniprot_sprot_reviewsed.fas")
```
# Problem 3

Using `wget` download BLOSUM62 matrix from NCBI FTP server (ftp://ftp.ncbi.nih.gov/blast/matrices/BLOSUM62). Process it in anyway you can and read it in R as a matrix, a dataframe, or a list. You should store the data such a way that you can call the score given two amino acids as key as a fast lookup table. Read the accompanied `ex_align.fas` file and calculate the score of the given alignment. Consider each indel has score 0. The alignment file is in aligned fasta format.

Tips: You need to use either `seqnir` or `Biostrings` package and loop through each position in the alignment. 
```{r}
library(seqinr)
matrix<-read.table("/media/sf_emmahuang/Downloads/course/CBS101/test_class/assignment2/BLOSUM62", fill = T)
### * in columnname is unreadable, make it readable
colnames(matrix)<-gsub("X.",'*',colnames(matrix))
##make two vectors to storge two AA and relative values
pname<-c()
value<-c()
for (i in (1:ncol(matrix))) {
  for (j in (1:nrow(matrix))){
    pname<-rbind(paste0(colnames(matrix)[i],colnames(matrix)[j]),pname)
    value<-rbind(matrix[i,j],value)
  }
}

##the final AA and values in "value" data frame 
rownames(value)=pname

##calculate the score of given alignment
fa<- read.fasta("/media/sf_emmahuang/Downloads/course/CBS101/test_class/assignment2/ex_align.fas",seqtype = "AA", as.string = T)
P1<-getSequence(fa$P1)
P2<-getSequence(fa$P2)
align<-paste0(P1,P2)
sumM=0
for (i in 1:length(align)) {
  if (grepl("-",align[i])){
  }else{
    #print(align[i])
    #print(value[align[i],])
    sumM=sumM+value[align[i],]
 }
}
print(sumM)

```



