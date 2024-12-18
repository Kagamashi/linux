
# brace Expansion: {a,b}
echo "Brace Expansion Example 1:"
echo file{A,B,C}.txt  # This creates fileA.txt, fileB.txt, fileC.txt

# Brace Expansion: {1..10}
echo "Brace Expansion Example 2:"
echo {1..5}  # This expands to 1 2 3 4 5

# Brace Expansion: {a..z}
echo "Brace Expansion Example 3:"
echo {a..d}  # This expands to a b c d

# Tilde Expansion: ~
# Expands to the home directory of the current user
echo "Tilde Expansion Example:"
echo "Home directory is: ~"
echo "Expanded home directory is: $HOME"

# Parameter Expansion: ${var}, ${var:-default}
my_var="Hello"
unset default_var

echo "Parameter Expansion Example 1:"
echo "${my_var}"  # This expands to the value of my_var

echo "Parameter Expansion Example 2 (using default value):"
echo "${default_var:-'Default Value'}"  # If default_var is unset or null, use 'Default Value'

echo "Parameter Expansion Example 3 (assigning default value if unset):"
default_var=${default_var:='Default Value Assigned'}
echo "After expansion: ${default_var}"

# Command Substitution: $(command)
current_date=$(date)
echo "Command Substitution Example 1:"
echo "Current date and time: $current_date"

# Command Substitution: `command` (older syntax)
current_user=`whoami`
echo "Command Substitution Example 2 (using backticks):"
echo "Current user: $current_user"
