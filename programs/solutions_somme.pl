/* ========================================================================== */
/*                  RETOURNE LES SOLUTIONS DE KIMIND SI L'ON NE TIENT         */
/*                COMPTE QUE DE LA CONTRAINTE SUR LA SOMME DES VALEURS        */
/* ========================================================================== */

/* ======================== EXEMPLES D'UTILISATION ========================== */
/*
	- solutions_somme_positions(15, 4, 1, 10, Nb_sols, Sols).
	  retourne le nombre (Nb_sols) et les solutions (Sols) 
	  correspondan à la facon de distribuer la valeur 15 sur 4 cartes, 
	  chacune avec une valeur minimale de 1 et maximale de 10

	- solutions_somme(15, 4, 1, 10, Nb_sols, Sols).
	  idem mais ne tient pas compte des positions

    - solutions_toutes_sommes_positions(4, 40, 4, 1, 10, Nb_Solutions,
                                        Effectif_total) :
      retourne (Nb_solutions) le nombre de façons de distribuer :
      la valeur 4 sur 4 cartes
      la valeur 5 sur 4 cartes
      ...
      la valeur 40 sur 4 cartes
      Nb_solutions est une liste.

	  Effectif total :
      ex) la somme 4 apparait 1 dans 1 solution, la somme 5 dans 4 solutions,
          etc, donc Effectif_total = 1 + 4 + ...

      - solutions_toutes_sommes(4, 40, 4, 1, 10, Nb_Solutions).
        idem sans les positions
 
	- affiche_solutions_somme_positions(15, 4, 1, 10).
	  affiche les facons de distributer la valeur 15 sur 4 cartes
	  chacune avec une valeur minimale de 1 et maximale de 10

	- affiche_solutions_somme(15, 4, 1, 10).
	  idem sans les positions

    - affiche_solutions_toutes_sommes_positions(4, 40, 4, 1, 10).
      affiche le nombre de façons de distribuer 
      la valeur 4 sur 4 cartes
      ...
      la valeur 40 sur 4 cartes
      Nb_solutions est une liste.

    - affiche_solutions_toutes_sommes(4, 40, 4, 1, 10).
      idem sans tenir compte des positions

	- affiche_solutions(Sols)
	  affiche proprement la liste des solutions Sols
*/
/* ========================================================================== */

:- module(solutions_somme, 
		  [
            solutions_somme_positions/6,
            solutions_somme/6,
            solutions_toutes_sommes_positions/7,
            solutions_toutes_sommes/7,

			affiche_solutions_somme_positions/4,
			affiche_solutions_somme/4,
            affiche_solutions_toutes_sommes_positions/5,
            affiche_solutions_toutes_sommes/5,
			affiche_solutions/1,

            effectifs_distributions_sommes_positions/9,
            effectifs_distributions_sommes/9
          ]
         ).

/* ================================= FONCTIONS ============================== */

% --------- 
effectifs_distributions_sommes_positions(Somme, Somme_max, N, 
                                         Min, Max,
                                         Nb_sommes, Effectifs_sommes, 
                                         Nb_distributions,
                                         Effectifs_distributions) :-
    solutions_toutes_sommes_positions(Somme, Somme_max, N, 
                                      Min, Max, Effectifs_sommes, Nb_sommes),
    recupere_distributions(Effectifs_sommes, Valeurs),
    msort(Valeurs, Valeurs1),
    length(Valeurs1, Nb_distributions),
    effectifs(Valeurs1, Effectifs_distributions).

% ---------
effectifs_distributions_sommes(Somme, Somme_max, N, Min, Max,
                               Nb_sommes, Effectifs_sommes, 
                               Nb_distributions,
                               Effectifs_distributions) :-
    solutions_toutes_sommes(Somme, Somme_max, N, 
                            Min, Max, Effectifs_sommes, Nb_sommes),
    recupere_distributions(Effectifs_sommes, Valeurs),
    msort(Valeurs, Valeurs1),
    length(Valeurs1, Nb_distributions),
    effectifs(Valeurs1, Effectifs_distributions).

% ----------
recupere_distributions([], []) :-
    !.

% ----------
recupere_distributions([e(_Somme, Nb)|Effectifs_sommes], [Nb|Distributions]) :-
    recupere_distributions(Effectifs_sommes, Distributions).

% ----------
    % calcule le nombre de solutions pour toutes les sommes jusqu'a Somme_max
solutions_toutes_sommes_positions(Somme, Somme_max, _N, _Min, _Max, [], 0) :-
    Somme > Somme_max,
    !.
    
solutions_toutes_sommes_positions(Somme, Somme_max, N, Min, Max, 
                                  [e(Somme, Nb) | Nb_solutions], 
                                  Effectif_total) :-
    solutions_somme_positions(Somme, N, Min, Max, Nb, _Sols),
    Somme1 is Somme + 1,
    solutions_toutes_sommes_positions(Somme1, Somme_max, N, Min, Max, 
                                      Nb_solutions, Effectif),
	Effectif_total is Nb + Effectif.
    
% ----------
    % calcule le nombre de solutions pour toutes les sommes jusqu'a Somme_max
solutions_toutes_sommes(Somme, Somme_max, _N, _Min, _Max, [], 0) :-
    Somme > Somme_max,
    !.
    
solutions_toutes_sommes(Somme, Somme_max, N, Min, Max, 
                        [e(Somme, Nb) | Nb_solutions], Effectif_total) :-
    solutions_somme(Somme, N, Min, Max, Nb, _Sols),
    Somme1 is Somme + 1,
    solutions_toutes_sommes(Somme1, Somme_max, N, Min, Max, Nb_solutions, 
                            Effectif),
	Effectif_total is Nb + Effectif.

% ----------
	% nombre de facons de distributer une somme S sur N cartes
	% chacune ayant une valeur minimale Min et maximale N
solutions_somme_positions(
							S,		 % valeur de la somme 
							N, 		 % nombre de cartes
							Min, 	 % valeur minimale d'une carte
							Max,	 % valeur maximale d'une carte
							Nb_sols, % nombre de solutions
						 	Sols	 % solutions
						 ) :-
	solutions_somme_positions2(S, N, Min, Max, Sols),
	length(Sols, Nb_sols).

% ----------
	%  idem sans les positions
solutions_somme(S, N, Min, Max, Nb_sols, Sols) :-
	solutions_somme_positions2(S, N, Min, Max, Sols1),
	ordonne_solutions(Sols1, Sols2),
	sort(Sols2, Sols),
	length(Sols, Nb_sols).

% ----------
	% cas pathologique : aucune carte
solutions_somme_positions2(_S, 0, _Min, _Max, []) :-
	!.

	% S trop grand
solutions_somme_positions2(S, N, _Min, Max, []) :-
	S > N * Max,
	!.

	% S trop petit
solutions_somme_positions2(S, N, Min, _Max, []) :-
	S < N * Min,
	!.

	% une carte
solutions_somme_positions2(S, 1, _Min, _Max, [[S]]) :-
	!.

	%  S peut etre distribuee sur N cartes
solutions_somme_positions2(
							S,		% valeur de la somme 
							N, 		% nombre de cartes
							Min, 	% valeur minimale d'une carte
							Max,	% valeur maximale d'une carte
						 	Sols	% solutions
						 ) :-
	Smin is S - (N-1) * Max,    % valeur min de la carte en cette position
								% en supposant que les autres cartes prennent
								% leur valeur Max
	check_valeur_min(Smin, Min, Smin1), % Vmin doit etre positive

	Smax is S - (N-1) * Min,	% valeur max de la carte en cette position
								% en supposant que les autres cartes prennent
								% leur valeur Min
	check_valeur_max(Smax, Max, Smax1),
	calcule_nb_solutions(S, Smin1, Smax1, N, Min, Max, Sols).

% ----------
	% Nb facons de distribuer la valeur V sur N cartes
	% Vmax est la valeur maximale que peut prendre V

	% N >= 2
calcule_nb_solutions(_S, V, Vmax, _N, _Min, _Max, []) :-
	V > Vmax,
	!.
	
	% V <= Smax
calcule_nb_solutions(S, V, Vmax, N, Min, Max, Sols) :-
	S1 is S-V,
	N1 is N-1,
			% facons de distribuer la valeur S1 sur N-1 cartes
	solutions_somme_positions2(S1, N1, Min, Max, Sols1),
	ajoute_elt(Sols1, V, SolsA),
	V1 is V+1,
	calcule_nb_solutions(S, V1, Vmax, N, Min, Max, Sols2),
	append(SolsA, Sols2, Sols).

/* ============================ CALCULS ET AFFICHAGES ======================= */

% ----------
affiche_solutions_toutes_sommes_positions(Somme, Somme_max, N, Min, Max) :-
    solutions_toutes_sommes_positions(Somme, Somme_max, N, Min, Max, 
                                      Solutions, Effectif_total),
    affiche_solutions(Solutions),
	write('effectif total : '),
	writeln(Effectif_total).

% ----------
affiche_solutions_toutes_sommes(Somme, Somme_max, N, Min, Max) :-
    solutions_toutes_sommes(Somme, Somme_max, N, Min, Max, 
                            Solutions, Effectif_total),
    affiche_solutions(Solutions),
	write('effectif total : '),
	writeln(Effectif_total).

% ----------
	% affiche toutes les facons distributer une somme S sur N cartes
	% chacune ayant une valeur minimale Min et maximale N
affiche_solutions_somme_positions(S, N, Min, Max) :-
	solutions_somme_positions2(S, N, Min, Max, Sols),
	length(Sols, Nb_sols),
	nl,
	write('nombre de solutions : '),
	writeln(Nb_sols),
	writeln('solutions : '),
	affiche_solutions(Sols).

	% idem sans les solutions
affiche_solutions_somme(S, N, Min, Max) :-
	solutions_somme(S, N, Min, Max, Nb_sols, Sols),  
	nl,
	write('nombre de solutions sans les positions : '),
	writeln(Nb_sols),
	writeln('solutions : '),
	affiche_solutions(Sols).

% ----------
affiche_solutions([]) :-
	!.

affiche_solutions([Sol|Sols]) :-
	writeln(Sol),
	affiche_solutions(Sols).

/* ================================= DIVERS ================================= */

% -----------
ordonne_solutions([], []) :-
	!.

ordonne_solutions([Sol|Sols], [Sol1|Sols1]) :-
	msort(Sol, Sol1),
	ordonne_solutions(Sols, Sols1).

% ---------
	% s'assure que Vmin correct
check_valeur_min(Vmin, Min, Min) :-
	Vmin < Min,
	!.

check_valeur_min(Vmin, _Min, Vmin).

% ---------
	% s'assure que Vmax est correct
check_valeur_max(Vmax, Max, Max) :-
	(Vmax < 0 ; Vmax > Max),
	!.

check_valeur_max(Vmax, _Max, Vmax).

% ----------
	% ajoute E a chaque liste de LL
ajoute_elt([], _E, []) :-
	!.

ajoute_elt([L|LL], E, [[E|L]|LL1]) :-
	ajoute_elt(LL, E, LL1).

/* ============================ FIN LISTING ================================= */
