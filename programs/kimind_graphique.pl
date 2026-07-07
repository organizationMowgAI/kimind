#! /usr/bin/env swipl

/* ========================================================================== */
/*                      LE ROBOT JOUE UNE PARTIE KIMIND                       */
/*                        AVEC VUE GRAPHIQUE (PYTHON)                         */           
/* ========================================================================== */

:-
    use_module(library(clpfd)),
    use_module(joue_partie_graphique),
    use_module(initialisation),
    use_module(construit_contraintes),
    use_module(kimind_json),
	use_module(partie),
    use_module(kimind_prolog),
    use_module(bk),
    use_module(liste),
    use_module(bk_contraintes),
    use_module(fichier),
    use_module(serveur_kimind).

:- initialization top(5000, 6000).

% ----------
top(Port_serveur, Port_client) :-
    writeln('debut top'),
    configure_xpce,
    current_prolog_flag(argv, [Input_file]),

    kimind_json:charge_partie(Input_file, Partie),
    partie:assert_partie(Partie, running_game),

    initialise_partie(Partie, Cartes),	
    active_client_serveur(Port_serveur, Port_client, Cartes, Thread_serveur),    
    thread_join(Thread_serveur, _),

    writeln('fin du programme kiming_graphique.pl'),
    halt(0).

% ----------
configure_xpce :-
	assertz(file_search_path(library,pce('prolog/lib'))),
	assertz(file_search_path(pce,swi(xpce))),
	use_module(library(pce)).

% ----------
active_client_serveur(Port_serveur, _Port_client, Cartes, Thread_serveur) :-
    thread_create(
                  serveur_kimind:active_serveur(Port_serveur, Cartes), 
                  Thread_serveur, []).  
     
% ----------         
initialise_partie(Partie, Cartes) :-
    initialisation:
    initialisation_robot(Partie, _Nb_cartes, Cartes, _Solution, _Somme), 
    joue_partie_graphique:prepare_partie(Cartes).

% ----------
domaines([]).

% ----------
contraintes([]).

/* =============================== FIN LISTING ============================== */ 
