/* ========================================================================== */
/*                   CREATION/MODIFICATION DE LA BK D'UN JOUEUR               */
/* ========================================================================== */

:- module(gestion_bk_joueur,
          [
			cree_bk/5,
			lit_bk/6,
			ecrit_bk/6,
			display_bk/2,

			modifie_bk/5,
			modify_bk_characteristics/3,
			modify_bk_strategies/3,
			modify_bk_difficulties/3
          ]
        ).

:- 
	use_module(prolog_file),
	use_module(string).

/* ======================== LECTURE DE LA BK ================================ */

% ----------
	% si la BK n'existe pas on la cree avec un en tete
lit_bk(Dossier, Joueur, En_tete, Caracteristiques, Strategies, Difficulties) :-
	complete_nom_joueur(Dossier, Joueur, Path),
	\+ exists_file(Path),
	!,
	cree_en_tete_bk2(Path, Joueur),
	ecrit_difficulties(Path),
	lit_bk(Dossier, Joueur, En_tete, Caracteristiques, Strategies, Difficulties).
	
	% recupere toute la BK dans Elements 
lit_bk(Dossier, Joueur, En_tete, Caracteristiques, Strategies, Difficulties) :-
	complete_nom_joueur(Dossier, Joueur, Path),
	prolog_file:read_lines(Path, Lines),
	enleve_points_finaux(Lines, Lines1),
	separe_elements(Lines1, En_tete, Caracteristiques, Strategies, Difficulties).

/* ============================= ECRITURE DE LA BK ========================== */

% ----------
	% ecrit tous les elements de Elements dans le fichier de la
ecrit_bk(Dossier, Joueur, En_tete, Caracteristiques, Strategies, 
		 Difficulties) :-
	complete_nom_joueur(Dossier, Joueur, Path),
	append([En_tete, Caracteristiques, Strategies, Difficulties], Lines),
	prolog_file:write_lines(Path, Lines).

% ----------
	% recupere toute la BK dans Elements 
display_bk(Dossier, Joueur) :-
	complete_nom_joueur(Dossier, Joueur, Path),
	prolog_file:read_lines(Path, Lines),
	enleve_points_finaux(Lines, Lines1),
	prolog_file:write_lines_stream(current_output, Lines1).

/* ========================== MODIFICATION DE LA BK ========================= */

% ----------
	% les modification sont du type 
	% [
	%  s(fast_player(toto), fast_play(titi)),				% modifie 
	%  a(strong_player(jean)),								% ajoute		
	%  r(dichotomic_play(jean)								% retire
    % ]
modifie_bk(Dossier, Joueur, Modifs_caracteristiques, Modifs_strategies,
		   Modifs_difficulties) :-
	lit_bk(Dossier, Joueur, En_tete, Caracteristiques, Strategies,
		   Difficulties),
	modifie(Caracteristiques, Modifs_caracteristiques, Caracteristiques1),
	modifie(Strategies, Modifs_strategies, Strategies1),
	modifie(Difficulties, Modifs_difficulties, Difficulties1),
	ecrit_bk(Dossier, Joueur, En_tete, Caracteristiques1, 
			 Strategies1, Difficulties1).

% ----------
modify_bk_characteristics(Dossier, Joueur, Modifs_caracteristiques) :-
	lit_bk(Dossier, Joueur, En_tete, Caracteristiques, Strategies),
	modifie(Caracteristiques, Modifs_caracteristiques, Caracteristiques1),
	ecrit_bk(Dossier, Joueur, En_tete, Caracteristiques1, Strategies).

% ----------
modify_bk_strategies(Dossier, Joueur, Modifs_strategies) :-
	lit_bk(Dossier, Joueur, En_tete, Caracteristiques, Strategies),
	modifie(Strategies, Modifs_strategies, Strategies1),
	ecrit_bk(Dossier, Joueur, En_tete, Caracteristiques, Strategies1).

% ----------
modify_bk_difficulties(Dossier, Joueur, Modifs_difficulties) :-
	lit_bk(Dossier, Joueur, En_tete, Caracteristiques, 
		   Strategies, Difficulties),
	modifie(Difficulties, Modifs_difficulties, Difficulties1),
	ecrit_bk(Dossier, Joueur, En_tete, Caracteristiques, 
			 Strategies, Difficulties1).

% ----------
	% Modifie Data en fonction de Modifs, resultats dans Data_out
modifie(Data, Modifs, Data_out) :-
			% repartit Modifs en ajout, retraits et substitutions
	repartit(Modifs, Ajouts, Retraits, Remplacements),
	subtract(Data, Retraits, Data1),
	append(Data1, Ajouts, Data2),
	remplace(Data2, Remplacements, Data_out).

% ----------
repartit([], [], [], []) :-
	!.

repartit([a(T)|Operations], [S|Ajouts], Retraits, Remplacements) :-
		% transforme le terme prolog T en un String
	string:atom_to_structured_string(T, S),
	!,
	repartit(Operations, Ajouts, Retraits, Remplacements).

repartit([r(T)|Operations], Ajouts, [S|Retraits], Remplacements) :-
	term_string(T, S),
	!,
	repartit(Operations, Ajouts, Retraits, Remplacements).

repartit([s(T1,T2)|Operations], Ajouts, Retraits, [s(T1, T2)|Remplacements]) :-
	repartit(Operations, Ajouts, Retraits, Remplacements).

% ----------
	% modifie les lignes (String) en fonction de Modifs
	% plus de lignes a traiter
remplace([], _Modifs, []) :-
	!.

	% plus de modifications
remplace(Lines, [], Lines) :-
	!.

	% modifie eventuellement la ligne courante
remplace([Line|Lines], Modifs, [Line1|Lines1]) :-
	term_string(Term, Line),
	Term \== end_of_file,
	select(s(Term, Term1), Modifs,Modifs1),
	!,
	term_string(Term1, Line1),
	remplace(Lines, Modifs1, Lines1).

	% aucune modification de la ligne courante
remplace([Line|Lines], Modifs, [Line|Lines1]) :-
	remplace(Lines, Modifs, Lines1).	
	
/* =========================== CREATION DE LA BK ============================ */

% ----------
	% cree le fichier contenant la bK et ecrit l'en tete
cree_en_tete_bk(Dossier, Joueur) :-
	complete_nom_joueur(Dossier, Joueur, File_path),
	cree_en_tete_bk2(File_path, Joueur).

% ----------
cree_en_tete_bk2(File_path, Joueur) :-
	prolog_file:open(File_path, write, Stream),
	with_output_to(Stream, ecrit_en_tete(Joueur)),
	close(Stream).
	
% ----------
ecrit_en_tete(Joueur) :-
    format("/* ========================================================================== */~n", []),
    format("/*                              BK_PLAYER ~w                               */~n", [Joueur]),
    format( "/* ========================================================================== */~n~n", []),
	nl,
    format("/* ==================== INFORMATION ON THE PLAYER =========================== */~n~n", []),
    format("name(~w).~n~n", [Joueur]),
    format("/* ===================  CHARACTERISTICS OF ~w's PLAYING ================== */~n", [Joueur]),
	nl.

% ----------
ecrit_difficulties :-
	nl,
	format("/* ============  PERSONAL SKILLS WITH RESPECT TO GAMES DIFFICULTIES ========= */", []),
	nl,
	nl.

% ----------
ecrit_difficulties(File_path) :-
	open(File_path, append, Stream),
	nl(Stream),
	format(Stream, "/* ============  PERSONAL SKILLS WITH RESPECT TO GAMES DIFFICULTIES ========= */", []),
	nl(Stream),
	nl(Stream),
	close(Stream).

% ----------
cree_bk(Dossier, Joueur, 
            [
                Couleurs_croissantes,
                Couleurs_decroissantes,
                Ordre_couleurs_respecte,
                Somme_valeurs_respectee,
                Strategie_possible,
                Choix_valeurs_limites,
                Choix_valeurs_dichotomiques
            ],
            Seuil,
            infos(TempsMoyenGlobal, TempsMoyenJoueur, NbCoupsMoyenGlobal, 
				  NbCoupsMoyenJoueur)
            ) :-

	complete_nom_joueur(Dossier, Joueur, Path),
	cree_en_tete_bk2(Path, Joueur),
	prolog_file:get_stream(Path, append, Stream),

    with_output_to(Stream, 
                    ecrit_contenu(Joueur, 
                                    [
                                        Couleurs_croissantes,
                                        Couleurs_decroissantes,
                                        Ordre_couleurs_respecte,
                                        Somme_valeurs_respectee,
                                        Strategie_possible,
                                        Choix_valeurs_limites,
                                        Choix_valeurs_dichotomiques
                                    ],
                                    Seuil,
                                    infos(TempsMoyenGlobal, 
                                          TempsMoyenJoueur, 
                                          NbCoupsMoyenGlobal, 
                                          NbCoupsMoyenJoueur)
                                  )
                   ),
	 with_output_to(Stream, ecrit_difficulties),
	close(Stream).

% ----------
sauve_string(String) :-
    with_output_to(string(String), ecrit_contenu).

% ----------
    % Genere la BK d'un joueur
ecrit_contenu(Nom, 
                  [
                    Couleurs_croissantes,
                    Couleurs_decroissantes,
                    Ordre_couleurs_respecte,
                    Somme_valeurs_respectee,
                    Strategie_possible,
                    Choix_valeurs_limites,
                    Choix_valeurs_dichotomiques
                  ],
                  Seuil,
                  infos(TempsMoyenGlobal, TempsMoyenJoueur, 
						NbCoupsMoyenGlobal, NbCoupsMoyenJoueur)
			  ) :-
              
    (Couleurs_croissantes > Seuil ->
        format("follows_colours_order(~w).~n", [Nom])
    ;
        true
    ),
    (Couleurs_decroissantes > Seuil ->
        format("follows_reversed_colours_order(~w).~n", [Nom])
    ;
        true
    ),
    (Ordre_couleurs_respecte > Seuil ->
        format( "respects_colours(~w).~n", [Nom])
    ;
        true
    ),
    (Somme_valeurs_respectee > Seuil ->
        format( "respects_sum(~w).~n", [Nom])
    ;
        true
    ),
    (Strategie_possible > Seuil ->
        format("possible_strategy(~w).~n", [Nom])
    ;
        true
    ),
    (Choix_valeurs_limites > Seuil ->
        format("plays_limit_values(~w).~n", [Nom])
    ;
        true
    ),
    (Choix_valeurs_dichotomiques > Seuil ->
        format("plays_dichotomic(~w).~n", [Nom])
    ;
        true
    ),
    (TempsMoyenGlobal > TempsMoyenJoueur ->
        format( "fast_player(~w).~n", [Nom])
    ;
        true
    ),
    (NbCoupsMoyenGlobal > NbCoupsMoyenJoueur ->
        format("strong_player(~w).~n", [Nom])
    ;
        true
    ),
    (TempsMoyenJoueur > TempsMoyenGlobal ->
        format( "slow_player(~w).~n", [Nom])
    ;
        true
    ),
    (NbCoupsMoyenJoueur > NbCoupsMoyenGlobal ->
        format( "weak_player(~w).~n", [Nom])
    ;
        true
    ).

/* ================================= DIVERS ================================= */

% ----------
enleve_points_finaux([], []) :-
	!.

enleve_points_finaux([S|R], [S2|R2]) :-
    enleve_point_final(S, S2),
    enleve_points_finaux(R, R2).

% ----------
enleve_point_final(S, S2) :-
    (   
		sub_string(S, _, 1, 0, ".")
    	->  sub_string(S, 0, _, 1, S2)
    	;   S2 = S
    ).

% ----------
display_bk(Elements) :-
	prolog_file:display_elements(Elements).

% ----------
	% separe elements en 4 categories
separe_elements(Lines, En_tete, Caracteristiques, Strategies, Difficulties) :-
	get_part(Lines, En_tete, "INFORMATION ON THE PLAYER", Suite),
	get_part(Suite, Caracteristiques, "PLAYING", Suite1),
	get_part(Suite1, Strategies, "SKILLS", Difficulties).

% ----------
	% selectionne toutes les lignes qui precedent Key_ligne
get_part([], [], []) :-
	!.

get_part([Line|Lines], [], Key_line, [Line|Lines]) :-
	sub_string(Line, _Before, _Length, _After, Key_line),
	!.

get_part([Line|Lines], [Line|En_tete], Key_line, Lines1) :-
	get_part(Lines, En_tete, Key_line, Lines1).
	
% ----------
complete_nom_joueur(Directory, Joueur, Path) :-
	atom_concat('bk_joueur_', Joueur, Joueur1),
	atom_concat(Joueur1, '.pl', Joueur2),
	directory_file_path(Directory, Joueur2, Path).

/* ============================= FIN LISTING ================================ */
