#! /usr/bin/env swipl

/* ========================================================================== */
/*                    CONVERTIT DES PARTIES KIMIND JSON EN PROLOG             */         
/* ========================================================================== */

:- 
   prolog_load_context(file, File),
   file_directory_name(File, Dir),
   use_module(Dir/kimind_json),
   use_module(Dir/kimind_prolog), 
   use_module(Dir/partie),
   use_module(Dir/divers).
   
:- initialization top.
	
% ----------
top :-
	writeln('debut du programme json_to_prolog.pl'),
    configure_xpce,
    fichier:liste_dossiers(Dirs),
	traite_dossiers(Dirs),
    writeln('fin du programme json_to_prolog.pl'),
    halt(0).

% ----------
configure_xpce :-
	assertz(file_search_path(library,pce('prolog/lib'))),
	assertz(file_search_path(pce,swi(xpce))),
	use_module(library(pce)).

% ----------
traite_dossiers([]) :-
	!.

traite_dossiers([Dir|Dirs]) :-
	traite_dossier(Dir),
	traite_dossiers(Dirs).

% ----------
traite_dossier(Dossier) :-
	file_base_name(Dossier, Nom_joueur),
	writeln(Nom_joueur),
	fichier:recupere_noms_fichiers_json(Dossier, Fichiers),
    convertit_parties(Fichiers, Nom_joueur, 1).

% ----------
	% tous les fichiers json du Directory sont traites
convertit_parties([], _Nom_joueur, _N) :-
	!.

convertit_parties([Fichier|Fichiers], Nom_joueur, N) :-
	convertit_partie(Fichier, Nom_joueur, N),
	N1 is N+1,
	convertit_parties(Fichiers, Nom_joueur, N1).

% ----------
convertit_partie(Fichier, Nom_joueur, N) :-
    writeln(Fichier),
	kimind_json:charge_partie(Fichier, Partie),
	partie:get_partie_prolog(cartes_jouees, Partie, Cartes),
	kimind_prolog:separe_coups(Cartes, Cartes1),
    kimind_prolog:remplace_cartes_jouees(Partie, Cartes1, Partie1),
	divers:remove_suffix(Fichier, Nom_fichier),
	partie:sauvegarde_partie(Nom_fichier, Nom_joueur, Partie1, N).

/* =============================== FIN LISTING ============================== */
