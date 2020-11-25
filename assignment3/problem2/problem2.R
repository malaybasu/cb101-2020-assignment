### read data file
setwd("/media/sf_emmahuang/Download/course/CBS101/CBS101_assignment/assignment3/problem2/")
file="../data/9606.tsv.gz"
varFile="../data/humsavar.txt"

#test on data
#ID='O95931'
#domain=as.numeric(20)
#setwd("/media/sf_emmahuang/Download/course/CBS101/CBS101_assignment/assignment3/problem2/")

data=read.table(gzfile(paste0(file)), header=F)
varData=read.table(gzfile(paste0(varFile)), header=F,fill=T)

### clean data
varDataClean=varData[53:nrow(varData),]
colnames(varDataClean)=c("geneName","AC","FTId","AAchange","Type","dbSNP","Disease")

### merge data
mergeData=merge(data,varDataClean,by.x="V1",by.y="AC",all.x=T)

### name the columns
countTbl=rep(0,length(countTbl))
names(countTbl)=unique(mergeData$V7)

### remove NA from the AA change column
mergeDataMoveNA=mergeData[complete.cases(mergeData$AAchange),]

### sort table
tbl=table(mergeDataMoveNA$V7)
tblSorted=tbl[order(tbl,decreasing = T)]
tblSortedNew=cbind(names(tblSorted),tblSorted)
colnames(tblSortedNew)=c("Domain","Variations")

### print result
for(i in 1:nrow(tblSortedNew)){
  cat(paste(tblSortedNew[i,1],tblSortedNew[i,2],"\n"))
}
write.table(tblSortedNew,"variation.txt",row.names = F,col.names = T,quote=F)

