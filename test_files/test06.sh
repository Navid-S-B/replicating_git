#!/bin/dash
# Navid Bhuiyan (z5260384)
# Testing obscure usage errors for shrug-rm
# 15-07-2020

./shrug-init > /dev/null

# Mispelled first --options
output="`./shrug-rm -f -f`"
if test "$output" != "usage: shrug-rm [--force] [--cached] <filenames>"
then
    echo "Failed -- Options Usage Test 1"
    exit 1
fi

# Mispelled second --options
output="`./shrug-rm --force --c`"
if test "$output" != "usage: shrug-rm [--force] [--cached] <filenames>"
then
    echo "Failed -- Options Usage Test 2"
    exit 1
fi

rm -R .shrug
echo "Passed All Tests"