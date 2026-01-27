#!/usr/bin/env bash


#zistite vsetkych lokalnych userov na tomto stroji a ulozte ich do pola users
    #/etc/passd /etc/shadow  - zdroj dat pre userov

#vytvorte subor s 2 stlpcami kde prvy stlpec je meno uzivatela a  druhy stlpec je jeho ID
    # id meno


test=(b a d c)

for pismeno in "${test[@]}"
do
  echo "$pismeno"
done


#zoradene=( $(printf("%s\n", "${test[@]}") ) )
#echo "${zoradene[@]}"


#!/usr/bin/env bash
 
# Zistenie všetkých lokálnych používateľov

# (teda všetkých, ktorí sú v /etc/passwd)

users=($(cut -d: -f1 /etc/passwd))
 
# Výstupný súbor

output="users.txt"
 
# Vytvorenie/čistenie súboru
> "$output"
 
# Pre každý účet získame jeho UID a zapíšeme vo formáte:

# meno  UID

for user in "${users[@]}"; do

    uid=$(id -u "$user" 2>/dev/null)

    echo "$user  $uid" >> "$output"

done
 
echo "Hotovo. Dáta sú uložené v $output"

 
