#!/usr/bin/env bash

array_test=("1" "2" "3" "4")
# It's a array, a list of a lot values.

echo ${array_test[0]}
# Output 1, because value 0 it's the first value inside an array

echo ${array_test[1]}
# Output 2, of course if u have payed atention you noted the second value is 2.

echo ${array_test[-1]}
# Output the last value, because when we call -1 he capture the last value.

echo ${array_test[@]}
# Output all arguments in the array with a @

echo ${#array_test[@]}
# Output total numbers of elements in the array.

