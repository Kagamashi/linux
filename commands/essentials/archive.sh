
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
t --list

z --gzip
j --bzip2
J --xz

tar -cvf archive.tar /path/to/directory     # create a tarball (archive) from a directory
tar -rf archive.tar file2                   # add file to archived directory
tar -xvf archive.tar                        # extract files from a tarball
tar -czvf archive.tar.gz /path/to/directory # create a compressed tarball using gzip
tar -xzvf archive.tar.gz                    # extract a compressed tarball
tar xf archive.tar -C /tmp                  # extract in another directory

# To ensure all permission/ownership informations get restored
sudo tar --extract --file archive.tar --directory /tmp/

# gzip – Compress files using gzip
gzip file.txt                             # compress file.txt to file.txt.gz
gzip -d file.txt.gz                       # decompress file.txt.gz to file.txt
gunzip file1.gz

# bzip2 – Compress files using bzip2
bzip2 file.txt                            # compress file.txt to file.txt.bz2
bzip2 -d file.txt.bz2                     # decompress file.txt.bz2 to file.txt
bunzip file2.bz2

# zip – Create ZIP archives
zip archive.zip file1.txt file2.txt      # create a ZIP archive containing file1.txt and file2.txt
unzip archive.zip                        # extract the contents of archive.zip
