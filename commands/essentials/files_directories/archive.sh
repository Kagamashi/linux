#!/bin/bash

tar                                     # Archive files
gzip                                    # Compress files using gzip
gunzip                                  # Decompress gzip files
bzip2                                   # Compress files using bzip2
zip                                     # Create ZIP archives
unzip                                   # Extract ZIP archives

# tar – Archive files
# Packs files and directories into a single .tar file (also called tarball)
# Tar Archive also stores permission and ownership informations about files and directories

tar --list --file archive.tar # Display context of an archive
tar -tf archive.tar

x --extract
c --create
f --file
r --append 

tar -cvf archive.tar /path/to/directory  # Create a tarball (archive) from a directory
tar -rf archive.tar file2 # Add file to a directory
tar -xvf archive.tar                      # Extract files from a tarball
tar -czvf archive.tar.gz /path/to/directory # Create a compressed tarball using gzip
tar -xzvf archive.tar.gz                # Extract a compressed tarball
tar xf archive.tar -C /tmp # Extract in another directory

# To ensure all permission/ownership informations get restored
sudo tar --extract --file archive.tar --directory /tmp/

# gzip – Compress files using gzip
gzip file.txt                             # Compress file.txt to file.txt.gz
gzip -d file.txt.gz                       # Decompress file.txt.gz to file.txt
gunzip file1.gz

# bzip2 – Compress files using bzip2
bzip2 file.txt                            # Compress file.txt to file.txt.bz2
bzip2 -d file.txt.bz2                     # Decompress file.txt.bz2 to file.txt
bunzip file2.bz2

# zip – Create ZIP archives
zip archive.zip file1.txt file2.txt      # Create a ZIP archive containing file1.txt and file2.txt
unzip archive.zip                        # Extract the contents of archive.zip



# PAIRED
tar --create --gzip --file archive.tar.gz file1
tar czf archive.tar.gz file1

tar --create --bzip2 --file archive.tar.gz file1
tar cjf archive.tar.gz file1

tar --create --xz --file archive.tar.gz file1
tar cJf archive.tar.gz file1

tar --create --autocompress --file archive.tar.gz file1
