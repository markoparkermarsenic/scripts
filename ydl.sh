#!/bin/bash

# Check if a URL is provided as an argument
if [ -z "$1" ]; then
  echo "Usage: $0 <YouTube URL>"
  exit 1
fi

# Run youtube-dl and capture the output
yt-dlp --restrict-filenames --extract-audio --audio-format mp3 "$1"

mv ./*.mp3 ~/documents/mp3s/
