#!/bin/bash

#creates directory
mkdir temp_activity

#creates 50 files
eval "touch temp_activity/temp{1..50}.sh"

#renames first 25 file types from txt to sh
for file in temp_activity/temp{1..25}.sh; do
    mv "$file" "${file%.sh}.txt"
done