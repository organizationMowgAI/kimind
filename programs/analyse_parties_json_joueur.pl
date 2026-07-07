/* ========================================================================== */
/*            LIT LES PARTIES KIMIND D'UN JOUEUR AU FORMAT JSON               */
/*                 AJOUTE DES INFORMATIONS ET EXPLIQUATIONS                   */
/*                          AVANT DE LES SAUVEGARDER                          */         
/* ========================================================================== */

:- module(
          analyse_parties_json_joueur, 
          [
            analyse_les_parties/2
          ]
         ).

:- 
   prolog_load_context(file, File),
   file_directory_name(File, Dir),
   use_module(Dir/kimind_json),
   use_module(Dir/partie),
   use_module(Dir/divers),
   use_module(Dir/analyse_partie_json_joueur),
   use_module(Dir/fichier).
   
% ----------
analyse_les_parties(Directory, Destination) :-
    fichier:recupere_noms_fichiers(Directory, '.json', Fichiers),
	file_base_name(Directory, Joueur),
	directory_file_path(Destination, Joueur, Path_destination),
	fichier:cree_dossier(Path_destination),
	analyse_parties(Fichiers, Directory, Joueur, Path_destination).
 
% ----------
	% tous les fichiers json du Directory sont traites
analyse_parties([], _Directory, _Joueur, _Destination) :-
	!.

analyse_parties([Fichier|Fichiers], Directory, Joueur, Destination) :-
    atom_concat(File_name, '.json', Fichier),
	atom_concat('_partie_', Numero_partie1, File_name),
	atom_number(Numero_partie1, Numero_partie),
	directory_file_path(Destination, File_name, Output_file1),
	atom_concat(Output_file1, '.pl', Output_file),
	directory_file_path(Directory, Fichier, Input_file),
	analyse_partie_json_joueur:
	analyse_partie(Input_file, Output_file, Joueur, Numero_partie),
	analyse_parties(Fichiers, Directory, Joueur, Destination).
    
/* =============================== FIN LISTING ============================== */
