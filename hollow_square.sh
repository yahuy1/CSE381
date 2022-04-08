#!/bin/bash

# Print first line
if [[ $2 -gt 0 ]]
then
    for (( i = 1; i <= $2; i++ ))
    do
        echo -n "$1"
    done
    echo ""
fi

# Print 2 ... n - 1 line
for (( i = 2; i < $2; i++ ))
do
    echo -n "$1"
    for (( j = 2; j < $2; j++ ))
    do
        echo -n " "
    done
    echo "$1"
done

# Print last line
if [[ $2 -gt 1 ]]
then
    for (( i = 1; i <= $2; i++ ))
    do
        echo -n "$1"
    done
    echo ""
fi
echo ""