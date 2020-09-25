#!/bin/dash
# Navid Bhuiyan (z5260384)
# Test shrug-rm in three error contexts.
# 15-07-2020

./shrug-init > /dev/null
touch a.txt b.txt

# Test a file in workspace different to repo
./shrug-add a.txt
./shrug-commit -m 'gg' > /dev/null
echo 5 >> a.txt
output="`./shrug-rm a.txt`"
if test "$output" != "shrug-rm: error: 'a.txt' in repository is different to working file"
then
    echo "Failed File in Workspace is Different to Repository Test"
    exit 1
fi

# Test index file is different to both repo and workspace
echo 5 >> b.txt
./shrug-add b.txt
./shrug-commit -m 'gg' > /dev/null
echo 5 >> b.txt
./shrug-add b.txt
echo 5 >> b.txt
output="`./shrug-rm b.txt`"
if test "$output" != "shrug-rm: error: 'b.txt' in index is different to both working file and repository"
then
    echo "Failed File in Index is Different to Repository and Workspace Test"
    exit 1
fi

# Test for error message for shrug-rm for file not in repo
output="`./shrug-rm c.txt`"
if test "$output" != "shrug-rm: error: 'c.txt' is not in the shrug repository"
then
    echo "Failed File not in Repo Test"
    exit 1
fi

# Clean up
rm a.txt b.txt
rm -R .shrug
echo "Passes All Tests"