/* ========================================================================== */
/*            TESTE LES PREDICATS DE FONCTIONS_ENONCES                        */
/* ========================================================================== */

:- 
   use_module(fonctions_enonce),
   use_module(liste),
   use_module(bk_enonce),
   use_module(difficulty_partition).
  
% ----------
test :-
	Enonce = instance(15,'r=b<g<y'),
	fonctions_enonce:nb_solutions_instance(3, Enonce, Nb_solutions),
	bk_enonces:difficulty_instance(Enonce, 3, Difficulty),
	nl,
	write(Enonce),
	write(' has '),
    write(Nb_solutions),
	writeln(' solution(s)'),
	write('it is '),
    writeln(Difficulty),
    halt.

/* ============================== FIN LISTING =============================== */
