#!/bin/bash

# This script demonstrates a race condition that can lead to unexpected behavior.

# Create two files
touch file1.txt
touch file2.txt

# Start two processes that concurrently write to the files
(while true; do echo "Process 1" >> file1.txt; sleep 0.1; done) & 
(while true; do echo "Process 2" >> file2.txt; sleep 0.1; done) &

# Wait for 5 seconds
sleep 5

# Kill the processes
kill %1
kill %2

# Display file contents (this is where the race condition causes issues)
cat file1.txt
cat file2.txt