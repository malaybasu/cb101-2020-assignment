```{bash}
curl -O ftp://ftp.ebi.ac.uk/pub/databases/Pfam/current_release/proteomes/9606.tsv.gz

#gunzip 9606.tsv.gz
```
```{r}
args <- commandArgs(trailingOnly = T)
file <- args[1] #"9606.tsv.gz"
accnum <- args[2] #"A0A024QZ18"
location <- as.integer(args[3]) #"75"

#I changed the example to one that would work


#gunzip and read in the file
#data_table = read.table(gzfile(paste0("./9606.tsv.gz")), header=F)
data_table = read.table(gzfile(paste(file)), header=F)

#filter for only the accnum of interest
#by_accnum = data_table[which(data_table[ ,1] == "A0A024QZ18"), ]
by_accnum = data_table[which(data_table[,1]==accnum),]


#extract and save envelope start and end
env_start=as.numeric(by_accnum[4])
env_end=as.numeric(by_accnum[5])


#if else statement to see if location is within envelope
#if(75>=env_start && 75<=env_end){
#  cat(paste0(as.matrix(by_accnum[7]),"\n"))
#}else{
#  break()
#}

if(location >= env_start && location <= env_end){
  cat(paste(as.matrix(by_accnum[7]),"\n"))
}else{
  break()
}

####script saved as problem3_1.R