#Assignment1
##problem1
###P1_step1
```
wget ftp://ftp.ebi.ac.uk/pub/databases/Pfam/current_release/proteomes/9606.tsv.gz
```
###P1_step2
```
zcat 9606.tsv.gz | grep -v ^# | cut -f6 | sort | uniq | wc -l 
```
##problem2
```
wget -r -np -nH --cut-dirs=4 -A faa "ftp://ftp.ncbi.nlm.nih.gov/genomes/archive/old_refseq/Bacteria/Yersinia_pestis*"
```
##problem3
```
cd Yersinia_pestis_Z176003_uid47317
find . -name "*.faa" -exec cat {} \; | grep ">" | wc -l
```
##problem4
###P4_step_a
```
cat NC_000913.faa | grep -v "^>" | tr -d "\n" | wc -c
cat NC_000913.faa | grep "^>" | wc -l 
echo "1311795/4140" | bc
```
###p4_step_b
```
echo $(cat NC_000913.faa | grep -v "^>" | tr -d "\n" | wc -c)/$(cat NC_000913.faa | grep "^>" | wc -l) |bc
```
