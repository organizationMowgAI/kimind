#! /usr/bin/env bash

fic1="$1"
 
echo "begin of the script kimind_graphique_joueur.sh"

./kimind_graphique_joueur.pl "$fic1" >/dev/null 2>&1 &

./vue_kimind.py >/dev/null 2>&1 &

echo "end of the script kimind_graphique_joueur.sh"
