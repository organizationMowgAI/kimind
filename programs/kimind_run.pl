/* ========================================================================== */
/* 						GERE LES INFORMATIONS CONNUES AU COURS                */
/*                          D'UNE PARTIE KIMIND                               */
/* ========================================================================== */

:- module(kimind_run,
		  [
			incremente_nb_tries/0,
			carte_devinee/1,
			ajoute_cartes_devinees/1,
			ajoute_carte_devinee/1,
			reponse/1,
			domaines/1,
			contraintes/1,
			correct_suit/2,
			correct_value/2,
			carte_cachee/2
		  ]
		  ).

:- dynamic 
	reponse/1,
	domaines/1,
	contraintes/1. 

% ----------
ajoute_cartes_devinees([]) :-
	!.

ajoute_cartes_devinees([Carte|Cartes]) :-
	ajoute_carte_devinee(Carte),
	ajoute_cartes_devinees(Cartes).
	
% ----------
ajoute_carte_devinee(Carte) :-
	running_game:retract(cartes_devinees(Cartes)),
	running_game:assert(cartes_devinees([Carte|Cartes])).

% ----------
carte_devinee(Position) :-
	running_game:cartes_devinees(Cartes),
	member(c(Position, _Couleur, _Valeur), Cartes).
	
% ----------
incremente_nb_tries :-
	running_game:retract(nb_tries(Nb_tries)),
	Nb_tries1 is Nb_tries + 1,
	running_game:assert(nb_tries(Nb_tries1)).

% ----------
carte_cachee(Position, c(Position, Couleur, Valeur)) :-
	running_game:solution(Solution),
	member(c(Position, Couleur, Valeur), Solution).

% ----------
correct_suit(Position, Couleur) :-
	carte_cachee(Position, c(Position, Couleur, _Valeur)).

% ----------
correct_value(Position, Valeur) :-
	carte_cachee(Position, c(Position, _Couleur, Valeur)).

/* ============================== FIN LISTING =============================== */
