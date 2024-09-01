#!/bin/bash

#running loop in current diretory
for dir in */; do

    #checking if directory and printing the size
    [ -d "$dir" ] && echo -e "${dir%/}\t$(du -sh "$dir" | cut -f1)"
    
#sorting the output
done | sort -h -k2