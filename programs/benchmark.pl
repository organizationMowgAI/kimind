% ============================================================================ %
%                       CARACTERISTIQUES DES ENONCES ET SOLUTIONS              % 
%                               D'UN PROBLEME KIMIND                           %
%                    BENCHMARK SUR LES 25 ENONCES PROPOSES A NUKKAI            %					                             
% ============================================================================ %
   
:- module(benchmark,
            [
                benchmark/2,
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
	use_module(gestion_module),
	use_module(ecrit_caracteristiques_enonce).

% ============================================================================ %

benchmark(Games_dir, Output_file) :-
    Extension = '.pl',
    fichier:recupere_noms_fichiers(Games_dir, Extension, Noms_fichiers),
    nl,
	liste:display_liste(Noms_fichiers),
    nl,
	partie:lit_parties_dir(Noms_fichiers, Games_dir, Parties),
	get_infos_parties(Parties, Infos_parties),
	sort(1, <, Infos_parties, Infos_parties1),
    length(Infos_parties1, L),
	nl,
	write('nombre de parties : '),
    writeln(L),
    nl,
    write_benchmark(Infos_parties1, Output_file).

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
write_benchmark(Infos_parties, Output_file) :-
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
	ecrit_caracteristiques_enonce:
	write_caracteristiques_enonce(Stream, Num_partie, Somme, Ordre, Solution),
	write_benchmark_stream(Stream, Infos_parties).
	
% ----------
	% convertit un ordre couleurs [blue, <, red, =, yellow, < green]
	% en un atome 'b<r=y<g'
ordre_vers_atom(Liste, Atom) :-
    convertit_couleurs(Liste, Liste1),
    atomic_list_concat(Liste1, '', Atom).
    
% ----------    
convertit_couleurs([], []) :-
	!.
	
convertit_couleurs([Op|Ordre_couleurs], [Op|Ordre_couleurs1]) :-
	member(Op, [<,=]),
	!,
	convertit_couleurs(Ordre_couleurs, Ordre_couleurs1).
	
convertit_couleurs([Couleur|Ordre_couleurs], [Couleur1|Ordre_couleurs1]) :-
	convertit_couleur(Couleur, Couleur1),
	convertit_couleurs(Ordre_couleurs, Ordre_couleurs1).
	
% ----------
convertit_couleur(blue, b) :-
	!.
	
convertit_couleur(green, g) :-
	!.
	
convertit_couleur(red, r) :-
	!.
	
convertit_couleur(yellow, y).
	
/* ================================ FIN LISTING ============================= */	
	

