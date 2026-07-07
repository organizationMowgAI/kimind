% ============================================================================ %
%                    BK RELATIVE A LA CARACTERISATION                          % 
%                      D'UNE SOLUTION DU JEU KIMIND                            %
% ============================================================================ %
  
:- module(bk_solution, 
          [
			dichotomic_domains_solution/2,
			limits_domains_solution/2,
			solution_follows_colours_order/2,
			solution_follows_reversed_colours_order/2,
			nb_values_6_or_9_in_solution/2
          ]
         ).
 
:- 
	use_module(fonctions_enonce),
	use_module(fonctions_solution).

/* ================================ RULES =================================== */

% ----------
	% la Solution de l'Instance Kimind se prete a une strategie dichotomique
dichotomic_domains_solution(Instance, Solution) :-
	dichotomic_solution(Instance, Solution).
	
% ----------
	% la Solution de l'Instance Kimind utilise les valeurs limites 
	% des domaines possibles des valeurs 
limits_domains_solution(Instance, Solution) :-
	limits_solution(Instance, Solution).

% ----------
	% la Solution de l'Instance Kimind suit l'ordre des couleurs de l'Instance 
solution_follows_colours_order(instance(_Sum, Colours_order), Solution) :-
	same_colours_order_solution(Colours_order, Solution).

% ----------
	% la Solution de l'Instance Kimind suit l'ordre inverse des couleurs de l'Instance 
solution_follows_reversed_colours_order(instance(_Sum, Colours_order), Solution) :-
	reversed_colours_order_solution(Colours_order, Solution).

% ----------
	% Recupere le nombre de fois ou les valeurs de la solution sont 6 et/ou 9 
nb_values_6_or_9_in_solution(Solution, N) :-
	nb_occurrences_of_6_or_9_in_solution(Solution, N).

/* =============================== FIN LISTING ============================== */
