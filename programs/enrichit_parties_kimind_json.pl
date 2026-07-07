/* ========================================================================== */
/*                    LIT LES PARTIES KIMIND AU FORMAT JSON                   */
/*                 AJOUTE DES INFORMATIONS AVANT DE LES SAUVEGARDER           */         
/* ========================================================================== */

:- module(
          enrichit_parties_kimind_json, 
          [
            traite_parties/2
          ]
         ).

:- 
   prolog_load_context(file, File),
   file_directory_name(File, Dir),
   use_module(Dir/kimind_json),
   use_module(Dir/partie),
   use_module(Dir/divers).
    
% ----------
traite_parties(Directory, Destination) :-
    fichier:recupere_noms_fichiers(Directory, '.json', Fichiers),
	file_base_name(Directory, Dossier),
	sauve_parties(Fichiers, Directory, Dossier, Destination).
 
% ----------
	% tous les fichiers json du Directory sont traites
sauve_parties([], _Directory, _Dossier, _Destination) :-
	!.

sauve_parties([Fichier|Fichiers], Directory, Dossier, Destination) :-
    sauve_partie(Fichier, Directory, Dossier, Destination),
	sauve_parties(Fichiers, Directory, Dossier, Destination).

% ----------
sauve_partie(Fichier, Directory, Dossier, Destination) :-
    writeln(Fichier),
	kimind_json:charge_partie_json(Directory, Fichier, Partie),
    kimind_json:get_partie(Partie, somme, Somme),
    kimind_json:get_partie(Partie, ordre_couleurs, Ordre_couleurs),
    kimind_json:get_partie(Partie, solution, Solution),
    partie:construit_identifiant_json(Somme, Ordre_couleurs, Solution, Ident),
    Partie1 = Partie.put(ident, Ident),
	directory_file_path(Destination, Dossier, Destination1),
    fichier:cree_dossier(Destination1),
    partie:sauvegarde_partie_json_enrichie(Destination1, Fichier, Partie1).
    
/* =============================== FIN LISTING ============================== */
