#!/bin/dash
# Navid Bhuiyan (z5260384)
# Testing for -a for shrug-commit functionality
# 15-07-2020

./shrug-init > /dev/null

# Test for -a command
touch a.txt
./shrug-add a.txt
./shrug-commit -m 'Test Commit' > /dev/null
echo '5' >> a.txt
./shrug-commit -a -m 'Test Commit' > /dev/null

output="`cat '.shrug/.snapshot.1/a.txt'`"
if test "$output" != "5"
then
    echo "Failed -a Command Test"
    exit 1
fi

rm -R .shrug
echo "Passed All Tests"
