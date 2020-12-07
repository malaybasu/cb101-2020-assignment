# Exercise 4

# A)
wget ftp://ftp.ncbi.nlm.nih.gov/genomes/archive/old_refseq/Bacteria/Escherichia_coli_K_12_substr__MG1655_uid57779/NC_000913.faa

cat NC_000913.faa | grep "^>" | wc -l # 4140, denominator of total proteins

cat NC_000913.faa | grep -v "^>" | wc -c # 1332576 is for characters. This includes return spaces, however.

cat NC_000913.faa | grep -v "^>" | tr -d "\n" | wc -c # 1311795 characters (amino acids), excluding spaces.

echo `cat NC_000913.faa | grep -v "^>" | tr -d "\n" | wc -c` # echo with backticks means echo (expression/variable to be made) of what's inside the backtick and print the product of the expression/outcome as a variable.  

echo $(cat NC_000913.faa | grep -v "^>" | tr -d "\n" | wc -c)/$(cat NC_000913.faa | grep "^>" | wc -l) | bc # combine the 2 commands to divide number of amino acids by total number of proteins.

# 316 amino acids is average protein length

#B) ### for any .faa files ### 

echo $(cat *.faa | grep -v "^>" | tr -d "\n" | wc -c)/$(cat *.faa | grep "^>" | wc -l) | bc

# just replaced the file name with *.faa