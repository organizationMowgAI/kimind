% ============================================================================ %
%                       CARACTERISTIQUES DES ENONCES ET SOLUTIONS              % 
%                               D'UN PROBLEME KIMIND                           %
%                        BENCHMARK SUR LES 25 PARTIES JOUEES                   %					                             
% ============================================================================ %
   
:- module(benchmark,
            [
                benchmark/1,
                ordre_vers_atom/2,
                get_infos_parties/2
            ]
        ).

:- 
	use_module(fichier),
    use_module(bk_partie),
	use_module(partie),
	use_module(liste),
    use_module(fonctions_enonce),
	use_module(gestion_module).

% ============================================================================ %

benchmark(Output_dir) :-
    Dir = '../parties_joueurs_plus/alexis/',
    Extension = '.pl',
    fichier:recupere_noms_fichiers(Dir, Extension, Noms_fichiers),
    nl,
	liste:display_liste(Noms_fichiers),
    nl,
	partie:lit_parties_dir(Noms_fichiers, Dir, Parties),
	get_infos_parties(Parties, Infos_parties),
	sort(1, <, Infos_parties, Infos_parties1),
    length(Infos_parties1, L),
	nl,
	write('nombre de parties : '),
    writeln(L),
    nl,
    write_benchmark(Infos_parties1, Output_dir).

get_infos_parties([], []) :-
        !.

get_infos_parties([Partie|Parties], [Infos_Partie|Infos_parties]) :-
    get_infos_partie(Partie, Infos_Partie),
    get_infos_parties(Parties, Infos_parties).

get_infos_partie(Partie, infos_partie(Num_partie, Somme, Ordre, Solution)) :-
    partie:get_partie_prolog3(num_partie, Partie, Num_partie),
    partie:get_partie_prolog3(somme, Partie, Somme),
    partie:get_partie_prolog3(ordre_couleurs, Partie, Ordre),
    partie:get_partie_prolog3(solution, Partie, Solution).

% ----------
write_benchmark(Infos_parties, Output_dir) :-
    atom_concat(Output_dir, '/benchmark.txt', Output_file),
    setup_call_cleanup(
        open(Output_file, write, Stream),
        write_benchmark_stream(Stream, Infos_parties),
        close(Stream)
    ).

% ----------
write_benchmark_stream(_, []) :-
    !.

write_benchmark_stream(Stream, 
				       [infos_partie(Num_partie, Somme, Ordre, Solution)|Infos_parties]) :-
	write('writing game '),
	write(Num_partie),
	writeln(' characteristics'),
    ordre_vers_atom(Ordre, Order_string),
	gestion_module:reset_module(running_game),
	get_couleurs(Ordre, Couleurs),
	running_game:assert(couleurs(Couleurs)),
    bk_partie:instance_characteristics(instance(Somme, Order_string), 
									   Solution, Characteristics),
	fonctions_enonce:nb_solutions_instance(_, instance(Somme, Order_string), 
										   Nb_sols),
    write_game_info(Stream, Num_partie, Somme, Ordre,  
					Nb_sols, Solution, Characteristics),
    write_benchmark_stream(Stream, Infos_parties).

% ----------
write_game_info(Stream, Num_partie, Somme, Ordre, Nb_sols, Solution,
    characteristics(Difficulty, Domain_characteristic, Colours_order)) :-
	ordre_to_string(Ordre, String_order),
    format(Stream, "Game ~w~n", [Num_partie]),
    format(Stream, "    - Instance ~t~40+ ~n", []),
    format(Stream, "        - Sum~t~40+: ~w~n", [Somme]),
    format(Stream, "        - Colours order~t~40+: ~w~n", [String_order]),
    format(Stream, "        - Solution~t~40+: ~w~n", [Solution]),
    format(Stream, "    - Instance characteristics ~t~40+ ~n", []),
    % format(Stream, "        - Nombre de solutions possibles~t~40+: ~w~n", [Nb_sols]),
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
ordre_vers_atom(Liste, Atom) :-
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
