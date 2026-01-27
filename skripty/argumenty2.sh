#!/usr/bin/env bash

set -e
set -u

#$1=${1:-}
argument=${1:-default_value}

test "x$argument" == "xhodnota1" && {
  echo "zadal si argument hodnota1"
  command_ktory_neexistuje || true
  "hodnota1" || true
} || {
  echo "zadany argument bol $argument"
}


echo 'posledny riadok skriptu.'
