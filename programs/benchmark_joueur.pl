% ============================================================================ %
%               BENCHMARK POUR DETERMINER LES DIFFICULTES D'UN JOUEUR          % 
%                     RELATIVEMENT AUX PARTIES QU'IL A JOUEES                  %
% ============================================================================ %

:- module(
            benchmark_joueur, 
            [
                personalized_benchmark/2
            ]
         ).
 
:-
    use_module(gestion_bk_joueur),
    use_module(benchmark),
    use_module(bk_partie_joueur),
    use_module(bk_enonce).

/* ================================ RULES =================================== */

/*
 Dans ce programme on met a jour la bk_joueur grace a la
 bk_partie et la bk_partie_joueur

 x) Si le joueur suit l'ordre des couleurs au premier coup, 
 alors on ajoute dans sa BK :

relative_game_difficulty(
	sum(34),
	colours_order('b<r<g<y'),
	solution(
		[
			c(0,blue,7),
			c(1,red,8),
			c(2,green,9),
			c(3,yellow,10)
		]
	),
	game_difficulty(very_easy),
	player_difficulties(
		[
			same_colours_order(very_easy),
			high_sum(easy)
		]
	)
).
*/

% ----------
    % Cree le benchmark personnalise pour Joueur dont la BK est dans Dossier_bk
    % Ce benchmark est ajoute dans la derniere partie de la BK du joueur
personalized_benchmark(Dossier_bk, Joueur) :-
    atomic_list_concat(['../parties_joueurs_plus/', Joueur, '/'], 
						Dossier_parties),
    Extension = '.pl',
    fichier:recupere_noms_fichiers(Dossier_parties, Extension, Noms_fichiers),
	partie:lit_parties_dir(Noms_fichiers, Dossier_parties, Parties),
	benchmark:get_infos_parties(Parties, Infos_parties1),
	sort(1, <, Infos_parties1, Infos_parties),
    length(Infos_parties, L),
	nl,
	write('Nombre de parties : '),
    writeln(L),
    nl,
    get_player_characteristics(Dossier_bk, Joueur, Player_characteristics),
    get_player_game_difficulties(Infos_parties, Player_characteristics, 
								 Player_difficulties),
    add_personalized_benchmark_to_bk(Dossier_bk, Joueur, Infos_parties, 
									 Player_difficulties).

% ----------
    % Recupere les caracteristiques du joueur
get_player_characteristics(Dossier_bk, Joueur, Player_characteristics) :-
    gestion_bk_joueur:lit_bk(Dossier_bk, Joueur, _En_tete, _Infos, 
							 Characteristics, _Difficulties),
    extract_predicates(Characteristics, Player_characteristics).

% ----------
    % Recolte toutes les difficultes relatives au joueur 
	% pour chaque partie qu'il a jouee
get_player_game_difficulties([], _Player_characteristics, 
							 _Player_game_difficulties) :-
    !.

get_player_game_difficulties(
	[infos_partie(_Num_partie, Somme, Ordre_couleurs, Solution)|Infos_parties],
    Player_characteristics,
    [Player_difficulty|Player_difficulties]
							) :-
							
    benchmark:ordre_vers_atom(Ordre_couleurs, Ordre), 
    difficulties_by_characteristic(Player_characteristics, 
								   instance(Somme, Ordre), Solution, 
								   Player_difficulty),
    get_player_game_difficulties(Infos_parties, Player_characteristics, 
								 Player_difficulties). 

% ----------
difficulties_by_characteristic([], _Game, _Solution, []) :-
    !.

difficulties_by_characteristic([Characteristic|Characteristics], Game, Solution, 
							   [Player_difficulty|Player_difficulties]) :-
    bk_partie_joueur:player_game_difficulty(Characteristic, Game, Solution, 
       										Player_difficulty),
    !,
    difficulties_by_characteristic(Characteristics, Game, Solution, 
								   Player_difficulties).

	% ??? utilite de cette clause ????
difficulties_by_characteristic([_Characteristic|Characteristics], Game, 
							   Solution, Player_difficulties) :-
    difficulties_by_characteristic(Characteristics, Game, Solution, 
								   Player_difficulties).

% ----------
    % Ajoute le benchmark a la BK du joueur
add_personalized_benchmark_to_bk(_Dossier_bk, _Joueur, [], []) :-
    !.

add_personalized_benchmark_to_bk(
                                 Dossier_bk,
                                 Joueur,
                                 [Infos_partie|Infos_parties],
                                 [Player_difficulty|Player_difficulties]
                                ) :-
    write_game_player_difficulty(Dossier_bk, Joueur, Infos_partie, 
								 Player_difficulty),
    add_personalized_benchmark_to_bk(Dossier_bk, Joueur, Infos_parties, 
									 Player_difficulties).

% ----------
    % Ecrit les donnees d'une partie avec la difficulte absolue et 
	% la difficulte relative
write_game_player_difficulty(
                             Dossier_bk,
                             Joueur,
                             infos_partie(
                                            Num_partie,
                                            Somme,
                                            Ordre_couleurs1,
                                            Solution
                                         ),
                             Player_difficulty
                            ) :-
    write('Ecriture partie '),
    writeln(Num_partie),
    benchmark:ordre_vers_atom(Ordre_couleurs1, Ordre_couleurs),
    bk_enonce:difficulty_instance(	
								  pos, 
								  instance(Somme, Ordre_couleurs), 
								   5, Game_difficulty),
    flatten_player_difficulty(Player_difficulty, Flattened_player_difficulty, 
							  Game_difficulty),
    gestion_bk_joueur:modify_bk_difficulties(
			Dossier_bk,
            Joueur,
            [a(relative_game_difficulty(
                                sum(Somme),
                                colours_order(Ordre_couleurs),
                                solution(Solution),
                                game_difficulty(Game_difficulty),
                                player_difficulties(Flattened_player_difficulty)
                                        )
               )
             ]
                                            ).

% ----------
    % La liste reste une liste seulement s'il y a plus d'un membre dedans
    % Si la liste est vide, on met la difficulte objective
flatten_player_difficulty(Player_difficulty, Game_difficulty, 
						  Game_difficulty) :-
    length(Player_difficulty, 0),
    !.

    % Si la liste comporte un seul element, on enleve les crochets
flatten_player_difficulty(Player_difficulty, Flattened_player_difficulty, 
						 _Game_difficulty) :-
    length(Player_difficulty, 1),
    !,
    member(Flattened_player_difficulty, Player_difficulty).

    % Si la liste comporte au moins deux elements, on la laisse telle quelle
flatten_player_difficulty(Player_difficulty, Player_difficulty, 
						  _Game_difficulty) :-
    length(Player_difficulty, Nb_difficulties),
    Nb_difficulties > 1.

% ----------
extract_predicates(Strings, PredNames) :-
    include(valid_line, Strings, Filtered),
    maplist(string_to_pred, Filtered, PredNames).

% ----------
valid_line(S) :-
    S \= "",
    \+ sub_string(S, 0, 2, _, '/*').

% ----------
string_to_pred(S, Name) :-
    term_string(Term, S),
    functor(Term, Name, _).

/* ============================== FIN LISTING =============================== */
