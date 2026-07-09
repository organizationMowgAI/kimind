/* ========================================================================== */
/*         AFFICHE LES CARACTERISTIQUES D'UN ENONCE LU INTERACTIVEMENT        */
/* ========================================================================== */


:- 
	use_module(fichier),
    use_module(bk_partie),
	use_module(partie),
	use_module(liste),
    use_module(fonctions_enonce),
	use_module(gestion_module),
	use_module(lire_enonce),
	use_module(ecrit_caracteristiques_enonce).


% ----------
top :-
    configure_xpce,
	nl,
	nl,
	writeln('============ Caracteristique d''un enonce Kimind ============'),
	nl,	
	nl,
	lire_enonce:get_enonce(Solution, Somme, Ordre),
	gtrace,
	ecrit_caracteristiques_enonce:
	write_caracteristiques_enonce(user_output, 1, Somme, Ordre, Solution),
	nl,
	nl,
    writeln('fin du programme'),
    halt(0).


% ----------
configure_xpce :-
	assertz(file_search_path(library,pce('prolog/lib'))),
	assertz(file_search_path(pce,swi(xpce))),
	use_module(library(pce)).



 
 
/* =============================== FIN LISTING ============================== */
