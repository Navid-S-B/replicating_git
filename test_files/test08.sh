#!/bin/dash
# Navid Bhuiyan (z5260384)
# Test shrug-add to avoid shrug files as indicated by shrug-status
# these files are untracked.
# 15-07-2020

./shrug-init > /dev/null

touch a.txt b.txt c.txt
./shrug-add a.txt b.txt c.txt > /dev/null

# Loop through index and check for shrug files
for file in `ls .shrug/.index`
do
    if echo "$file" | grep 'shrug' > /dev/null
    then
        echo "Failed Avoiding Shrug Files Test"
        exit 1
    fi
done

./shrug-rm --force * > /dev/null
rm -R .shrug
echo "Passed All Tests"