###Problem 1:

# Read in file to understand the structure of the table
domain <- read.table("9606.tsv.gz")
dim(domain)
str(domain)

# subset data frame to include categories of interest

domain.loop <- domain[c("V1", "V4", "V5", "V7")]

# Write for loop for solution. My understanding is you want this program to perform 
# it's function for any given domain at any envelope location. 

for (i in 1:(ncol(domain.loop))) {
  for (j in 1:(ncol(domain.loop))) {
    for (k in 1:(ncol(domain.loop))){
      
    }
  }
}
if(j > domain.loop$V4) {
  if(k < domain.loop$V5){
    cat(paste(i, j, k, sep = "\t"))
  }
}
