#!/bin/bash

# For loop: looping over lists
# Syntax: for var in list; do commands; done
for fruit in apple banana cherry; do
    echo "I like $fruit"
done

# For loop: looping over a range of numbers
# Syntax: for var in {start..end}; do commands; done
for num in {1..5}; do
    echo "Number: $num"
done

# While loop
# Syntax: while [ condition ]; do commands; done
counter=1
while [ $counter -le 5 ]; do
    echo "Counter is at $counter"
    ((counter++))
done

# Until loop
# Syntax: until [ condition ]; do commands; done
counter=1
until [ $counter -gt 5 ]; do
    echo "Until loop, counter is at $counter"
    ((counter++))
done

# Loop control: break and continue
for num in {1..10}; do
    if [ $num -eq 5 ]; then
        echo "Breaking at $num"
        break
    fi

    if [ $num -eq 3 ]; then
        echo "Skipping number $num"
        continue
    fi

    echo "Number: $num"
done
