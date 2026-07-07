/* ========================================================================== */
/*                            COMPARE LES COULEURS                            */
/* ========================================================================== */

:- module(
          ordre_couleurs, 
          [
                convertit_ordre_couleurs/2,
          		couleur_meme_rang/3,
          		couleur_pas_meme_rang/3,
          		couleur_avant/3,
          		couleur_avant_meme_rang/3,
          		couleur_apres/3,
          		couleur_apres_meme_rang/3
          ]
		 ).
		 
:- use_module(comparaisons).

% --------
    % remplace < par avant, et = par meme_rang
convertit_ordre_couleurs([], []):-
    !.

convertit_ordre_couleurs([E|Ordre], [E1|Ordre1]) :-
    convertit(E, E1),
    convertit_ordre_couleurs(Ordre, Ordre1).

% ----------
convertit(<, avant) :-
    !.

convertit(=, meme_rang) :-
    !.

convertit(Couleur, Couleur).

% ----------
couleur_meme_rang(Couleur, Couleur1, Ordre_couleurs) :-
	(
     	member(meme_rang(Couleur, Couleur1), Ordre_couleurs) ;
	 	member(meme_rang(Couleur1, Couleur), Ordre_couleurs)
 	),   
	!.	
	
couleur_pas_meme_rang(Couleur, Couleur1, Ordre_couleurs) :-
	\+ couleur_meme_rang(Couleur, Couleur1, Ordre_couleurs),
	!.	
	
% ----------
couleur_avant(Couleur, Couleur1, Ordre_couleurs) :-
    member(avant(Couleur, Couleur1), Ordre_couleurs),
	!.	

% ----------
couleur_avant_meme_rang(Couleur, Couleur1, Ordre_couleurs) :-
	(
     	couleur_avant(Couleur, Couleur1, Ordre_couleurs) ;
	 	couleur_meme_rang(Couleur, Couleur1, Ordre_couleurs)
 	),   
	!.	
	
% ----------
couleur_apres(Couleur, Couleur1, Ordre_couleurs) :-
    couleur_avant(Couleur1, Couleur, Ordre_couleurs),
	!.	
	
% ----------
couleur_apres_meme_rang(Couleur, Couleur1, Ordre_couleurs) :-
     	couleur_avant_meme_rang(Couleur1, Couleur, Ordre_couleurs).

/* ============================= FIN LISTING =============================== */
