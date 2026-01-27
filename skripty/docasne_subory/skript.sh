#/usr/bin/env bash

set -e

tmpdir="$(mktemp -d tmpdir.XXXXXX)"
tmpfile_raw="$(mktemp "$tmpdir/tmpfile.XXXXXX")"

function upratovanie() {
  rm -rf "$tmpdir"
}

trap upratovanie EXIT
trap upratovanie ERR

#pwd
mojacesta="$(realpath "$0")"
#echo "$mojacesta"
moj_priecinok="$(dirname "$mojacesta")"
#echo "$moj_priecinok"
cd "$moj_priecinok"
#pwd

#input_content="$(cat temp_template.txt)"


# echo "$input_content" >"$tmpfile_raw"
cat temp_template.txt > "$tmpfile_raw"

cat "$tmpfile_raw" | awk '{print $1}'

#command_ktory_failne

######rm -rf "$tmpdir"  # netreba nam ho pretoze trap nam uprace a vie o tom uz na zaciatku skriptu

