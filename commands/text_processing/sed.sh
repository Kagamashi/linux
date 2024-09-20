sed -h # Stream editor for filtering and transforming text


# sed – Stream Editor for Filtering and Transforming Text
sed 's/old/new/' file.txt            # Replace the first occurrence of 'old' with 'new' in each line
sed 's/old/new/g' file.txt           # Replace all occurrences of 'old' with 'new' in each line
sed -n '5,10p' file.txt              # Print lines 5 to 10 from a file
sed '/pattern/d' file.txt            # Delete lines matching a pattern