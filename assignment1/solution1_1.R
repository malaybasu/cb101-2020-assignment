# Exercise 1

# code written in Linux Terminal
wget (ftp://ftp.ebi.ac.uk/pub/databases/Pfam/current_release/proteomes/)

cd github/cb101-2020-assignment/assignment1/
  
cat index.html | cut -f6 | sort | uniq -c| wc -l