#! /usr/bin/env swipl

/* ========================================================================== */
/*                      LE ROBOT JOUE UNE PARTIE KIMIND                       */         
/* ========================================================================== */

:-
    use_module(library(clpfd)),
    use_module(joue_partie),
    use_module(initialisation),
    use_module(construit_contraintes),
    use_module(kimind_json),
	use_module(partie),
    use_module(kimind_prolog),
    use_module(bk),
    use_module(liste),
    use_module(bk_contraintes),
    use_module(fichier).

:- initialization top.

% ----------
top :-

    configure_xpce,
    current_prolog_flag(argv, [Input_file]),

	gtrace,

    kimind_json:charge_partie(Input_file, Partie),
    partie:assert_partie(Partie, game),

    initialise_partie(Partie, Cartes),	 

	gtrace,
	joue_partie:joue_partie_robot(Cartes),

    writeln('fin du programme kimind.pl'),
    halt(0).

% ----------
configure_xpce :-
	assertz(file_search_path(library,pce('prolog/lib'))),
	assertz(file_search_path(pce,swi(xpce))),
	use_module(library(pce)).

% ----------         
initialise_partie(Partie, Cartes) :-
    initialisation:
    initialisation_robot(Partie, _Nb_cartes, Cartes, _Solution, _Somme), 
    joue_partie:prepare_partie(Cartes).

% ----------
domaines([]).

% ----------
contraintes([]).

/* =============================== FIN LISTING ============================== */ 
