/* ========================================================================== */
/*                  LIT/ECRIT UN FICHIER PROLOG AVEC COMMENTAIRES             */
/* ========================================================================== */

:- module(prolog_file,
          [
			cree/5,
			sauvegarde/2,
			ajoute_information/3,
			retire_information/3,
			remplace_information/4,
			lire/3
          ]
        ).

% ----------
lire(Directory, Joueur, Elements) :-
	open_file(Directory, Joueur, Stream),
	lire_lignes_stream(Stream, Elements),
	close(Stream).

% ----------
open_file(Directory, Joueur, Stream) :-
	atom_concat('bk_joueur_', Joueur, Joueur1),
	atom_concat(Joueur1, '.pl', Joueur2),
	directory_file_path(Directory, Joueur2, Path),
    open(Path, read, Stream).

% ----------
lire_lignes_stream(Stream, Elements) :-
    read_term(Stream, Term, [comments(Comments)]),
    (   
		Term == end_of_file
    		->  Elements = []
    		;   
				Elements = [element(Comments, Term)|Suite],
        		lire_lignes_stream(Stream, Suite)
    ).


% ----------

remplacer_terme([], _, _, []) :-
	!.

remplacer_terme([element(Comments, Term)|Suite], Ancien, Nouveau, 
				[element(Comments, Term2)|Suite2]) :-
    (   
		Term =@= Ancien
    		->  Term2 = Nouveau
    		;   Term2 = Term
    ),
    remplacer_terme(Suite, Ancien, Nouveau, Suite2).

% ----------
ecrire_elements(Fichier, Elements) :-
    open(Fichier, write, S),
    ecrire_elements_stream(S, Elements),
    close(S).

% ----------
ecrire_elements_stream(_, []) :-
	!.

ecrire_elements_stream(S, [element(Comments, Term)|Suite]) :-
    ecrire_commentaires(S, Comments),
    write_term(S, Term, [quoted(true)]),
    write(S, '.'),
    nl(S),
    nl(S),
    ecrire_elements_stream(S, Suite).

% ----------
ecrire_commentaires(_, []) :-
	!.

ecrire_commentaires(S, [_Pos-Comment|Suite]) :-
    format(S, '~s~n', [Comment]),
    ecrire_commentaires(S, Suite).

% ----------
cree( 
            Nom, 
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
				  NbCoupsMoyenJoueur),
            Output_dir
            ) :-

    format(atom(File_name), "~w/bk_joueur_~w.pl", [Output_dir, Nom]),
    (
        exists_file(File_name) 
            -> open(File_name, append, Stream),
                Nouveau = false
            ; open(File_name, write, Stream),
                   Nouveau = true
    ),

    with_output_to(Stream, 
                    ecrit_contenu(Nouveau, Nom, 
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
close(Stream).

% ----------
sauve_string(String) :-
    with_output_to(string(String), ecrit_contenu).

% ----------
    % Genere la BK d'un joueur
ecrit_contenu(Nouveau, Nom, 
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
                  infos(TempsMoyenGlobal, TempsMoyenJoueur, NbCoupsMoyenGlobal, NbCoupsMoyenJoueur)
			  ) :-
    (
        Nouveau == true ->
        format("/* ========================================================================== */~n", []),
        format("/*                              BK_PLAYER ~w                              */~n", [Nom]),
        format( "/* ========================================================================== */~n~n", []),
        %format(":- module(bk_player, []).~n~n", []),
        format("/* ==================== INFORMATION ON THE PLAYER =========================== */~n~n", []),
        format("name(~w).~n~n", [Nom]),
        format("/* =================  CARACTERISTICS OF ~w PLAYING ======================= */~n~n", [Nom])
        ; 
            true
    ),
               
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
        format( "respects_colours_constraint(~w).~n", [Nom])
    ;
        true
    ),
    (Somme_valeurs_respectee > Seuil ->
        format( "respects_sum_constraint(~w).~n", [Nom])
    ;
        true
    ),
    (Strategie_possible > Seuil ->
        format("possible_strategy(~w).~n", [Nom])
    ;
        true
    ),
    (Choix_valeurs_limites > Seuil ->
        format("limit_values_player(~w).~n", [Nom])
    ;
        true
    ),
    (Choix_valeurs_dichotomiques > Seuil ->
        format("dichotomic_player(~w).~n", [Nom])
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

/* ============================= FIN LISTING ================================ */
