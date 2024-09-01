#!/bin/bash

#Function for generation of account number
genAccNum() {

    #As requiremnets mentioned of account number length between 12 to 14
    length=$((RANDOM % 3 + 12))

    #function to check if number is fibonacci
    isFibonacci() {
        n=$1
        #loop to check if number is fibonacci
        len=${#n}
        for((i=2; i<$len; i++)); do
            a=${n:$((i-2)):1}
            b=${n:$((i-1)):1}
            c=${n:$i:1}

            if ((a + b ==c)); then
                return 0;
            fi
        done
        return 1;
    }

    #function to check if number has repeated digits
    repeated() {
        accNum=$1
        #loop to check if number has repeated digits
        for digit in {0..9}; do
            count=$(echo "$accNum" | grep -o "$digit" | wc -l)
            if ((count > 2)); then
                return 1
            fi
        done
    }

    #Loop for account number generation
    while true; do
        accNum=""
        accNum+=$((RANDOM % 9 + 1))
        
        for i in $(seq 2 $length); do
            accNum+=$((RANDOM % 10))
        done

        if isFibonacci $accNum; then
            continue
        fi

        if [[ "$accNum" =~ ([0-9])\1\1 ]]; then
            continue
        fi

        if ! repeated $accNum; then
            continue
        fi

        break
    done

    echo "$accNum"
}

accNum=$(genAccNum)
echo "Account Number: $accNum"