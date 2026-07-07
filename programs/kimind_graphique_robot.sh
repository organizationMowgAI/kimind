#! /usr/bin/env bash

fic1="$1"

echo "begin of the script kimind_graphique_robot.sh"

	# appelle 
./kimind_graphique.pl "$fic1" >/dev/null 2>&1 &

	# appelle le script associe a la vue python
./vue_kimind.py >/dev/null 2>&1 &

echo "end of the script kimind_graphique_robot.sh"
