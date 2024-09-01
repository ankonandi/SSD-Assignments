#!/bin/bash

mkdir temp_activity

eval "touch temp_activity/temp{1..50}.sh"

for file in temp_activity/temp{1..25}.sh; do
    mv "$file" "${file%.sh}.txt"
done