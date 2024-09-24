#!/bin/bash

# 1. Declaring Variables
# Variables in Bash are assigned without spaces between the variable name, the equals sign, and the value.
my_var="Hello, World"

# 2. Environment Variables
# Environment variables are available to sub-processes and can be exported to make them global.
export MY_ENV_VAR="I am an environment variable"

# 3. Special Variables
$0  # The name of the script itself
$1, $2, ... # Positional parameters representing command-line arguments
$@  # All positional parameters as a list
$#  # The number of positional parameters
$$  # The process ID of the script
$?  # The exit status of the last executed command

echo "Script name: $0"
echo "First argument: $1"
echo "All arguments: $@"
echo "Number of arguments: $#"
echo "Process ID: $$"
echo "Exit status of last command: $?"

# 4. Using export for Environment Variables
# When you want to make a variable available globally (to child processes), use export.
export GLOBAL_VAR="This is a global variable"
echo "Global variable: $GLOBAL_VAR"

# 5. Variable Substitution
# ${var} - Basic variable substitution
# ${var:-default} - If the variable is not set, use the default value
# ${var:=default} - If the variable is not set, assign it the default value

unset my_var # Unset the variable to demonstrate default substitution
echo "Variable substitution: ${my_var:-'Default value'}"
my_var=${my_var:='Default value assigned'}
echo "Variable after assignment: $my_var"

# 6. Arrays in Bash
# Declare an array with parentheses and access elements with index notation.
my_array=("apple" "banana" "cherry")
echo "First element: ${my_array[0]}"
echo "All elements: ${my_array[@]}"
echo "Number of elements in array: ${#my_array[@]}"

# Adding an element to an array
my_array[3]="date"
echo "Added element: ${my_array[3]}"
