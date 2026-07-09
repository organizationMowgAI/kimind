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
	use_module(gestion_bk_joueur),
    use_module(benchmark).

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
    struggles_with_higher_numbers(File_path, Higher_numbers_struggle),
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

% ----------
    % Determine si le joueur a plus de mal avec les sommes elevees
struggles_with_higher_numbers(Dossier_parties_joueur, Higher_numbers_struggle) :-
    fichier:recupere_noms_fichiers(Dossier_parties_joueur, '.pl', Noms_fichiers1), %writeln(Noms_fichiers1), nl,
    filtrer_fichiers(Noms_fichiers1, Noms_fichiers), %writeln(Noms_fichiers), nl,
	partie:lit_parties_dir(Noms_fichiers, Dossier_parties_joueur, Parties), %gtrace,
	recup_infos_parties(Parties, Infos_parties), %writeln(Infos_parties), nl, gtrace,
    classer_parties_joueur(Infos_parties, Parties_moins1, Parties_plus1),
    msort(Parties_moins1, Parties_moins),
    msort(Parties_plus1, Parties_plus),
    recup_nb_coups_moyen_par_nb_solutions(Parties_moins, Nb_coups_moyens_moins),
    recup_nb_coups_moyen_par_nb_solutions(Parties_plus, Nb_coups_moyens_plus),
    writeln(Nb_coups_moyens_moins), nl,
    writeln(Nb_coups_moyens_plus), nl.

% ----------
    % Filtre les fichiers pour ne garder que ceux qui commencent par un _
filtrer_fichiers([], []) :-
    !.

filtrer_fichiers([Fichier|Fichiers], [Fichier|Fichiers_filtres]) :-
    commence_par_underscore(Fichier),
    !,
    filtrer_fichiers(Fichiers, Fichiers_filtres).

filtrer_fichiers([_Fichier|Fichiers], Fichiers_filtres) :-
    filtrer_fichiers(Fichiers, Fichiers_filtres).

% ----------
    % Determine si Atom commence par un _
commence_par_underscore(Atom) :-
    atom_chars(Atom, ['_'|_]).

% ----------
    % Recupere les informations souhaitees sur les parties passees en argument
recup_infos_parties([], []) :-
        !.

recup_infos_parties([Partie|Parties], [Infos_Partie|Infos_parties]) :-
    recup_infos_partie(Partie, Infos_Partie),
    recup_infos_parties(Parties, Infos_parties).

recup_infos_partie(Partie, infos_partie(Somme, Nb_solutions, Nb_coups)) :-
    %partie:get_partie_prolog4(num_partie, Partie, Num_partie),
    partie:get_partie_prolog4(somme, Partie, Somme),
    partie:get_partie_prolog4(ordre_couleurs, Partie, Ordre1),
    benchmark:ordre_vers_atom(Ordre1, Ordre),
    fonctions_enonce:nb_solutions_instance(_, instance(Somme, Ordre), Nb_solutions),
    partie:get_partie_prolog4(cartes_jouees, Partie, Coups),
    length(Coups, Nb_coups).

% ----------
    % Classe les parties en deux groupes : ceux dont la somme est inferieure a 22 et
    % ceux dont la somme est superieure a 22
classer_parties_joueur([], [], []) :-
    !.

classer_parties_joueur([infos_partie(Somme, Nb_solutions, Nb_coups)|Infos_parties],
                       [infos_partie(Nb_solutions, Nb_coups)|Parties_moins],
                       Parties_plus) :-
    Somme < 22,
    !,
    classer_parties_joueur(Infos_parties, Parties_moins, Parties_plus).

classer_parties_joueur([infos_partie(Somme, Nb_solutions, Nb_coups)|Infos_parties],
                       Parties_moins,
                       [infos_partie(Nb_solutions, Nb_coups)|Parties_plus]) :-
    Somme > 22,
    !,
    classer_parties_joueur(Infos_parties, Parties_moins, Parties_plus).

classer_parties_joueur([_Infos_partie|Infos_parties],
                       Parties_moins,
                       Parties_plus) :-
    classer_parties_joueur(Infos_parties, Parties_moins, Parties_plus).

% ----------
    % Renvoie le nombre de coups moyen pour chaque nombre de solutions
recup_nb_coups_moyen_par_nb_solutions([], []) :-
    !.

recup_nb_coups_moyen_par_nb_solutions([infos_partie(Nb_solutions, Nb_coups)|Infos_parties],
                                      [|Nb_coups_moyens]) :-

recup_nb_coups_moyen_par_nb_solutions([infos_partie(Nb_solutions, Nb_coups)|Infos_parties],
                                      [|Nb_coups_moyens]) :-
    
    writeln(Parties_moins).


/* ============================ FIN LISTING ================================= */
