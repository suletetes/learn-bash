#!/bin/bash
# hello from the main os
echo "hello"

# assign variable
WORD='script'

# Display that value using variable
echo "$WORD"

echo "This is a shell $WORD"

echo "This is a shell {$WORD}"

# Append text to variable
echo "${WORD}ing is fun!"

# create a new varaible
ending='ed'

# combine the two variables
echo "This is ${WORD}${ending}."

# change the value in the ending variable (reassignment)
ending='ing'
echo "This is ${WORD}${ending} is fun!"


