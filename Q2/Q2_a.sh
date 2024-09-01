#!/bin/bash

#Created a function which generates password
passdGen() {

    #As requiremnets mentioned of password length between 8 to 10
    passLength=$((RANDOM % 3 + 8))

    #Characters used in password
    uCase="ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    lCase="abcdefghijklmnopqrstuvwxyz"
    special="!%&#$@()!"

    #Random selection of password from characters
    password=""
    password+=${uCase:$((RANDOM % ${#uCase})):1}
    password+=${lCase:$((RANDOM % ${#lCase})):1}
    password+=${special:$((RANDOM % ${#special})):1}

    #grouped all the characters
    passChar="$uCase$lCase$special"

    #loop for generation of remaining characters of password, appended the characters to password
    for i in $(seq 1 $((passLength - 3))); do
        password+=${passChar:$((RANDOM % ${#passChar})):1}
    done

    #shuffling of password
    password=$(echo "$password" | fold -w1 | sort -R | tr -d '\n')

    echo "$password"
    
}

password=$(passdGen)
echo "Password: $password"