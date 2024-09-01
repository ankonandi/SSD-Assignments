#!/bin/bash

# 1a Removes empty lines and generate a quotes_empty.txt file.
grep -v '^$' quotes.txt > quotes_empty.txt

# 1b Removes duplicates and generate a quotes_rdup.txt file.
awk '!seen[$0]++' quotes_empty.txt > quotes_rdup.txt

# 1c Counts number of quotes by personality and print them in quotes_byperson.txt file 
awk -F '~' '{ if ($2) count[$2]++ } END { for (person in count) print person ": " count[person] }' quotes_rdup.txt > quotes_byperson.txt

# 1d Lists all the words in the file that starts with ‘s’ and doesn’t follow by ‘a’
grep -o '\bs[^aA ][^ ]*\b' quotes.txt > quotes_s.txt

