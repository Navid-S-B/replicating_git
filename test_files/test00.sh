#!/bin/dash
# Navid Bhuiyan (z5260384)
# Test shrug-init for initialisation of required folders and files.
# 15-07-2020

# Execute script
./shrug-init > /dev/null
folder_file_count=0

# Count existence of folders
if test -d ".shrug"
then
    folder_file_count=$(($folder_file_count + 1))
fi
if test -d ".shrug/.index"
then
    folder_file_count=$(($folder_file_count + 1))
fi
if test -e ".shrug/.commit_log.txt"
then
    folder_file_count=$(($folder_file_count + 1))
fi

# Check folder count and remove ,shrug
if test $folder_file_count -eq 3
then
    echo "Passed Test"
    rm -R .shrug
    exit 0
else
    echo "Failed Test"
    rm -R .shrug
    exit 1
fi