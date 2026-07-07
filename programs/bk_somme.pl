/* ========================================================================== */
/*                     BK SUR LES ENONCES KIMIND EN NE TENANT                 */
/*            COMPTE QUE DE LA CONTRAINTE SUR LA SOMME DES VALEURS            */
/* ========================================================================== */

:- module(bk_somme, 
          [
            unique_solution_sum/1,
            difficulty_sum/3
          ]
         ).
 
:- use_module(fonctions_somme).

:- discontiguous high_number_solutions/2.
:- discontiguous medium_number_solutions/2.
:- discontiguous small_number_solutions/2.

/* ================================ RULES =================================== */

unique_solution_sum(Sum) :-
    fonctions_somme:nb_solutions(Sum, 1).

    % The difficulty associated with a Sum depends on the number of solutions
    % and the number of categories
    % ex) 3 categories [easy, intermediary, difficulty]
    % ex) 5 categories [very_easy, easy, intermediary, difficulty, very_difficult]
difficulty_sum(Sum, Difficulty, Nb_categories) :-
	fonction_somme:nb_solutions(Sum, Nb_solutions),
    fonction_somme:nb_solutions_positions(Sum, Nb_solutions1),
	writeln(Nb_solutions1),
	difficulty_sum_solutions(Nb_solutions, Difficulty, Nb_categories).

    % difficulte en fonction des sommes
	% si 5 categories
difficulty_sum_solutions(Nb_solutions, very_difficult, _Nb_categories) :-        
    very_high_number_solutions(T),
    Nb_solutions >= T,
    !.

difficulty_sum_solutions(Nb_solutions, difficult, Nb_categories) :-
    high_number_solutions(T, Nb_categories),
    Nb_solutions >= T,
    !.

difficulty_sum_solutions(Nb_solutions, intermediary, Nb_categories) :-
    medium_number_solutions(T, Nb_categories),
    Nb_solutions >= T,
    !.

difficulty_sum_solutions(Nb_solutions, easy, Nb_categories) :-
    small_number_solutions(T, Nb_categories),
    Nb_solutions >= T,
    !.

	% si 5 categories
difficulty_sum_solutions(Nb_solutions, very_easy, _Nb_categories) :- 
    very_small_number_solutions(T),
    Nb_solutions >= T.

/* ========================= DEFINITION DES SEUILS ========================== */

    % Chaque nombre represente le nombre de solutions minimal pour etre dans la
    % categorie indiquee par le nom du predicat (easy, difficult, ...)
	% (les seuils ont ete calcules par des quintiles)

    % Pour 3 categories, sans prendre en compte les positions.
	% limites inferieures des categories
high_number_solutions(31, 3).
medium_number_solutions(10, 3).
small_number_solutions(1, 3).

    % Pour 5 categories, sans prendre en compte les positions.
	% limites inferieurs des categories
very_high_number_solutions(37).
high_number_solutions(26, 5).
medium_number_solutions(12, 5).
small_number_solutions(4, 5).
very_small_number_solutions(1).

/* ================================= FIN BK ================================= */
