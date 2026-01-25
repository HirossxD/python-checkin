#!/usr/bin/env bash

test -e

./make-changes.sh
./push-changes.sh
./fetch-changes.sh
