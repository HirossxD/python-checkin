#!/usr/bin/env bash

oldpwd="$(pwd)"
function on_exit () {
  cd "$oldpwd"
}
trap on_exit EXIT ERR SIGINT SIGTERM

cd "$(dirname "$(realpath "$0")")"

./make-changes.sh
./push-changes.sh
./fetch-changes.sh
