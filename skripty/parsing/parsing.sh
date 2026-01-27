
#!/usr/bin/env bash

delimiter=','
content=$(cat people.csv)

tabulka="$(echo "$content")"
echo "$tabulka"

table_header="$( echo "$tabulka" | head -n 1 )"
table_content="$( echo "$tabulka" | tail -n+2 )"


OLD_IFS="$IFS"

IFS=$'\n'
for row in $tabulka
do
  echo "$table_header"
  echo "$row"
  name="$(echo "$row" | awk -F "$delimiter" '{print $1}')"
  visa="$(echo "$row" | awk -F "$delimiter" '{print $3}')"
  if [ "$visa" == 'yes' ]
  then
    echo "$name has valid visa." >> visa_report
  else
    echo "$name does not have a valid visa!" >> visa_report
  fi



  #vypis buniek
  IFS="$delimiter"
  for bunka in $row
  do
    #echo $bunka
    # : - nerobi nic
    :
  done
  IFS=$'\n'

done
IFS="$OLD_IFS"

exit 0





OLD_IFS="$IFS"

IFS="$delimiter"
for bunka in $table_content
do

  echo
  echo "$bunka"

done

IFS="$OLD_IFS"

