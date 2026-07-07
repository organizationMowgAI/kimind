/* ========================================================================== */
/*                  RETOURNE LES SOLUTIONS DE KIMIND SI L'ON NE TIENT         */
/*                COMPTE QUE DE LA CONTRAINTE SUR LA SOMME DES VALEURS        */
/* ========================================================================== */

/* ======================== EXEMPLES D'UTILISATION ========================== */
/*
	- solutions_somme_positions(15, 4, 1, 10, Nb_sols, Sols).
	  retourne le nombre (Nb_sols) et les solutions (Sols) 
	  correspondant à la facon de distribuer la valeur 15 sur 4 cartes, 
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

:- module(fonctions_somme, 
		  [

            nb_solutions/2,
            nb_solutions_positions/2,

            difficultes_sommes_positions/2,
            difficulte_somme_positions/4,

            difficultes_sommes/2,
            difficulte_somme/4,

            solutions_somme_positions/6,
            solutions_somme/6,
            solutions_toutes_sommes_positions/6,
            solutions_toutes_sommes/6,

	    	affiche_solutions_somme_positions/4,
	        affiche_solutions_somme/4,
            affiche_solutions_toutes_sommes_positions/5,
            affiche_solutions_toutes_sommes/5,

            effectifs_sommes_distributions_positions/7,
            effectifs_sommes_distributions/7,

            seuils/2
          ]
         ).
 
:- 
    use_module(stats),
    use_module(liste),
    use_module(difficulty_partition).
    
/* ===================== QUALIFICATION DIFFICULTE SOMME ===================== */

% ----------
sum_qualifications([easy, average, difficult]).
sum_qualifications([very_easy, easy, average, difficult, very_difficult]).

% ----------
    % qualifie les sommes en fonction du nombre de facons de les distribuer
    % et du nombre de difficultes (Nb_difficultes 3 ou 5)
difficultes_sommes_positions(Nb_difficultes, Partition_sommes) :-
    effectifs_sommes_distributions_positions(4, 40, 4, 1, 10, 
                                             Effectifs_sommes,
                                             Effectifs_distributions),
    traite_sommes(Nb_difficultes, Effectifs_sommes, 
                  Effectifs_distributions, Partition_sommes).

% ----------
% idem sans tenir compte des positions
difficultes_sommes(Nb_difficultes, Partition_sommes) :-
    effectifs_sommes_distributions(4, 40, 4, 1, 10, 
                                   Effectifs_sommes, Effectifs_distributions),
    traite_sommes(Nb_difficultes, Effectifs_sommes, 
                  Effectifs_distributions, Partition_sommes).

% ----------
    % qualifie la difficulte d'une somme (en tenant comptes des positions)
    % (Nb_qualificatifs >= 3 et impaire)
difficulte_somme_positions(Somme, Nb_qualificatifs, Difficulte_somme,
                           Distribution) :-
    difficultes_sommes_positions(Nb_qualificatifs, Difficultes),
    recherche_difficulte_somme(Difficultes, Somme, Difficulte_somme,
                               Distribution).

% ----------
difficulte_somme(Somme, Nb_qualificatifs, Difficulte_somme, Distribution) :-
    difficultes_sommes(Nb_qualificatifs, Difficultes),
    recherche_difficulte_somme(Difficultes, Somme, Difficulte_somme, 
                               Distribution).

% ----------
traite_sommes(Nb_qualificatifs, Effectifs_sommes, 
              Effectifs_distributions, Qualifications_sommes) :-
    stats:parties(Effectifs_distributions, Nb_qualificatifs, 
                  Parties_distributions),
    difficulty_partition:
    partition_instances(Effectifs_sommes, Parties_distributions, Parties_sommes),
    qualifie_parties(Parties_sommes, Qualifications_sommes).

% ----------
    % recherche Somme dans les parties (du a la partition des difficultes)
recherche_difficulte_somme([q(Difficulte, Partie)|_Parties], Somme, 
                            Difficulte, Distribution) :-
    member(e(Somme, Distribution), Partie),
    !.

recherche_difficulte_somme([_|Parties], Somme, Difficulte, Distribution) :-
    recherche_difficulte_somme(Parties, Somme, Difficulte, Distribution).
   

% ----------
    % On obtient les frontieres entre les categories en recuperant l'effectif le plus grand de toutes les categories sauf la derniere
    % Une categorie est de la forme q(difficulty,[e(a,eff_a),e(b,eff_b),...])
seuils([_Categorie], []) :-
    !.

seuils([Categorie|Categories], [Seuil|Seuils]) :-
    effectif_max(Categorie, Seuil),
    seuils(Categories, Seuils).

effectif_max(q(_Difficulte, L), M) :-
    findall(Y, member(e(_,Y), L), Ys),
    max_list(Ys, M).

% ----------
qualifie_parties(Parties, Parties_qualifiees) :-
    length(Parties, K),
    length(Qualifications, K),
    sum_qualifications(Qualifications),
    qualifie_parties2(Parties, Qualifications, Parties_qualifiees).

% ----------
qualifie_parties2([], [], []) :-
    !.

qualifie_parties2([Partie|Parties], [Qualif|Qualifs], 
                  [q(Qualif, Partie)|Parties_qualifiees]) :-
    qualifie_parties2(Parties, Qualifs, Parties_qualifiees).
    
/* ====================== DISTRIBUTION DES SOMMES =========================== */

% --------- 
effectifs_sommes_distributions_positions(Somme, Somme_max, N, 
                                         Min, Max,
                                         Effectifs_sommes,
                                         Effectifs_distributions) :-
    solutions_toutes_sommes_positions(Somme, Somme_max, N, 
                                      Min, Max, Effectifs_sommes),
    stats:recupere_distributions(Effectifs_sommes, Valeurs),
    msort(Valeurs, Valeurs1),
    stats:effectifs(Valeurs1, Effectifs_distributions).

% ---------
effectifs_sommes_distributions(Somme, Somme_max, N, Min, Max,
                               Effectifs_sommes, Effectifs_distributions) :-
    solutions_toutes_sommes(Somme, Somme_max, N, 
                            Min, Max, Effectifs_sommes),
    stats:recupere_distributions(Effectifs_sommes, Valeurs),
    msort(Valeurs, Valeurs1),
    stats:effectifs(Valeurs1, Effectifs_distributions).

/* ===================== SOLUTIONS EN FONCTION DE LA SOMME ================== */

% ----------
    % calcule le nombre de solutions pour toutes les sommes jusqu'a Somme_max
solutions_toutes_sommes_positions(Somme, Somme_max, _N, _Min, _Max, []) :-
    Somme > Somme_max,
    !.
    
solutions_toutes_sommes_positions(Somme, Somme_max, N, Min, Max, 
                                  [e(Somme, Nb)|Effectifs_somme]) :-
    solutions_somme_positions(Somme, N, Min, Max, Nb, _Sols),
    Somme1 is Somme + 1,
    solutions_toutes_sommes_positions(Somme1, Somme_max, N, Min, Max, 
                                      Effectifs_somme).
    
% ----------
    % calcule le nombre de solutions pour toutes les sommes jusqu'a Somme_max
solutions_toutes_sommes(Somme, Somme_max, _N, _Min, _Max, []) :-
    Somme > Somme_max,
    !.
    
solutions_toutes_sommes(Somme, Somme_max, N, Min, Max, 
                        [e(Somme, Nb)|Effectifs_somme]) :-
    solutions_somme(Somme, N, Min, Max, Nb, _Sols),
    Somme1 is Somme + 1,
    solutions_toutes_sommes(Somme1, Somme_max, N, Min, Max, Effectifs_somme).

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


% ----------
    % nombre de solutions (sans positions) en fonction de la somme
nb_solutions(Sum, Nb_solutions) :-
    solutions_somme(Sum, 4, 1, 10, Nb_solutions, _Sols).

% ----------
    % idem avec les positions 
nb_solutions_positions(Sum, Nb_solutions) :-
    solutions_somme_positions(Sum, 4, 1, 10, Nb_solutions, _Sols).

/* ============================ CALCULS ET AFFICHAGES ======================= */

% ----------
affiche_solutions_toutes_sommes_positions(Somme, Somme_max, N, Min, Max) :-
    solutions_toutes_sommes_positions(Somme, Somme_max, N, Min, Max, 
                                      Solutions),
    affiche_solutions(Solutions).

% ----------
affiche_solutions_toutes_sommes(Somme, Somme_max, N, Min, Max) :-
    solutions_toutes_sommes(Somme, Somme_max, N, Min, Max, 
                            Solutions),
    affiche_solutions(Solutions).

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

% ----------
listes_vides(0, []) :-
    !.

listes_vides(N, [[]|R]) :-
    N > 0,
    N1 is N - 1,
    listes_vides(N1, R).

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
