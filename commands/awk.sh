
awk # Pattern scanning and processing language

# awk – Pattern Scanning and Processing Language
# NR  – The number of the current record (line number).
# OFS – Output field separator (default is a space).
# FS  – Input field separator (default is whitespace).

awk '{print $1}' file.txt                          # Print the first field (column) of each line
awk -F':' '{print $1, $3}' /etc/passwd              # Print the first and third fields of a colon-separated file
awk '/pattern/ {print $0}' file.txt                # Print lines matching a pattern
awk '{sum += $1} END {print sum}' file.txt         # Sum the values in the first field and print the total
awk '{print NR, $0}' file.txt                       # Print line numbers along with each line
awk -F, '{print $2, $3}' data.csv                   # Print the second and third fields from a CSV file
awk 'length($0) > 80' file.txt                      # Print lines longer than 80 characters
awk 'BEGIN {FS="\t"; OFS=","} {print $1, $2}' file.tsv  # Convert a tab-separated file to a comma-separated file
awk -F: '($3 >= 1000) {print $1}' /etc/passwd      # Print usernames with UID greater than or equal to 1000
awk '{if ($1 > 50) print $0}' file.txt              # Print lines where the first field is greater than 50
