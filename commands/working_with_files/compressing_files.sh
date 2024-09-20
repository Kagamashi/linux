#!/bin/bash

tar                                     # Archive files
gzip                                    # Compress files using gzip
gunzip                                  # Decompress gzip files
bzip2                                   # Compress files using bzip2
zip                                     # Create ZIP archives
unzip                                   # Extract ZIP archives

# tar – Archive files
tar -cvf archive.tar /path/to/directory  # Create a tarball (archive) from a directory
tar -xvf archive.tar                      # Extract files from a tarball
tar -czvf archive.tar.gz /path/to/directory # Create a compressed tarball using gzip
tar -xzvf archive.tar.gz                  # Extract a compressed tarball

# gzip – Compress files using gzip
gzip file.txt                             # Compress file.txt to file.txt.gz
gzip -d file.txt.gz                       # Decompress file.txt.gz to file.txt

# bzip2 – Compress files using bzip2
bzip2 file.txt                            # Compress file.txt to file.txt.bz2
bzip2 -d file.txt.bz2                     # Decompress file.txt.bz2 to file.txt

# zip – Create ZIP archives
zip archive.zip file1.txt file2.txt      # Create a ZIP archive containing file1.txt and file2.txt

# unzip – Extract ZIP archives
unzip archive.zip                        # Extract the contents of archive.zip
