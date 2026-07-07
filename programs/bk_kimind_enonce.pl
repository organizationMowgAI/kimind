% ============================================================================ %
%                    BK RELATIVE A LA DIFFICULE D'UN ENONCE KIMIND             %
%                    un enonce est de la forme enonce(Somme, Ordre)            %
% ============================================================================ %
  
:- module(
        bk_kimind_enonce,
        [
         	enonce_sum/2
        ]
    ).

:- 
    use_module(library(csv)),
	use_module(fonctions_somme).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% ENONCES %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% ============================ Nombre de solutions =========================== %

	% definition des seuils
threshold_sum(5, easy).	% < 5 => tres facile
threshold_sum(10, mid).   % > 10 => difficile

threshold_sum_order(5, easy).
threshold_sum_order(10, mid).

threshold_sum_order_position(5, easy).
threshold_sum_order_position(10, mid).

% ------------------------------ Somme uniquement ---------------------------- %

	% qualifie la difficulte d'un enonce en fonction du nombre de solutions
	% lorsqu'on ne tient compte que de la contrainte sur la Somme des valeurs
	% retourne l'atome difficulte(N, Difficulte) ou N est le nombre de solutions
	%  et Difficulte un qualificatif sur la difficulte.
enonce_sum(
            enonce(Sum, _Order), 
            difficulty(Sum, Nb_solutions, Solutions, Difficulty)
          ) :-
	solutions_somme:solutions_somme_positions(Sum, 4, 1, 10, 
                                              Nb_solutions, Solutions),
	difficulty_sum(Nb_solutions, Difficulty).

	% qualifie l'enonce en fonction du nombre de solutions
difficulty_sum(1, very_easy) :-
	!.

difficulty_sum(N, easy) :-
	threshold_sum(S, easy),
	N =< S,
	!.

difficulty_sum(N, moyen) :-
	threshold_sum(S, mid),
	N =< S,
	!.

difficulty_sum(_, difficult).

% ----------------------- Enonce complet (Somme + Ordre) --------------------- %

enonce_sum_order(
            	  enonce(Sum, _Order), 
            	  difficulty(Nb_solutions, Difficulty)
          		) :-
	fonctions_somme:solutions_somme_positions(Sum, 4, 1, 10, 
										      Nb_solutions, Solutions),
	difficulty_sum_order(Nb_solutions, Difficulty),
	writeln(Solutions).

difficulty_sum_order(1, very_easy) :-
	!.

difficulty_sum_order(N, easy) :-
	threshold_sum_order(S, easy),
	N =< S,
	!.

difficulty_sum_order(N, moyen) :-
	threshold_sum_order(S, mid),
	N =< S,
	!.

difficulty_sum_order(_, difficult).

% -------------------------- (Somme + ordre) avec place----------------------- %

enonce_sum_order_position(
            			   enonce(Sum, Order), 
            			   difficulty(Nb_solutions, Difficulty)
          				 ) :-
	nb_sol_sum_order_position(Sum, Order, Nb_solutions),
	difficulty_sum_order_position(Nb_solutions, Difficulty).

difficulty_sum_order_position(1, very_easy) :-
	!.

difficulty_sum_order_position(N, easy) :-
	threshold_sum_order_position(S, easy),
	N =< S,
	!.

difficulty_sum_order_position(N, moyen) :-
	threshold_sum_order_position(S, mid),
	N =< S,
	!.

difficulty_sum_order_position(_, difficult).

% =================================== Ordre ================================== %

% Nombre de =
eq3(Enonce) :- 
	nb_eq(Enonce, 3).

eq2(Enonce) :- 
	nb_eq(Enonce, 2).

eq1(Enonce) :- 
	nb_eq(Enonce, 1).

eq0(Enonce) :- 
	nb_eq(Enonce, 0).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% ENONCE + SOLUTION %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% ============================== Ordre wrt place ============================= %

solution_order_wrt_position(Enonce, Solution, asc) :-
	solution_order_pos_same(Enonce, Solution).

solution_order_wrt_position(Enonce, Solution, desc) :-
	solution_order_pos_inv(Enonce, Solution).

solution_order_wrt_position(Enonce, Solution, other) :-
	\+ solution_order_pos_same(Enonce, Solution),
	\+ solution_order_pos_inv(Enonce, Solution).

% ============================ Dichotomique ou limite ======================== %

solution_values(Enonce, Solution, dicho) :-
	solution_values_dicho(Enonce, Solution).

solution_values(Enonce, Solution, limit) :-
	solution_values_limit(Enonce, Solution).
