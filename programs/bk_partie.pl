% ============================================================================ %
%                    BK RELATIVE A LA CARACTERISATION                          % 
%                              D'UNE PARTIE                                    %
% ============================================================================ %
  
:- module(bk_partie, 
          [
			instance_characteristics/3
          ]
         ).
 
:- 
	use_module(bk_enonce),
	use_module(bk_solution),
    use_module(fonctions_enonce),
	use_module(gestion_module).

/* ================================ RULES =================================== */

% La partie Instance dont la solution est Solution a les caractéristiques 
% Difficulty, Domain_characteristic et Colours_order.
% Format :
%   - Instance : instance(22,'r<b<g<y')
%   - Solution : [c(0, red, 2), c(1, blue, 4), c(2, green, 7), c(3, yellow,9)]
%   - Difficulty : very_difficult/difficult/average/easy/very_easy
%   - Domain_characteristic : dichotomic/limit
%   - Colours_order : same/reversed

% ----------
instance_characteristics(	
						 Instance, Solution,
                         characteristics(Difficulty, Domain_characteristic, 
					 					 Colours_order)
						 ) :-
    bk_enonce:difficulty_instance(pos, Instance, 5, Difficulty),
    domains_characteristics(Instance, Solution, Domain_characteristic),
    solution_colours_order_wrt_instance(Instance, Solution, Colours_order).

% ----------
domains_characteristics(Instance, Solution, dichotomic) :-
    bk_solution:dichotomic_domains_solution(Instance, Solution),
	!.

domains_characteristics(Instance, Solution, limit) :-
    bk_solution:limits_domains_solution(Instance, Solution),
    !.

domains_characteristics(_Instance, _Solution, other).

% ----------
solution_colours_order_wrt_instance(Instance, Solution, same) :-
    bk_solution:solution_follows_colours_order(Instance, Solution),
    !.

solution_colours_order_wrt_instance(Instance, Solution, reversed) :-
    bk_solution:solution_follows_reversed_colours_order(Instance, Solution),
    !.

solution_colours_order_wrt_instance(_Instance, _Solution, other).

/* =============================== FIN LISTING ============================== */
