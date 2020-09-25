#!/bin/dash
# Navid Bhuiyan (z5260384)
# Handling multiple arguments for shrug-rm
# as autotests handle files one by one.
# 15-07-2020

./shrug-init > /dev/null

# Test with multiple arguments
touch a.txt b.txt c.txt
./shrug-add a.txt b.txt c.txt
./shrug-commit -m 'gg' > /dev/null
# Modify c as last input to check if other files are deleted
echo 4 >> c.txt
output="`./shrug-rm a.txt b.txt c.txt`"

if test "$output" != "shrug-rm: error: 'c.txt' in repository is different to working file"
then
    echo "Failed Multiple Argument Test"
    exit 1
fi

# Check if a.txt and b.txt got deleted
if test -e 'a.txt'
then
    echo "Failed Multiple Argument Test"
    exit 1
fi
if test -e 'b.txt'
then
    echo "Failed Multiple Argument Test"
    exit 1
fi

# Clean up
rm c.txt
rm -R .shrug
echo "Passed All Tests"