#!/bin/bash
lowercase="abcdefghijklmnopqrstuvwxyz"
uppercase="ABCDEFGHIJKLMNOPQRSTUVWXYZ"
nums="0123456789"
special_chars="!@#$%^&*()-_=+[]{};:',<.>/?~"
pass_generator() {
length="$1"
complexity="$2"
password=""
if [ $complexity="low" ]
then
	password=$(tr -dc "${lowercase}${nums}" < /dev/urandom | fold -w "$length" | head -n 1)
elif [ $complexity="mid" ]
then
	password=$(tr -dc "${lowercase}${uppercase}${nums}" < /dev/urandom | fold -w "$length" | head -n 1)
elif [ $complexity="high" ]
then
	password=$(tr -dc "${lowercase}${uppercase}${nums}${special_chars}" < /dev/urandom | fold -w "$length" | head -n 1)
else
	echo "invalid complexity"
echo "password is: " $password
}
if [[ $# -eq 2 ]]
then
  pass_generator "$1" "$2"
else
  echo "invalid inputs"
fi
