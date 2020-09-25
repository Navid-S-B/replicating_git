#!/bin/dash
# Navid Bhuiyan (z5260384)
# Test shrug-show for obscure usage error i.e. invalid object.
# Show error messages for unknown commits and not found index error
# 15-07-2020

./shrug-init > /dev/null

# Test for invalid objects
output="`./shrug-show 12`"
if test "$output" != "shrug-show: error: invalid object 12"
then
    echo "Failed Invalid Object Error Test"
    exit 1
fi

# Test for unknown commit
output="`./shrug-show 1:a`"
if test "$output" != "shrug-show: error: unknown commit '1'"
then
    echo "Failed Unknown Commit Error"
    exit 1
fi

# Test for file not in index
output="`./shrug-show :a`"
if test "$output" != "shrug-show: error: 'a' not found in index"
then
    echo "Failed Not in Index Error"
    exit 1
fi

rm -R .shrug
echo "Passed All Tests"


