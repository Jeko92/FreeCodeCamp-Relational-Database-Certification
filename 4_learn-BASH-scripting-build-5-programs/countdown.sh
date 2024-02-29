#!/bin/bash
# Program that counts down to zero from a given argument

echo -e "\n~~ Countdown Timer ~~\n"

#echo $*
#echo $1
#if [[ $1 == arg1 ]]
#if [[ $1 lt 5 ]]
#if [[ $1 le 5 ]]
# if [[ $1 -gt 5 ]]
# then
#   echo true
# else
#   echo false
# fi

if [[ $1 -gt 0 ]]
then
  #echo true
  : '
  for (( i = $1; i >= 0; i-- ))
  do
    echo $i
    sleep 1
  done
  '
  I=$1
  while [[ $I -ge 0 ]]
  do
    echo $I
    (( I-- ))
    sleep 1
  done
else
  echo Include a positive integer as the first argument.
fi