/* ========================================================================== */
/*         AFFICHE LES CARACTERISTIQUES D'UN ENONCE LU INTERACTIVEMENT        */
/* ========================================================================== */


:- 
	use_module(fichier),
    use_module(bk_partie),
	use_module(partie),
	use_module(liste),
    use_module(fonctions_enonce),
	use_module(gestion_module).


% ----------
top :-
    configure_xpce,
	nl,
	nl,
	writeln('============ Caracteristique d''un enonce Kimind ============'),
	nl,	
	nl,
	gtrace,
	lire_enonce:get_data(Somme, Ordre),
	lire_enonce:get_solution(Solution),
	ecrit_caracteristiques_enonce:
	write_caracteristiques_enonce(Stream, Num_partie, Somme, Ordre, Solution),
	nl,
	nl,
    writeln('fin du programme'),
    halt(0).


% ----------
configure_xpce :-
	assertz(file_search_path(library,pce('prolog/lib'))),
	assertz(file_search_path(pce,swi(xpce))),
	use_module(library(pce)).



/*
 infos_partie(Num_partie, Somme, Ordre, Solution)
 Num_partie = 1
 Somme = 34
 Ordre  = [blue,<,red,<,green,<,yellow]
 Solution =  [c(0, blue, 7), c(1, red, 8), c(2, green, 9), c(3, yellow, 10)]
 */
 
 



 
