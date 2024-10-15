#!/bin/bash

# ----------------------
man      # Displays manual or help page for a command
--help   # Displays brief summary of the command
apropos  # Searches manual pages for commands related to a keyword
whatis   # Provides brief description of a command (one-line)
which    # Shows full path of executable for a command
type     # Tells how command will be interpreted by the shell (as alias, function, execuable..)
# ----------------------

man [command]
man ls

[command] --help
ls --help

apropos [keyword]
apropos copy        # This lists commands whose descriptions match the keyword "copy"

whatis [command]
whatis ls

which [command]
which python        # Displays path to python executable currently in use
