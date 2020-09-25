#!/bin/dash
# Navid Bhuiyan (z5260384)
# Test shrug-add for multiple file assignment, and cannot open file
# output error when copying unregular files i.e. folders
# 15-07-2020

./shrug-init > /dev/null
touch a.txt b.txt c.txt
./shrug-add a.txt b.txt c.txt

# Test shrug-add for handling multiple arguments
count=0
for file in `ls .shrug/.index`
do
    count=$(($count + 1))
done

if test $count -ne 3
then
    echo "Failed Test for Multiple Arguments"
    exit 1
fi

# Test for adding non-existent file
output="`./shrug-add d.txt`"
if test "$output" != "shrug-add: error: can not open 'd.txt'"
then
    echo "Failed Test for Adding Non-Existent File"
    exit 1
fi

# Test for adding folder i.e. irregular file
mkdir test
output="`./shrug-add test`"
if test "$output" != "shrug-add: error: 'test' is not a regular file"
then
    echo "Failed Test for Adding Folder i.e. Non-Regular File"
    exit 1
fi

# Clean up
rm a.txt b.txt c.txt
rm -R .shrug 'test'
echo "Passed All Tests"
