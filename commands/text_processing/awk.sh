awk # Pattern scanning and processing language

# awk – Pattern Scanning and Processing Language
awk '{print $1}' file.txt            # Print the first field (column) of each line
awk -F':' '{print $1, $3}' /etc/passwd  # Print the first and third fields of a colon-separated file
awk '/pattern/ {print $0}' file.txt  # Print lines matching a pattern
awk '{sum += $1} END {print sum}' file.txt  # Sum the values in the first field and print the total

