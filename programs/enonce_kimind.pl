#! /usr/bin/env -S swipl -q

/* ========================================================================== */
/*                 CALCUL DES SOLUTIONS D'UN ENONCE KIMIND                    */          
/* ========================================================================== */
 
:-
    use_module(library(clpfd)),
    use_module(initialisation),
    use_module(kimind_json),
    use_module(partie),
    use_module(liste),
    use_module(bk_contraintes),
    use_module(fichier),
    use_module(lire_enonce).
	
/* ================================ FONCTIONS =============================== */

% ----------
top :-
    configure_xpce,
	nl,
	nl,
	writeln('============ Calcul des solutions d''un enonce Kimind ============'),
	nl,	
	nl,
	lire_enonce:get_data(Somme, Ordre_couleurs),
	les_solutions(Somme, Ordre_couleurs, Solutions, Solutions_no_place),
	affiche_solutions(Solutions, Solutions_no_place),
	nl,
	nl,
    writeln('fin du programme enonce_kimind.pl'),
    halt(0).

% ----------
les_solutions(Somme, Ordre_couleurs, Solutions, Solutions_no_place) :-
    initialisation:
    initialisation_enonce(Somme, Ordre_couleurs, 
                          [blue, green, yellow, red], [1,2,3,4,5,6,7,8,9,10], 
                          4, Cartes), 
	bk_contraintes:calcule_solutions(Cartes, Solutions),
	bk_contraintes:solutions_sans_positions2(Solutions, Solutions1),
	sort(Solutions1, Solutions_no_place).
	
% ----------
configure_xpce :-
	assertz(file_search_path(library,pce('prolog/lib'))),
	assertz(file_search_path(pce,swi(xpce))),
	use_module(library(pce)).

/* =============================== AFFICHAGE ================================ */

% ----------
affiche_solutions(Solutions, Solutions_no_place) :-
	nl, 
	writeln('solutions avec cartes placees : '),
	liste:display_liste(Solutions),
	nl,
	nl,
	writeln('solutions sans placement : '),
	liste:display_liste(Solutions_no_place).

% ----------
affiche_somme(Somme) :-
	write('somme         : '),
	writeln(Somme).

% ----------
affiche_ordre_couleurs(Ordre_couleurs) :-
	write('ordre couleurs : '),
 	display_elements(Ordre_couleurs).

% ----------
display_elements([]) :-
	!,
	nl.

display_elements([X|L]) :-
	write(X),
	write(' '),
	display_elements(L).

/* =============================== FIN LISTING ============================== */ 
