#! /usr/bin/env swipl

/* ========================================================================== */
/*       PARCOURT TOUS LES DOSSIERS DU REPERTOIRE DONNE EN ARGUMENT           */
/*    POUR CHAQUE DOSSIER LIT ET ANALLYSE LES PARTIES KIMIND AU FORMAT JSON   */
/*     AJOUTE DES INFORMATIONS ET DES EXPLICATIONS AVANT DE LES SAUVEGARDER   */         
/* ========================================================================== */

:- 
   writeln('ok'),
   prolog_load_context(file, File),
   file_directory_name(File, Dir),
   use_module(Dir/kimind_json), 
   use_module(Dir/partie),
   use_module(Dir/divers),
   use_module(Dir/fichier),
   use_module(Dir/analyse_parties_json_joueur).
   	
% ----------
top(Dossier_origine, Dossier_destination) :-
	writeln('debut du script analyse_parties_jsons_joueurs_dir.pl'),
    configure_xpce,
    fichier:cree_dossier(Dossier_destination),
    fichier:sous_dossiers(Dossier_origine, Dossiers),
	traite_dossiers(Dossiers, Dossier_origine, Dossier_destination),
    writeln('fin du script analyse_parties_json_joueurs_dir.pl'),
    halt(0).

% ----------
configure_xpce :-
	assertz(file_search_path(library,pce('prolog/lib'))),
	assertz(file_search_path(pce,swi(xpce))),
	use_module(library(pce)).

% ----------
	% tous les fichiers json du Directory sont traites
traite_dossiers([], _Origine, _Destination) :-
	!.

traite_dossiers([Dossier|Dossiers], Origine, Destination) :-
	traite_dossier(Dossier, Origine, Destination),
	!,												% retire backtracks inutiles
	traite_dossiers(Dossiers, Origine, Destination).

% ----------
traite_dossier(Dossier, Origine, Destination) :-
    directory_file_path(Origine, Dossier, Dossier1),
    writeln(Dossier),
    writeln(Dossier1),
	analyse_parties_json_joueur:analyse_les_parties(Dossier1, Destination).

/* =============================== FIN LISTING ============================== */
