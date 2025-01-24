#!/bin/bash

# declaration
my_var="Hello, World"

# environment variables
export MY_ENV_VAR="I am an environment variable" # exported env variables are available globally

# special variables
$0          # name of the script itself
$1, $2, ... # positional parameters representing command-line arguments
$@          # all positional parameters as a list
$#          # number of positional parameters
$$          # process ID of the script
$?          # exit status of the last executed command

echo "Script name: $0"
echo "First argument: $1"
echo "All arguments: $@"
echo "Number of arguments: $#"
echo "Process ID: $$"
echo "Exit status of last command: $?"

# variable substitution
# ${var} - Basic variable substitution
# ${var:-default} - If the variable is not set, use the default value
# ${var:=default} - If the variable is not set, assign it the default value

unset my_var # Unset the variable to demonstrate default substitution
echo "Variable substitution: ${my_var:-'Default value'}"
my_var=${my_var:='Default value assigned'}
echo "Variable after assignment: $my_var"

# arrays
my_array=("apple" "banana" "cherry")
echo "First element: ${my_array[0]}"
echo "All elements: ${my_array[@]}"
echo "Number of elements in array: ${#my_array[@]}"

# add element to array
my_array[3]="date"
echo "Added element: ${my_array[3]}"

# shell expansions
echo file{A,B,C}.txt  # creates fileA.txt, fileB.txt, fileC.txt
echo {1..5}           # expands to 1 2 3 4 5
echo {a..d}           # expands to a b c d

# tilde expansion: ~
# expands to the home directory of the current user
