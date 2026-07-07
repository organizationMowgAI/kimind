# kimind3 (solver explicatif graphique)

RENDRE LES PROGRAMMES SUIVANTS EXECUTABLES (dans le dossier kimind3) :
chmod +x ./kimind_graphique.sh
chmod +x ./kimind_graphique_joueur.sh
chmod +x ./kimind_graphique.pl
chmod +x ./vue_kimind.pl

LE DOSSIER parties_joueur CONTIENS DES PARTIES JOUEES

POUR LANCER KIMIND AVEC UNE PARTIE OU LE ROBOT JOUE :

ex)
./kimind_graphique.sh ./parties_joueur/colin/_partie_3.json

lance le solver explicatif, recherche les paramètres de 
la partie (solution, ordre des couleurs et somme des valeurs, 
 les cartes jouées ne sont pas prises en compte, c'est le robot qui jouera).

le nombre de solutions avec et sans position s'affiche dans messages.

pour faire jouer le robot                     : appuyer sur PLAY
pour avoir une explication après un coup joué : appuyer sur EXPLAIN

il n'y a plus d'explication quand le jeu est terminée.


POUR LANCER KIMIND AVEC UNE PARTIE DEJA JOUEE PAR UN JOUEUR :

ex)
./kimind_graphique_joueur.sh ./parties_joueur/colin/_partie_3.json
lance le solver explicatif avec les paramètres de la partie,
les cartes jouées sont celles enregistrées avec la partie.
pour voir le coup d'un joueur : appuyer SUR PLAY
pour voir les déductions possibles : appuyer sur EXPLAIN

NOTES :
- merci de signaler les bugs éventuels
- grosse amélioration de la partie explication prévue
