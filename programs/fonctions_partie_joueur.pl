/* ========================================================================== */
/*            FONCTIONS RELATIVES A LA CARACTERISATION  DE LA DIFFICULTE      */
/*                 D'UNE PARTIE RELATIVEMENT AU JEU D'UN JOUEUR               */         
/* ========================================================================== */

:- module(
		  fonctions_partie_joueur, 
          [
			no_position_difficulty/2,
			struggling_with_higher_numbers_difficulty/2
		  ]
         ).

:-
	use_module(fonctions_enonce),
	use_module(bk_enonce).
	
/* ================================ FONCTIONS =============================== */

% ----------
	% Retourne la difficulté d'une partie sachant que pour la joueur
	% la difficulté est celle de la partie sans position 
	% (il a decouvert le placement des couleurs)
	% Relative_difficulty est la difficulte pour le joueur 
	% Intrinsic_difficulty est la difficulte intrinseque du probleme
no_position_difficulty(Game, Player_difficulty) :-
	nb_solutions_instance(5, Game, Nb_solutions), % # de solutions avec positions
	Nb_solutions1 is Nb_solutions / 24,			  % # de solutions sans position 
	bk_enonce:
	difficulty_instance_solutions(pos, Nb_solutions1, Player_difficulty, 5).

% ----------
	% Retourne la difficulte d'une partie sachant que le joueur a du mal avec
	% le calcul mental sur des sommes plus elevees
	% On suppose que pour ce joueur, il y a parmi les solutions possibles, en
	% plus des vraies possibilites, celles correspondant aux enonces dont la somme
	% vaut somme + 1 et ceux dont la somme vaut somme - 1, tout en s'assurant que
	% l'ordre est le même et que cette combinaison (somme + ordre) existe
	% Cela ne vaut que pour des sommes entre 22 et 39 (non inclus)
struggling_with_higher_numbers_difficulty(Game, Player_difficulty) :-
	Game = instance(Sum, Colours_order),
	difficult_sum_limit_inf(Limit_inf),
	difficult_sum_limit_sup(Limit_sup),
	Sum >= Limit_inf,
	Sum =< Limit_sup,	% On considere qu'au dela d'une certaine valeur, une somme n'est plus difficile, meme pour un joueur ayant des difficultes avec des sommes elevees (tant le nombre de solutions est alors faible)
	nb_solutions_instance(5, Game, Nb_solutions), % # de solutions avec positions pour l'enonce
	Sum1 is Sum - 1,
	(
		nb_solutions_instance(5, instance(Sum1, Colours_order), Nb_solutions1)  % # de solutions avec positions pour l'enonce dont la somme est diminuee de 1 par rapport a l'enonce initial
		-> Nb_solutions1 is Nb_solutions1
		; Nb_solutions1 is 0
	),
	Sum2 is Sum + 1,
	(
		nb_solutions_instance(5, instance(Sum2, Colours_order), Nb_solutions2)  % # de solutions avec positions pour l'enonce dont la somme est augmentee de 1 par rapport a l'enonce initial
		-> Nb_solutions2 is Nb_solutions2
		; Nb_solutions2 is 0
	),
	Player_nb_solutions is Nb_solutions + Nb_solutions1 + Nb_solutions2,
	bk_enonce:
	difficulty_instance_solutions(pos, Player_nb_solutions, Player_difficulty, 5).

% ----------
	% La valeur minimale d'une somme pour qu'on considere qu'elle constitue
	% une difficulte pour un joueur ayant du mal avec les sommes elevees
difficult_sum_limit_inf(23).

% ----------
	% La valeur maximale d'une somme pour qu'on considere qu'elle constitue
	% une difficulte pour un joueur ayant du mal avec les sommes elevees
difficult_sum_limit_sup(38).

% ----------
	% Retourne la difficulte de Game sachant que le joueur confond les 6 et
	% les 9
	%%% PAS TERMINE
	/*
confusion_6_9_difficulty(Game, Player_difficulty) :-
	nb_possible_solutions_with_6_or_9(Game, Nb_solutions),
	solutions_instance_positions(Game, Possibile_solutions),
	nb_values_6_or_9_in_solution(Solution, N),
	N > 0,
	!.*/

% ----------
	% Retourne la difficulte d'une partie sachant que le joueur connait
	% la position et la valeur d'une carte de solution
	/*
value_tendency_difficulty(Game, Position, Value, Solution, Player_difficulty) :-
	!.*/

/* =============================== FIN LISTING ============================== */ 
