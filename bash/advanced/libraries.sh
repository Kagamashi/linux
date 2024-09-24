#!/bin/bash

# A simple function that prints a greeting
greet() {
    echo "Hello, $1!"
}

# A function that calculates the sum of two numbers
sum() {
    local num1=$1
    local num2=$2
    echo "The sum of $num1 and $num2 is $((num1 + num2))"
}

# A function that displays the current date
display_date() {
    echo "Today's date is: $(date)"
}


### Use library in another script .sh file (MAIN script)
# Source the library file to use its functions
source ./my_library.sh

# Call the greet function from the library
greet "Alice"

# Call the sum function from the library
sum 5 10

# Call the display_date function from the library
display_date
