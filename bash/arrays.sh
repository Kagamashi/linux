#!/bin/bash

# Declaring an array
fruits=("apple" "banana" "cherry" "date")

# Accessing array elements
echo "First element: ${fruits[0]}"
echo "Second element: ${fruits[1]}"

# Iterating over arrays
for fruit in "${fruits[@]}"; do
    echo "I like $fruit"
done

# Array length
length=${#fruits[@]}
echo "The array contains $length elements"

# Array slicing
# Syntax: ${array[@]:start:length}
# Start at index 1 and get 2 elements
sliced_fruits=("${fruits[@]:1:2}")
echo "Sliced array (from index 1, length 2): ${sliced_fruits[@]}"

# Another example: starting from the second element and getting the remaining ones
remaining_fruits=("${fruits[@]:2}")
echo "Remaining fruits from index 2: ${remaining_fruits[@]}"
