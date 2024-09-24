#!/bin/bash

# Function to display usage/help
usage() {
    echo "Usage: $0 [-h] [-n name] [-a age] [-v]"
    echo "Options:"
    echo "  -h        Show help"
    echo "  -n name   Specify a name"
    echo "  -a age    Specify an age"
    echo "  -v        Enable verbose mode"
}

# Default values
VERBOSE=0
NAME=""
AGE=""

# Parsing command-line options using getopts
while getopts "hn:a:v" opt; do
    case $opt in
        h)
            usage
            exit 0
            ;;
        n)
            NAME=$OPTARG
            ;;
        a)
            AGE=$OPTARG
            ;;
        v)
            VERBOSE=1
            ;;
        \?)
            echo "Invalid option: -$OPTARG" >&2
            usage
            exit 1
            ;;
    esac
done

# Shifting the positional parameters to remove the processed options
shift $((OPTIND -1))

# Optional verbose mode
if [ $VERBOSE -eq 1 ]; then
    echo "Verbose mode is ON"
fi

# Display the parsed information
if [ -n "$NAME" ]; then
    echo "Name: $NAME"
else
    echo "Name not provided"
fi

if [ -n "$AGE" ]; then
    echo "Age: $AGE"
else
    echo "Age not provided"
fi

# If there are any additional non-option arguments
if [ $# -gt 0 ]; then
    echo "Additional arguments: $@"
fi

# ./script.sh -h
# ./script.sh -n "Alice" -a 25
# ./script.sh -n "Alice" -a 25 extra_arg1 extra_arg2
