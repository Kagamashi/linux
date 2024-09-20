cut # Remove sections from each line of files
sort # Sort lines of text files
uniq # Report or omit repeated lines
tr # Translate or delete characters
wc # Print newline, word, and byte counts
paste # Merge lines of files
fmt # Simple text formatter



# cut – Remove Sections from Each Line of Files
cut -d':' -f1 /etc/passwd            # Extract the first field (before colon) from a colon-separated file
cut -c1-5 file.txt                   # Extract the first 5 characters from each line
cut -d',' -f2 file.csv               # Extract the second field from a comma-separated file



# sort – Sort Lines of Text Files
sort file.txt                        # Sort the lines of a file alphabetically
sort -n file.txt                     # Sort numerically
sort -r file.txt                     # Sort in reverse order
sort -u file.txt                     # Sort and remove duplicate lines

# uniq – Report or Omit Repeated Lines
uniq file.txt                        # Remove consecutive duplicate lines from a file
uniq -c file.txt                     # Count and display the number of occurrences of each line
uniq -d file.txt                     # Show only duplicate lines


# tr – Translate or Delete Characters
tr 'a-z' 'A-Z' < file.txt            # Convert lowercase letters to uppercase
tr -d '0-9' < file.txt               # Delete all digits from the input
tr ':' ',' < file.txt                # Replace all colons with commas