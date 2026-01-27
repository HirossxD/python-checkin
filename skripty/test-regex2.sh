#!/usr/bin/env bash

cat regex-text

echo "[abc] - multiple characters via regex"
cat regex-text | grep [aei]
cat regex-text | sed -E "s/[aei]/X/g"

echo "^ for reverse match"
cat regex-text | grep [^aei]

echo "$ is end of line"
cat regex-text  | sed -E "s/$/X/g"

echo "? - element before can occur 0-1"
echo "* - element before can occur 0-n"
echo "+ - element before can occur 1-n"

