/* ========================================================================== */
/*                    LIT LES PARTIES KIMIND AU FORMAT PROLOG                 */
/*                           DU DOSSIER DIRECTORY                             */
/*                 AJOUTE DES INFORMATIONS AVANT DE LES SAUVEGARDER           */  
/*                          DANS LE DOSSIER DESTINATION                       */
/*                  DANS UN FORMAT PROLOG TENANT COMPTES DES AJOUTS           */        
/* ========================================================================== */

:- module(
          enrichit_parties_kimind, 
          [
            traite_parties/2
          ]
         ).

:- 
	use_module(fichier),
	use_module(partie).

% ----------
traite_parties(
				Directory,		% dossier ou se trouve les fichiers a traiter 
				Destination		% dossier ou placer les fichiers traites
			   ) :-
    fichier:recupere_noms_fichiers(Directory, '.pl', Fichiers),
	lit_parties(Fichiers, Directory),
    file_base_name(Directory, Dossier),
	sauve_parties(Fichiers, Dossier, Destination).

% ----------
	% tous les fichiers de Directory sont traites
lit_parties([], _Directory) :-
	!.

lit_parties([Fichier|Fichiers], Directory) :-
	lit_une_partie(Fichier, Directory),
	lit_parties(Fichiers, Directory).

% ----------
lit_une_partie(Fichier, Directory) :-
    writeln(Fichier),
	partie:lit_partie(Directory, Fichier, Partie),
	partie:assert_partie2(Fichier, Partie, parties).

% ----------
	% sauve les parties avec les nouvelles informations dans des fichiers
sauve_parties([],  _Dossier, _Destination) :-
	!.

sauve_parties([Fichier|Fichiers], Dossier, Destination) :-
	partie:recupere_partie(Fichier, parties, Partie),
    directory_file_path(Destination, Dossier, Destination1),
    fichier:cree_dossier(Destination1),
	partie:sauvegarde_partie_enrichie(Destination1, Fichier, Partie),
	sauve_parties(Fichiers, Dossier, Destination).

/* =============================== FIN LISTING ============================== */
