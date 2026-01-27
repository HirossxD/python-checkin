#!/usr/bin/env bash

file_content="$(cat file)"

echo "$file_content" | wc -l

for line in $file_content
do
  echo $line
done
