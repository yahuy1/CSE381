#!/bin/bash

for (( i = 1; i <= $2; i++ ))
do
    for (( j = 1; j <= $2; j++ ))
    do
        if [[ $j -eq $i ]]  
        then
            echo -n "$1"
        else 
            echo -n " "
        fi
    done
    echo ""
done
echo ""