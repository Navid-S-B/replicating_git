#!/bin/dash
# Navid Bhuiyan (z5260384)
# Test shrug-commit for obscure usage errors
# and adding to the logs properly
# 15-07-2020

./shrug-init > /dev/null

# Test for obscure usage error
output="`./shrug-commit -a 'jj'`"
if test "$output" != "usage: shrug-commit [-a] -m commit-message"
then
    echo "Failed Usage Error Test 1"
    exit 1
fi

# Test for obscure usage error
output="`./shrug-commit a -m 'gg'`"
if test "$output" != "usage: shrug-commit [-a] -m commit-message"
then
    echo "Failed Usage Error Test 2"
    exit 1
fi

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

# Check log file and order of logs
output="`cat '.shrug/.commit_log.txt'| head -1`"
if test "$output" != "1 Test Commit"
then
    echo "Failed Logging Commits"
    exit 1
fi

# Clean up
rm a.txt
rm -R .shrug
echo "Passed All Tests"