# Exercise 3
```{r}
find . -name "*.faa" | grep "^>*" | sort | uniq -c | wc -l

# the result of this command was 14 proteins which does not seem correct. Nevermind, this yields 14 .faa files. 
echo `cat NC_000913.faa | grep -v "^>" | tr -d "\n" | wc -c`
for i in `find . -name "*.faa"`; 
do cat $i | grep "^>*" | sort | uniq -c | wc -l; 
done;

# this gives me the total number proteins for each file, not the total unique for all files combined. 
382
36
523
23946
23305
541
42
545
21173
368
22531
525
337
39

## Attempted this for average number of proteins but didn't work. 
for i in `find . -name "*.faa"`; 
do echo $(cat $i | grep "^>*" | sort | uniq -c | wc -l)/$(find . -name "*.faa" | wc -l) | bc; # this for loop did not work. Not sure why, but I will attempt to split the commands up and just run them separately.
done;


# total number of ">" will identify total number of proteins. Will need to sort uniq to identify total unique proteins.
cat $(find . -name "*.faa") | grep "^>*" | sort | uniq -c | wc -l

# Total number of unique proteins is 44801.