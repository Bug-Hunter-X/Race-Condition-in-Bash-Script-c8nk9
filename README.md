# Race Condition in Bash Script

This repository demonstrates a race condition in a bash script. Two processes concurrently write to files, which leads to unpredictable output due to interleaved writes. The solution shows how to use file locking to prevent this issue.

## Bug Description
The script creates two files and then launches two processes that concurrently write to them.  Due to the race condition, the final output of each file may contain incomplete or interleaved lines from both processes.  This is especially problematic if the files are meant to store sequential data.

## Solution
The solution involves using file locking mechanisms, preventing simultaneous writes to the files, thus ensuring data integrity and eliminating the race condition.