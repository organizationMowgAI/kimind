% ============================================================================ %
%                           SCENARIOS D'UTILISATION                            % 
%                                    DES BKs                                   %
% ============================================================================ %

:-
    use_module(benchmark),
	use_module(gestion_bk_joueur),
	use_module(bk_partie_joueur),
    use_module(collecte_infos_joueur),
	use_module(benchmark_joueur).  

/* ================================ SCENARIOS =============================== */

% ----------
	% Scenario 1 : Creer un benchmark des 25 parties
scenario1 :-
    benchmark:benchmark('../').

% ----------
	% Scenario 2 : Creer la BK du joueur Colin
scenario2 :-
	creation_bk('../parties_joueur', '../bk_joueurs', colin, 'J12').

% ----------
	% Scenario 3 : Creer la BK du joueur Mathilde
scenario3 :-
	creation_bk('../parties_joueur', '../bk_joueurs', mathilde, 'J7').

% ----------
	% Scenario 4 : Ajouter le fait difficulties(5) a la BK de Colin
scenario4 :-
	modif_bk_difficulties('../bk_joueurs', colin, 
						  [a(difficulties(5))]).

% ----------
scenario5 :-
	player_game_difficulty(
						   instance(15,'r=b=g<y'),
						   [c(0, red, 3), c(1, blue, 3), 
							c(2, green, 3), c(3, yellow, 6)]
                           ).
% ----------
	% Scenario 6 : Creer un benchmark des enoncés des 25 parties 
        % et l'afficher
scenario6 :-
	Dir = '../',
        benchmark:benchmark(Dir),
	afficher(Dir, 'benchmark.txt').

% ----------
	% Scenario 7 : Creer une BK d'un joueur et 
        % en recuperer l'interpretation en langage naturel
scenario7 :-
	Bk_dir = '../bk_joueurs',
	creation_bk('../parties_joueur', Bk_dir, jean, 'J12'),
	afficher(Bk_dir, 'jean-fr.txt'). 

% ----------
	% Scenario 8 : Ajout des difficultes relatives des parties a la BK d'un
	% joueur (apres ajout manuel de caracteristiques de preference)
scenario8 :-
	Bk_dir = '../bk_joueurs',
	benchmark_joueur:personalized_benchmark(Bk_dir, 'jean'),
	gestion_bk_joueur:display_bk(Bk_dir, jean),
	afficher(Bk_dir, 'jean-fr_difficultes.txt').

/* ========================= APPELS AUX BKS ================================= */

% ----------
/*
player_game_difficulty(Game, Solution) :-
	bk_partie_joueur:
	player_game_difficulty(
						   player_follows_colours_order,
						   Game,
						   Solution,
						   Player_difficulty
                           ),
	nl,
	write('game              : '),
	writeln(Game),
	nl,
	write('solution          : '),
	writeln(Solution),
	nl,
	write('game difficulty   : '),
	writeln(Game_difficulty),
	nl,
	write('player difficulty : '),
	writeln(Player_difficulty),
	nl,
	halt(0).
*/

% ----------
creation_bk(Input_dir, Output_dir, Joueur, Numero_joueur) :-
	%clear_screen,
	nl,
	nl,
	write('         ********** Get '),
	write(Joueur),
	write('''s characteristics playing **********'),
	nl,
	nl, 
	nl,
	write('         ********** Analysing '),
	write(Joueur),
	writeln('''s games **********'),
	nl,
	collecte_infos_joueurs:strategies_joueur(Input_dir, Output_dir,
											 Joueur, Numero_joueur),
	nl,
	nl,
	writeln('         ********* generated (or modified) BK **********'),
	nl,
	nl,	
	gestion_bk_joueur:display_bk(Output_dir, Joueur),
	nl,
	nl.

% ----------
	% modification de la BK : 
	% qualifie la difficulte d'une partie (Game + Solution)
	% en fonction des caracteristiques de Joueur presentes dans sa BK
	% situee dans Bk_dir
	% le resultat est ajoute a la Bk du joueur
	% exemple d'appel 
modif_bk_difficulties(Bk_dir, Joueur, Modifs_difficulties) :-
	nl,
	nl,
	gestion_bk_joueur:
	modify_bk_difficulties(Bk_dir, Joueur, Modifs_difficulties),
	gestion_bk_joueur:display_bk(Bk_dir, Joueur),
	nl,
	halt(0).

% ----------
afficher(Dir, File) :-
	atomic_list_concat([Dir, "/", File], Path),
	afficher_fichier(Path).

% ----------
afficher_fichier(Fichier) :-
    open(Fichier, read, Flux),
    lire_lignes(Flux),
    close(Flux).

% ----------
lire_lignes(Flux) :-
    read_line_to_string(Flux, Ligne),
    ( Ligne == end_of_file ->
        true
    ;
        writeln(Ligne),
        lire_lignes(Flux)
    ).

/* ================================= DIVERS ================================= */

clear_screen :-
    (   
		current_prolog_flag(windows, true)
    	->  shell('cls')
    	;   shell('clear')
    ).

/* =============================== FIN LISTING ============================== */
