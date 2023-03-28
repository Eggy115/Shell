#!/bin/sh
# File Renamer

# Define directory containing files to rename
DIR="/home/user/my_files"

# Loop through all files in directory
for file in "$DIR"/*
do
    # Extract file extension
    ext="${file##*.}"

    # Generate new file name
    new_name="$(date +%Y-%m-%d_%H-%M-%S)_${RANDOM}.${ext}"

    # Rename file
    mv "${file}" "${DIR}/${new_name}"
done

# Print success message
echo "Files renamed!"
