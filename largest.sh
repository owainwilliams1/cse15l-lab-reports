#!/bin/bash

# Check if a folder path is provided
if [ -z "$1" ]; then
  echo "Usage: $0 <folder_path>"
  exit 1
fi

folder_path="$1"

# Check if the folder exists
if [ ! -d "$folder_path" ]; then
  echo "Error: Folder not found"
  exit 1
fi

# Find the largest file in the folder
largest_file=$(find "$folder_path" -maxdepth 1 -type f -exec du -h {} + | sort -rh | head -n 1 | cut -f2)

# Check if any files were found
if [ -z "$largest_file" ]; then
  echo "No files found in the folder"
  exit 0
fi

# Display the name of the largest file
echo "Largest file: $(basename "$largest_file")"
