#! /usr/bin/env swipl
  
/* ========================================================================== */
/*                      Robot joue une partie de Kimind                       */
/* ========================================================================== */

:- initialization top.

top :-
    configure_xpce,
    current_prolog_flag(argv, [Input_file, File_swi]),
    initialisation_modules,
    kimind_json:charge_partie(Input_file, Partie),
    kimind_prolog:assert_partie(Partie, game),
    affichage:affiche_probleme(Partie),
    fichier:change_sortie(File_swi),
    affichage:affiche_probleme(Partie),
    fichier:retour_sortie_precedente,
    analyse_partie_robot(Partie, File_swi),
    halt(0).

configure_xpce :-
	assertz(file_search_path(library,pce('prolog/lib'))),
	assertz(file_search_path(pce,swi(xpce))),
	use_module(library(pce)).
    
initialisation_modules :-
    use_module(library(clpfd)),
    use_module(analyse_partie),
    use_module(initialisation),
    use_module(construit_contraintes),
    use_module(kimind_json),
    use_module(kimind_prolog),
    use_module(bk),
    use_module(liste),
    use_module(bk_contraintes),
    use_module(fichier).
          
analyse_partie_robot(Partie, File_swi) :-  
    initialisation:
    initialisation_robot(Partie, Nb_cartes,  Cartes,
                         Solution, _Somme), 

	analyse_partie:analyse_partie(robot,
	                              Nb_cartes, 
	                              Cartes, 
                                  Solution,
                                  File_swi,
                                  []
                                  ).
                        
/* =============================== FIN LISTING ============================== */
