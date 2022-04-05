#!/usr/bin/env bash

# Sum
echo `expr 3 + 2`
# We have this form using expr 

echo $((3+2))
# And this form, like a variable.
# Note that using expr we have put space between numbers and operator, and in $(()) we not have a problem to use or not space.

# Subtract
echo `expr 10 - 5`

echo $((10-5))

# Multiplication
echo `expr 3 \* 2`

echo $((3*2))

# Division
echo `expr 6 / 2`

echo $((6/2))

# Rest of division
echo `expr 5 % 3`

echo $((3%2))

# Exponentiation
echo $((3 ** 3))
