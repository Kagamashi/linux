
greet() {
    echo "Hello, $1!"
}
greet "Alice"   # call function and pass an argument

# function with multiple arguments
sum() {
    local num1=$1  # Local variable
    local num2=$2  # Local variable
    echo "The sum of $num1 and $num2 is $((num1 + num2))"
}

# Calling the sum function with two arguments
sum 5 10

# Local vs Global Variables
global_var="I am global"

my_function() {
    local local_var="I am local"
    echo "Inside the function: $local_var"
    echo "Inside the function: $global_var"
}

my_function

# The local variable is not accessible outside the function
echo "Outside the function: $local_var"  # Will not print anything
echo "Outside the function: $global_var"  # Will print the global variable

# Returning values from functions
return_value_function() {
    local result=$(( $1 * 2 ))  # Double the input argument
    echo $result  # Functions in Bash return values by outputting them with echo
}

# Capture the return value by command substitution
result=$(return_value_function 6)
echo "The result from the function is: $result"
