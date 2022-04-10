#!/usr/bin/env bash

# Its a loop diferent in a comparation with others, will print all elements and its it.
select FOOD in pizza soup rice salad beef all none
do
  echo $FOOD
done

