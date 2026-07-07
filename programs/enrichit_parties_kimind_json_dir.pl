#! /usr/bin/env swipl

/* ========================================================================== */
/*                PARCOURT TOUS LES DOSSIERS DU REPERTOIRE ARGUMENT           */
/*             POUR CHAQUE DOSSIER LIT LES PARTIES KIMIND AU FORMAT JSON      */
/*                 AJOUTE DES INFORMATIONS AVANT DE LES SAUVEGARDER           */         
/* ========================================================================== */

:- 
   prolog_load_context(file, File),
   file_directory_name(File, Dir),
   use_module(Dir/kimind_json), 
   use_module(Dir/partie),
   use_module(Dir/divers),
   use_module(Dir/fichier),
   use_module(Dir/enrichit_parties_kimind_json).
   
:- initialization top.
	
% ----------
top :-
	writeln('debut du script enrichit_parties_kimind_json_dir.pl'),
	current_prolog_flag(argv, [Origine, Destination]),
    writeln(Origine),
    writeln(Destination),
    configure_xpce,
    fichier:cree_dossier(Destination),
    fichier:sous_dossiers(Origine, Dossiers),
	traite_dossiers(Dossiers, Origine, Destination),
    writeln('fin du script enrichit_parties_kimind_json_dir.pl'),
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
	traite_dossiers(Dossiers, Origine, Destination).

% ----------
traite_dossier(Dossier, Origine, Destination) :-
    directory_file_path(Origine, Dossier, Dossier1),
    writeln(Dossier),
    writeln(Dossier1),
	enrichit_parties_kimind_json:traite_parties(Dossier1, Destination).

/* =============================== FIN LISTING ============================== */
