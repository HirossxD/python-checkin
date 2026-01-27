#!/usr/bin/env bash
#set -x
set -u
mypath="$(realpath "$0")"
mydir="$(dirname "$mypath")"
echo "$mypath"
echo "$mydir"
cd "$mydir"


#test -z "$1" && {
#  echo "First argument cannot be empty"
#  echo "exitting..."
#  exit 0
#}

#if [ -z "$1" ] ; then
#  echo "no first argument entered."
#  echo "exitting..."
#  exit 0
#fi


 
text="$1"
 
echo "$text" | sed 's/ //g'
echo "$text" | wc -m
touch "$text"
 
#date > "$mydir/$text"
date > "$text"
