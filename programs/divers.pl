#!/usr/bin/env swipl

/* ========================================================================== */
/*                                                                            */
/*                          Predicats divers                                  */
/*                                                                            */
/* ========================================================================== */

:- module(
         divers, 
         [
            chemin_fichier/3,
		    fac/2,
		    somme_entiers/2,
		    liste_entiers/3,
		    affiche_intervalle/2,
		    arrondit_float/3,
			remove_suffix/2
         ]
		 ).
	
/* ============================ GESTION CHEMINS ============================= */
 
remove_suffix(File, Base) :-
    file_name_extension(Base, _Ext, File).

chemin_fichier(Chemin_fichier, Chemin, Fichier) :-
    file_directory_name(Chemin_fichier, Chemin),
    file_base_name(Chemin_fichier, Fichier).

/* ========================================================================== */

    % retourne N!
fac(0, 1) :-
    !.
    
fac(N, F) :-
    N1 is N-1,
    fac(N1, F1),
    F is N*F1.
    

	% retourne la somme des N premiers nombres entiers
somme_entiers(0, 0) :-
	!.

somme_entiers(N, K) :-
	N1 is N-1,
	somme_entiers(N1, K1),
	K is N + K1.
	
	
	% retourne la liste [Min, Min+1,...,Max]
liste_entiers(Max, Max, [Max]) :-
    !.	
	
liste_entiers(Min, Max, [Min|L]) :-
    Min1 is Min + 1,
    liste_entiers(Min1, Max, L). 
 
affiche_intervalle(V, V) :-
	!,
	write('['),
	write(V),
	write(']').
	
affiche_intervalle(Min, Max) :-
	write('['),
 	write(Min),
 	write(' ; '),
 	write(Max),
 	write(']').
 	
arrondit_float(V, Puissance_10, V1) :-	
    V1 is round(V*Puissance_10)/Puissance_10.

/* ============================= FIN LISTING ================================ */
