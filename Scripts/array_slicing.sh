#!/usr/bin/env bash

numbers=("1""2""3""4""5")
echo ${numbers[@]}
# Here we print all elements inside the array.

a=${numbers:0:2}
echo "${a}"
# Here we create a variable a, and we set to print array from starting 0 element to 2, but element 2 is exclusive. 

b=${numbers::5}
echo "${b}"
# Here with the variable b, we print element 0 to 5, when 5 is exclusive, default starting 0 element

c=${numbers:3}
echo "${c}"
# Here with variable c, print starting element 3 to end of array.

