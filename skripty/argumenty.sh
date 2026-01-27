#!/usr/bin/env bash

#echo "$0"

#internal

echo "\$*"
echo "$*"
for argument in "$*";do
  echo "$argument"
done


echo "\$@"
echo "$@"
for argument in "$@";do
  echo "$argument"
done
echo "------------------------------"


echo "shift"

debug='false'

while [ -n "$*" ]
do
  echo "$1"

  case "$1" in
      --host=*)
          host="${1:7}" #  $1 and remove first 7 chars from start
          shift
          ;;
      --debug)
          debug='true'
          shift
          ;;
      --help)
          echo "$0 help:"
          echo "supported arguments:"
          echo "--host --debug --help"
          exit 0
          ;;
      *)
          # default case
          echo "Unknown argument $1"
          echo "see $0 --help"
          shift
          ;;
  esac
done


if [ -z "$host" ]
then
  echo "Host not specified."
  echo "--host argument is mandatory"
  echo "See $0 --help"
  echo "Exitting..."
  exit 123
fi


echo "Your Host is $host and debug is $debug"
