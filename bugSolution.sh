#!/bin/bash

# This script demonstrates how to prevent the race condition using flock

# Create two files
touch file1.txt
touch file2.txt

# Function to write to a file safely
write_to_file() {
  local file=$1
  local message=$2
  flock -n -x "$file" || exit 1 # Acquire an exclusive lock
  echo "$message" >> "$file"
  flock -u "$file"
}

# Start two processes that concurrently write to the files using flock
(while true; do write_to_file file1.txt "Process 1"; sleep 0.1; done) & 
(while true; do write_to_file file2.txt "Process 2"; sleep 0.1; done) &

# Wait for 5 seconds
sleep 5

# Kill the processes
kill %1
kill %2

# Display file contents
cat file1.txt
cat file2.txt