/* ========================================================================== */
/*                       COLLECTE DES INFOS D'UN JOUEUR                       */                              
/* ========================================================================== */
/*                                                                            */
/*   Ce fichier permet de collecter les informations d'un joueur pour les     */
/*                 integrer dans sa BK personnelle.                           */
/*                                                                            */
/* ========================================================================== */

:- module(collecte_infos_joueur,
            [
                strategies_joueur/4
            ]
        ).

% Exemples :
% swipl.exe -s collecte_infos_joueurs.pl -g "strategies_joueur('colin', 'J12')" -t halt
% swipl.exe -s collecte_infos_joueurs.pl -g "strategies_joueur('mathilde', 'J7')" -t halt

:-
    use_module(library(readutil)),
    use_module(exploitation_kimind),
	use_module(gestion_bk_joueur).

:- consult(strategies_joueur).

% ----------
	% recupere la strategie de jeu du joueur Nom d'identifier Id_joueur
strategies_joueur(Input_dir, Output_dir, Nom_joueur, Id_joueur) :-
    run_strategies_joueur(Input_dir, Output_dir, Nom_joueur, Id_joueur).

% ---------- 
    % Execute strategies joueur.pl avec les arguments souhaites 
	% et enregistre la sortie dans un fichier texte
run_strategies_joueur(Input_dir, Output_dir, Nom, Id_joueur) :-
	directory_file_path(Input_dir, Nom, File_path),
	get_strategies_joueur(File_path, Synthese),
	recup_pourcentages(Synthese, Strategies),
    exploitation_kimind:recup_infos(Id_joueur, '../stats_kimind', Stats),
	gestion_bk_joueur:cree_bk(Output_dir, Nom, Strategies, 75, Stats).

    % Recupere les pourcentages d'une sortie de fichier de strategies d'un joueur
recup_pourcentages(Synthese, Valeurs) :-
    split_string(Synthese, "\n", "\r", Lignes),
    findall(Nombre,
        (
            member(L, Lignes),
            sub_string(L, _, _, _, "%"),   % contient %
            split_string(L, ":", " ", [_Label, ValStr]),
            split_string(ValStr, " ", " %", [NumStr|_]),
            number_string(Nombre, NumStr)
        ),
        Valeurs).

/* ============================ FIN LISTING ================================= */
