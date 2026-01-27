#!/usr/bin/env bash

# vytvorim kopiu slova, otocim ju a porovnam

#input 2 sposoby
#1. sposob (pochopitelnejsi):
read -p "zadaj slovo:" slovo

##2. sposob (menej CPU):
##slovo="$1"

#pocet pismen v slove 2.sposoby

#pocet_pismen="$(echo -n "$slovo" | wc --chars)"

pocet_pismen="${#slovo}"

#parny pocet ? 2 moznosti

#predelenie_dvomi="$(echo "scale=2; 9 / 2" | bc | awk -F'.' '{print $2}')"
#test "$predelenie_dvomi" -gt 0 && parny_pocet=true

obratene_slovo=""

#while read i; do
#	obratene_slovo="$obratene_slovo${slovo:$i:1}"
#done < <(seq $((pocet_pismen-1)) -1  0)

seq $((pocet_pismen-1)) -1 0 | while read i; do
    obratene_slovo="$obratene_slovo${slovo:$i:1}"
done


echo -n "Slovo ${slovo} "
if [ "$slovo" == "$obratene_slovo" ]; then
	echo "je palindrom"
else
	echo "nie je palindrom"
fi
