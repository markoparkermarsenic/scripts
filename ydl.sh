#!/bin/bash

if [ -z "$1" ]; then
  echo "Usage: $0 <YouTube URL>"
  exit 1
fi

youtube-dl "$1"

# Get the name of the most recently created file in the directory
downloaded_file=$(ls -t | head -n 1)

file_name="${downloaded_file%.*}"  # Remove extension
extension="${downloaded_file##*.}" # Get extension

# Convert the file name to lowercase and replace spaces and special characters with dashes
new_file_name=$(echo "$file_name" | tr '[:upper:]' '[:lower:]' | tr -s ' ' '-' | tr -cd '[:alnum:]-')

new_file_name="${new_file_name}.${extension}"

mv "$downloaded_file" ~/Documents/mp3s/"$new_file_name"

echo "Downloaded and renamed '$downloaded_file' to '$new_file_name'"
