#! /usr/bin/env swipl

/* ========================================================================== */
/*                   ON RECUPERE UNE PARTIE JOUE PAR UNE JOUEUR               */
/*             POUR LA REJOUER ET AJOUTER DES INFORMATIONS AUX TRACES         */      
/* ========================================================================== */

:-
    use_module(library(clpfd)),
    use_module(joue_partie),
    use_module(initialisation),
    use_module(construit_contraintes),
    use_module(kimind_json),
	use_module(partie),
    use_module(kimind_prolog),
    use_module(bk),
    use_module(liste),
    use_module(bk_contraintes),
    use_module(fichier),
	use_module(coup).

:- initialization top.

% ----------
top :-
    configure_xpce,
    current_prolog_flag(argv, [Input_file]),
	ouvrir_fichier_sortie(Input_file, Output_file),
    kimind_json:charge_partie(Input_file, Partie),
    partie:assert_partie(Partie, game),
    initialise_partie(Partie, Cartes, Nb_solutions_initiales,
                      Nb_solutions_initiales_sans_position),	 
	joue_partie:joue_partie_joueur(Cartes, Coups),

	partie:sauvegarde_partie_enrichie,

    writeln('fin du programme kimind.pl'),
    halt(0).

% ----------
configure_xpce :-
	assertz(file_search_path(library,pce('prolog/lib'))),
	assertz(file_search_path(pce,swi(xpce))),
	use_module(library(pce)).

% ----------         
initialise_partie(Partie, Cartes, Nb_solutions, Nb_solutions_sans_position) :-
    initialisation:
    initialisation_robot(Partie, _Nb_cartes, Cartes, _Solution, _Somme), 
	partie:get_partie_prolog(cartes_jouees, Partie, Cartes_jouees),
	coup:cartes_vers_coups(Cartes_jouees, Coups),
    kimind_run: asserta(coups(Coups)),
	gtrace,
    joue_partie:prepare_partie(Cartes, Nb_solutions, Nb_solutions_sans_position).

% ----------
ouvrir_fichier_sortie(Chemin, Output_file) :-
	file_base_name(Chemin, Nom1),
	file_directory_name(Chemin, Dir),
	file_name_extension(Nom, _Ext, Nom1),
	atom_concat(Nom, '_', Nom2),
	atom_concat(Nom2, 'en', Nom3), 
	file_name_extension(Nom3, 'pl', Nom_pl),
	directory_file_path(Dir, Nom_pl, Path),
	open(Path, write, Output_file).

% ----------
domaines([]).

% ----------
contraintes([]).

/* =============================== FIN LISTING ============================== */ 
