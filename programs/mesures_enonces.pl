#!/usr/bin/env swipl

/* ========================================================================== */
/*                      ANALYSE UNE PARTIE JOUEE                              */
/*                              AVEC UN CSP        	                          */
/* ========================================================================== */

:- initialization top.

top :-
    configure_xpce,
    initialisation_modules,
    current_prolog_flag(argv, [Input_file]),
    json:charge_partie(Input_file, Partie),
    prolog:assert_partie(Partie, game),
    affichage:affiche_probleme(Partie),
    nl,
    analyse_partie(Partie),
    halt(0).

    % ---
configure_xpce :-
	assertz(file_search_path(library,pce('prolog/lib'))),
	assertz(file_search_path(pce,swi(xpce))),
	use_module(library(pce)).
    

    % ---
initialisation_modules :-
    use_module(library(clpfd)),
    use_module(initialisation),
    use_module(json),
    use_module(prolog),
    use_module(bk),
    use_module(affichage),
    use_module(liste),
    use_module(analyse_enonce),
    use_module(bk_contraintes).
    

    % ---
analyse_partie(Partie) :-
    initialisation:initialisation_partie(Partie, 
                                                Nb_cartes,
                                                Domaine_couleurs,
                                                Domaine_valeurs,
                                                Ordre_couleurs,
                                                Somme,
                                                _Solution,
                                                Cartes_jouees),                         
    
    set_ids_couleurs(Domaine_couleurs, Ordre_couleurs),                    
    get_ids_des_couleurs(Domaine_couleurs1), 
	
    Nb_cartes1 is Nb_cartes-1, 
    liste:liste_ordre_croissant(0, Nb_cartes1, Positions),

                                                                                                                         
    analyse_enonce:analyse_enonce(Nb_cartes, Domaine_couleurs1, Domaine_valeurs,
                                  Positions, Somme, Cartes_jouees).
                                         
/* ================================== FIN LISTING =========================== */
