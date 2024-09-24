#!/bin/bash

# String Concatenation
str1="Hello"
str2="World"
concatenated_str="${str1}, ${str2}!"  # Concatenate strings
echo "Concatenated String: $concatenated_str"

# Extracting Substrings: ${var:offset:length}
# Syntax: ${var:offset:length} extracts a substring starting at 'offset' for 'length' characters
str="Bash Scripting is awesome"
echo "Original String: $str"

# Extract from index 5 (start at 'S') and get 9 characters
substring=${str:5:9}
echo "Extracted Substring: $substring"

# Replacing Substrings: ${var/pattern/replacement}
# Replacing first occurrence of 'awesome' with 'great'
replaced_str="${str/awesome/great}"
echo "Replaced Substring (first occurrence): $replaced_str"

# Replacing all occurrences of 'is' with 'IS'
replaced_all_str="${str//is/IS}"
echo "Replaced Substring (all occurrences): $replaced_all_str"

# Finding String Length: ${#var}
str_length=${#str}
echo "Length of the String: $str_length"
