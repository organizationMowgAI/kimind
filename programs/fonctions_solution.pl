/* ========================================================================== */
/*                 CARACTERISE UNE SOLUTION DU JEU KIMIND                     */          
/* ========================================================================== */

:- module(
		  fonctions_solution, 
          [
			dichotomic_solution/2,
			limits_solution/2,
			same_colours_order_solution/2,
			reversed_colours_order_solution/2,
			nb_occurrences_of_6_or_9_in_solution/2
		  ]
         ).

:-
	use_module(fonctions_enonce),
	use_module(strategie).
	
/* ================================ FONCTIONS =============================== */

% ----------
	% la Solution de l'Instance Kimind se prete a une strategie dichotomique
dichotomic_solution(Instance, Solution) :-
    
	fonctions_enonce:solutions_instance_positions(Instance, Solutions),
	strategie:get_domaines_couleurs(Solutions, Extrema_couleurs),
						
	strategie:					% distance aux milieux de la solution
	somme_distances_milieux(Solution, Extrema_couleurs, Somme_distances),
								% distances aux milieux de toutes les solutions
	strategie:sommes_distances_milieux(Solutions, Extrema_couleurs, 
                                       Sommes_distances),
	stats:recupere_distributions(Sommes_distances, Distributions),
	msort(Distributions, Distributions1),
	stats:effectifs(Distributions1, Effectifs_distributions),
								% partition des distances
	stats:parties(Effectifs_distributions, 5, [Partie1|_Parties_distributions]),
								% on verifie que Distance est dans Partie1
	member(e(Somme_distances, _), Partie1).

% ----------
	% la Solution de l'Instance Kimind a une strategie 'valeurs limites'
limits_solution(Instance, Solution) :-
	fonctions_enonce:solutions_instance_positions(Instance, Solutions),
	strategie:get_domaines_couleurs(Solutions, Extrema_couleurs),
						
	strategie:		% distance aux milieux des domaines de la solution
	somme_distances_limites(Solution, Extrema_couleurs, Somme_distances),

					% distances aux bornes des domaines de toutes les solutions
	strategie:sommes_distances_limites(Solutions, Extrema_couleurs, 
                                       Sommes_distances),
	stats:recupere_distributions(Sommes_distances, Distributions),
	msort(Distributions, Distributions1),
	stats:effectifs(Distributions1, Effectifs_distributions),
								% partition des distances
	stats:parties(Effectifs_distributions, 5, [Partie1|_Parties_distributions]),
								% on verifie que Distance est dans Partie1
	member(e(Somme_distances, _), Partie1).

% ----------
	% La solution a le même ordre sur les couleurs que l'instance
same_colours_order_solution(Order_string, Solution) :-
	sort(1, @<, Solution, Sorted_solution),
	same_order(Order_string, Sorted_solution).

% ----------
	% L'ordre sur les couleurs de la solution est l'inverse de celui de l'instance
reversed_colours_order_solution(Order_string, Solution) :-
	sort(1, @>, Solution, Sorted_solution),
	same_order(Order_string, Sorted_solution).

% ----------
same_order(Order_string, Sorted_solution) :-
	findall(Colour, member(c(_Position, Colour, _Value), Sorted_solution), Order),
	string_to_colours(Order_string, Order).

% ----------
	% Permet de recuperer une liste de couleurs a partir d'un ordre sur les couleurs d'un enonce.
	% Exemple :
	% Si	String = 'r<b<g<y'	alors	Colours = [red,blue,green,yellow]
string_to_colours(String, Colours) :-
    atom_chars(String, Chars),
	exclude(=('<'), Chars, Tmp),
	exclude(=('='), Tmp, Letters),
    maplist(colour, Letters, Colours).

% ----------
	% Encodage des couleurs
colour(r, red).
colour(b, blue).
colour(g, green).
colour(y, yellow).

% ----------
	% Compte le nombre d'occurrences de 6 et/ou 9 dans la solution
nb_occurrences_of_6_or_9_in_solution([c(0, _C1, V1),
									  c(1, _C2, V2),
									  c(2, _C3, V3),
									  c(3, _C4, V4)],
									  N) :-
	nb_values_6_or_9_in_list([V1, V2, V3, V4], N).

% ----------
	% Compte le nombre de fois ou 6 et/ou 9 apparaissent dans une liste
nb_values_6_or_9_in_list([], 0) :-
	!.

nb_values_6_or_9_in_list([V|Values], New_N) :-
	nb_values_6_or_9_in_list(Values, N),
	value_6_or_9(V),
	!,
	New_N is N + 1.

nb_values_6_or_9_in_list([_V|Values], N) :-
	nb_values_6_or_9_in_list(Values, N).

% ----------
value_6_or_9(6).
value_6_or_9(9).

/* =============================== DIVERS =================================== */

% ----------
get_couleurs(instance(_Somme, Ordre_couleurs), Couleurs) :-
    string_to_colours(Ordre_couleurs, Couleurs).

% ----------
ajoute_positions([], _Position, []) :-
	!.

ajoute_positions([c(Couleur, Valeur)|Cartes], Position,
                 [c(Position, Couleur,Valeur)|Cartes1]) :-
	Position1 is Position + 1,
	ajoute_positions(Cartes, Position1, Cartes1).

/* =============================== AFFICHAGE ================================ */


/* ================================ DIVERS ================================== */


/* =============================== FIN LISTING ============================== */ 
