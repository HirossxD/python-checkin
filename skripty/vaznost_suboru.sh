#!/usr/bin/env bash

# Jednoduchý výpočet "vážnosti" súboru
# Pravidlá:
#  +2 ak obsahuje slová internal/confidential
#  +1 za každých 10 riadkov (iba pre text)
#  -10 ak je ASCII text
#  + (veľkosť v bajtoch / 10) ak je binárny
#  + práva za owner, group, others: r=+1, w=+10, x=+5

vaznost_suboru() {
  local subor="$1"
  local skore=0

  if [[ -z "$subor" || ! -e "$subor" ]]; then
    echo "Použitie: $0 <subor>"; return 1
  fi

  # Zistíme typ súboru (text/binárny) a MIME
  local mime
  mime=$(LC_ALL=C file -b --mime -- "$subor" 2>/dev/null)
  local je_text=false
  [[ "$mime" == text/** ]] && je_text=true

  # 1) Obsah – kľúčové slová
  if [[ -r "$subor" ]]; then
    if grep -iqE '(^|[^a-z])(internal|confidential|confidental)($|[^a-z])' -- "$subor" 2>/dev/null; then
      skore=$(( skore + 2 ))
    fi
  fi

  # 2) Riadky alebo veľkosť
  if $je_text; then
    # +1 za každých 10 riadkov
    local riadky
    riadky=$(wc -l < "$subor")
    skore=$(( skore + (riadky / 10) ))

    # ASCII text → -10
    [[ "$mime" == *"charset=us-ascii"* ]] && skore=$(( skore - 10 ))
  else
    # binárny: + (veľkosť/10)
    local velkost
    velkost=$(stat -c%s -- "$subor" 2>/dev/null || wc -c < "$subor")
    skore=$(( skore + (velkost / 10) ))
  fi

  # 3) Prístupové práva: r=+1, w=+10, x=+5 (pre owner/group/others)
  # vezmeme symbolické práva z ls -l, napr. "-rwxr-x---"
  local perms
  perms=$(ls -l -- "$subor" | awk '{print $1}')

  # pomocná funkcia na spočítanie bodov z trojice ako "rwx", "r-x", atď.
  score_triple() {
    local t="$1"; local s=0
    [[ "${t:0:1}" == "r" ]] && s=$(( s + 1 ))
    [[ "${t:1:1}" == "w" ]] && s=$(( s + 10 ))
    [[ "${t:2:1}" == "x" ]] && s=$(( s + 5 ))
    echo "$s"
  }

  owner="${perms:1:3}"
  group="${perms:4:3}"
  others="${perms:7:3}"

  skore=$(( skore + $(score_triple "$owner") ))
  skore=$(( skore + $(score_triple "$group") ))
  skore=$(( skore + $(score_triple "$others") ))

  echo "Subor:  $subor"
  echo "Typ:    $($je_text && echo 'text' || echo 'binar')"
  $je_text && echo "Riadky: $(wc -l < "$subor")" || echo "Velkost: $(stat -c%s -- "$subor" 2>/dev/null || wc -c < "$subor") B"
  echo "Prava:  $perms"
  echo "Vaznost: $skore"
}

vaznost_suboru "$1"

 
