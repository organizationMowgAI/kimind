% ============================================================================ %
%                    CHERCHE ET ECRIT TOUTES LES CARACTERISTIQUES              %
%                             D'UN ENONCE KIMIND  KIMIND                       %
% ============================================================================ %
  
:- module(ecrit_caracteristiques_enonce, 
          [
			write_caracteristiques_enonce/5
          ]
         ).
         
:- use_module(gestion_module).


% ----------	
write_caracteristiques_enonce(Stream, Num_partie, Somme, Ordre, Solution) :-
	write('writing game '),
	write(Num_partie),
	writeln(' characteristics'),
    ordre_vers_atom2(Ordre, Order_string),
	gestion_module:reset_module(running_game),
	get_couleurs(Ordre, Couleurs),
	running_game:assert(couleurs(Couleurs)),
    bk_partie:instance_characteristics(instance(Somme, Order_string), 
									   Solution, Characteristics),
	fonctions_enonce:
	nb_solutions_instance(_, instance(Somme, Order_string), Nb_sols),
    write_game_info(Stream, Num_partie, Somme, Ordre,  
					Nb_sols, Solution, Characteristics). 
 
% ----------
write_game_info(Stream, Num_partie, Somme, Ordre, Nb_sols, Solution,
    				characteristics(Difficulty, Domain_characteristic, 
    				Colours_order)) :-
	ordre_to_string(Ordre, String_order),
    format(Stream, "Game ~w~n", [Num_partie]),
    format(Stream, "    - Instance ~t~40+ ~n", []),
    format(Stream, "        - Sum~t~40+: ~w~n", [Somme]),
    format(Stream, "        - Colours order~t~40+: ~w~n", [String_order]),
    format(Stream, "        - Solution~t~40+: ~w~n", [Solution]),
    format(Stream, "    - Instance characteristics ~t~40+ ~n", []),
    format(Stream, "        - Number of possible solutions ~t~40+: ~w~n", [Nb_sols]),
    format(Stream, "        - Difficulty~t~40+: ~w~n", [Difficulty]),
    format(Stream, "        - Value-guessing strategy ~t~40+: ~w~n", [Domain_characteristic]),
    format(Stream, "        - Colours order of the solution ~t~40+: ~w~n~n", [Colours_order]).

% ----------
	% convertit la liste Ordre en String
ordre_to_string(Ordre, String) :-
	add_spaces(Ordre, Ordre1),
	atomic_list_concat(Ordre1, String).

% ----------
add_spaces([], []) :-
	!.

add_spaces([E], [E]) :-
	!.

add_spaces([E|L], [E,' '|L1]) :-
	add_spaces(L, L1).
	
% ----------
couleur_lettre(yellow, y).
couleur_lettre(red,    r).
couleur_lettre(blue,   b).
couleur_lettre(green,  g).

% ----------
ordre_vers_atom2(Liste, Atom) :-
    maplist(element_vers_atom, Liste, Atomes),
    atomic_list_concat(Atomes, '', Atom).

% ----------
element_vers_atom(Elem, Atom) :-
    couleur_lettre(Elem, Lettre),
    !,
    atom_string(Atom, Lettre).

element_vers_atom(Elem, Atom) :-
    atom_string(Atom, Elem).

/* ================================ DIVERS ================================== */

	% ----------
get_couleurs([], []) :-
	!.

get_couleurs([Op|Couleurs], Couleurs1) :-
	member(Op, ['<', '=']),
	!,
	get_couleurs(Couleurs, Couleurs1).

get_couleurs([Couleur|Couleurs], [Couleur|Couleurs1]) :-
	get_couleurs(Couleurs, Couleurs1).

/* =============================== FIN LISTING ============================== */
