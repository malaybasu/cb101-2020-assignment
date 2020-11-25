### read data
setwd("../problem3/")
file="../data/9606.tsv.gz"
data=read.table(gzfile(paste0(file)), header=F)

### extract data
extractData=data[,c(1,7)]
extractDataRemoveNA=extractData[complete.cases(extractData$V1),]

### sort table
tbl=table(extractDataRemoveNA$V7)
tblSorted=tbl[order(tbl,decreasing = T)]
tblSortedNew=cbind(names(tblSorted),tblSorted)
colnames(tblSortedNew)=c("Domain","Abundance")

### print result
for(i in 1:nrow(tblSortedNew)){
  cat(paste(tblSortedNew[i,1],tblSortedNew[i,2],"\n"))
}
write.table(tblSortedNew,"abundance.txt",row.names = F,col.names = T,quote=F)

