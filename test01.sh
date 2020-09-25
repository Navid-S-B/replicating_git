#!/bin/dash
# Navid Bhuiyan (z5260384)
# Test shrug-init if it checks for previous repo
# 15-07-2020

# Execute script
./shrug-init > /dev/null
output="`./shrug-init`"

# Remove directory
rm -R .shrug

# Check output
if test "$output" = "shrug-init: error: .shrug already exists"
then
    echo "Passed Test"
    exit 0
else
    echo "Failed Test"
    exit 1
fi