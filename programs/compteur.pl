/* =========================================================================== */
/*                         GESTION DE COMPTEURS D'ENTIERS                      */
/* =========================================================================== */

:- module(
			compteur,
			[
				cree_compteur/1,
				cree_compteur/2,

				supprime_tous_compteurs/0,

				supprime_compteur/1,
				reset_compteur/1,

				valeur_compteur/2,
				lit_compteur/2,

				incremente_compteur/1,
				decremente_compteur/1
			]
		 ).

% ----------
cree_compteur(Nom) :-
	compteurs:asserta(compteur(Nom, 0)),
	compteurs:asserta(valeur_initiale(Nom, 0)).

% ----------
cree_compteur(Nom, Valeur_initiale) :-
	compteurs:asserta(compteur(Nom, Valeur_initiale)),
	compteurs:asserta(valeur_initiale(Nom, Valeur_initiale)).

% ----------
supprime_compteur(Nom) :-
	compteurs:retract(compteur(Nom, _Valeur)),
	compteurs:retract(valeur_initiale(Nom, _Valeur_initiale)).

% ----------
supprime_tous_compteurs :-
	compteurs:retractall(compteur(_Nom, _Valeur)),
	compteurs:retractall(valeur_initiale(_Nom1, _Valeur_initiale1)).

% ---------
reset_compteur(Nom) :-
	compteurs:retract(compteur(Nom, _Valeur)),
	compteurs:valeur_initiale(Nom, Valeur_initiale),
	compteurs:asserta(compteur(Nom, Valeur_initiale)).

% ----------
incremente_compteur(Nom) :-
	compteurs:retract(compteur(Nom, Valeur)),
	Valeur1 is Valeur+1,
	compteurs:asserta(compteur(Nom, Valeur1)).

% ----------
decremente_compteur(Nom) :-
	compteurs:retract(compteur(Nom, Valeur)),
	Valeur1 is Valeur-1,
	compteurs:asserta(compteur(Nom, Valeur1)).

% ----------
valeur_compteur(Nom, Valeur) :-
	compteurs:compteur(Nom, Valeur).

% ----------
lit_compteur(Nom, Valeur) :-
	valeur_compteur(Nom, Valeur),
	incremente_compteur(Nom).

/* ================================ FIN LISTING ============================= */

