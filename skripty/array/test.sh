#!/usr/bin/env bash

slovo="$1"

test -n "$slovo" || {
  echo "prvy argument musi byt slovo"
  exit 0
}


pole=("$slovo")

echo "slovo ma ${#slovo} znakov"
echo "slovo ma $(echo -n "$slovo" | wc -m) znakov"

