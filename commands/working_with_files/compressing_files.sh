tar       # Archive files
gzip      # Compress files using gzip
gunzip    # Decompress gzip files
bzip2     # Compress files using bzip2
zip       # Create ZIP Archives
unzip     # Extract ZIP Archives


# gzip – Compress Files Using gzip
gzip file.txt                               # Compress file.txt and replace it with file.txt.gz
gzip -k file.txt                            # Compress file.txt and keep the original file
gzip -d file.txt.gz                         # Decompress file.txt.gz to file.txt

# gunzip – Decompress gzip Files
gunzip file.txt.gz                          # Decompress file.txt.gz to file.txt
gunzip -c file.txt.gz > file.txt            # Decompress and redirect output to file.txt

# bzip2 – Compress Files Using bzip2
bzip2 file.txt                              # Compress file.txt and replace it with file.txt.bz2
bzip2 -k file.txt                           # Compress file.txt and keep the original file
bzip2 -d file.txt.bz2                       # Decompress file.txt.bz2 to file.txt

# zip – Create ZIP Archives
zip archive.zip file1.txt file2.txt         # Create a ZIP archive containing file1.txt and file2.txt
zip -r archive.zip /path/to/dir             # Create a ZIP archive of a directory recursively
zip -e archive.zip file.txt                 # Create an encrypted ZIP archive (requires a password)

# unzip – Extract ZIP Archives
unzip archive.zip                           # Extract files from archive.zip
unzip -l archive.zip                        # List the contents of a ZIP archive without extracting
unzip -d /path/to/dir archive.zip           # Extract files to a specific directory
