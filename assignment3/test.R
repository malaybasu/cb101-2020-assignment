test <- 

args <- commandArgs(trailingOnly = T)

file <- args[1]
accnum <- args[2] #$V1
location <- args[3] 
#hmm_name = $V7

read.table('file', sep = '\t', header = F, fill = T)


test2 <- as.list.data.frame(test$V1, test$V4, test$V5, test$V7)

for(accnum in 1:length(test2)) {
  print(test2[accnum])
}