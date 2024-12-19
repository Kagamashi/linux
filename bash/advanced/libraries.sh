
# ./my_library.sh
greet() {
    echo "Hello, $1!"
}

sum() {
    local num1=$1
    local num2=$2
    echo "The sum of $num1 and $num2 is $((num1 + num2))"
}

display_date() {
    echo "Today's date is: $(date)"
}

###

# ./main.sh
# use library in another script .sh file (MAIN script)
source ./my_library.sh  # source library file to use its functions
greet "Alice"
sum 5 10
display_date
