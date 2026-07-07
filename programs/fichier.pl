/* ========================================================================== */
/*                        GERE LA SORTIE STANDARD ET LES DOSSIERS             */
/* ========================================================================== */

:- module( 
         fichier, 
         [
		   set_sortie_prolog/0,
           set_fichier_prolog/1,
		   get_fichier_prolog/1,
		   
		   set_sortie_swi/0,
		   set_fichier_swi/1, 
		   get_fichier_swi/1,

           change_sortie/1,
           retour_sortie_precedente/0,
		   recupere_noms_fichiers_json/2,
		   recupere_noms_fichiers/3,

		   writeq_nl_point/2,
		   writeq_point/2,

		   liste_dossiers/1,
           sous_dossiers/2,
           cree_dossier/1
         ] 
		 ).

% ----------
cree_dossier(Directory) :- 
  exists_directory(Directory)
   -> true
    ; make_directory_path(Directory).

% ----------
    % retourne tous les dossiers contenus dans Dir
sous_dossiers(Dir, SubDirs) :-
    directory_files(Dir, Files),
    exclude(is_dot_entry, Files, CleanFiles),
    include(is_real_subdir(Dir), CleanFiles, SubDirs).

is_dot_entry('.')  :- true.
is_dot_entry('..') :- true.
is_dot_entry(_)    :- false.

is_real_subdir(Dir, Name) :-
    atomic_list_concat([Dir, '/', Name], Path),
    exists_directory(Path).

% ----------
	% Dirs est la liste des dossier presents dans le dossier courant
liste_dossiers(Dirs) :-
    working_directory(CurDir, CurDir),
    directory_files(CurDir, Files),
    findall(
        Dir,
        (
            member(F, Files),
            \+ member(F, ['.', '..']),  
            directory_file_path(CurDir, F, DirPath),
            exists_directory(DirPath),
            Dir = DirPath
        ),
        Dirs
    ).

% ----------
writeq_point(Stream, Terme) :-
	writeq(Stream, Terme),
	write(Stream, '.').

% ----------
writeq_nl_point(Stream, Terme) :-
	writeq_point(Stream, Terme),
	nl(Stream).

% ----------
	% lister tous les fichiers de Dir
recupere_noms_fichiers(Dir, Extension, Noms_fichiers) :-
    directory_files(Dir, Files),
    files_extension_ok(Files, Extension, Noms_fichiers).
    	% ajouter le chemin complet si nécessaire
    % maplist({Dir}/[F, FullPath]>>atomic_list_concat([Dir, '/', F], FullPath), 
	% Fichiers, Noms_fichiers).

% ----------
	% lister tous les fichiers .json du dossier Dir
recupere_noms_fichiers_json(Dir, Noms_fichiers) :-
    directory_files(Dir, Files),
    include(is_file_json, Files, Fichiers),
    	% ajouter le chemin complet si nécessaire
    maplist({Dir}/[F, FullPath]>>atomic_list_concat([Dir, '/', F], FullPath), 
			Fichiers, Noms_fichiers).

% ----------
	% test si un fichier a l'extension Extension
files_extension_ok([], _Extension, []) :-
	!.

files_extension_ok([File|Files], Extension, [File|Files1]) :-
    file_name_extension(_, Extension, File),
	!,
	files_extension_ok(Files, Extension, Files1).

files_extension_ok([_File|Files], Extension, Files1) :-
	files_extension_ok(Files, Extension, Files1).

% ----------
	% test si un fichier a l'extension json
is_file_json(File) :-
    \+ member(File, ['.', '..']),     % ignorer . et ..
    file_name_extension(_, '.json', File).

% ---------
set_sortie_swi :-
	get_fichier_swi(File_swi),
	change_sortie(File_swi).

% ---------
set_fichier_swi(File_swi) :-
	kimind_run:asserta(fichier_swi(File_swi)).

% ----------
get_fichier_swi(File_swi) :-
	kimind_run:fichier_swi(File_swi).

% ---------
set_sortie_prolog :-
	get_fichier_swi(File_prolog),
	change_sortie(File_prolog).

% ----------
set_fichier_prolog(File_prolog) :-
	kimind_run:asserta(fichier_prolog(File_prolog)).

% ----------
get_fichier_prolog(File_prolog) :-
	kimind_run:fichier_prolog(File_prolog).

% ----------
	% pas de changement 
change_sortie(no) :-
	!,
	current_output(Current_output),
    kimind_run:asserta(sortie_precedente(Current_output)),
    kimind_run:asserta(nouvelle_sortie(Current_output)).
	
change_sortie(Fichier) :-
    current_output(Current_output),
    kimind_run:asserta(sortie_precedente(Current_output)),
    open(Fichier, append, Stream),
    set_output(Stream),
    kimind_run:asserta(nouvelle_sortie(Stream)).

% ---------
retour_sortie_precedente :-
    kimind_run:retract(nouvelle_sortie(Nouvelle_sortie)),
    close(Nouvelle_sortie),
    kimind_run:retract(sortie_precedente(Sortie_precedente)),
    set_output(Sortie_precedente).
    
/* ================================ FIN LISTING ============================= */	 
