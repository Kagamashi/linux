#!/bin/bash

# Check if there are any changes
if [[ -n $(git status --porcelain) ]]; then
    # Add all changes (both modified and deleted files)
    git add -A

    # Commit changes
    git commit -m "Update changes: add and commit modified and deleted files"
    
    echo "All changes have been added and committed."
else
    echo "No changes to commit."
fi

