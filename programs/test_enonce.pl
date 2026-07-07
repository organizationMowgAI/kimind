/* ========================================================================== */
/*                TESTE LES PREDICATS DE FONCTIONS_ENONCES                    */
/* ========================================================================== */

:- 
   use_module(fonctions_enonce),
   use_module(liste),
   use_module(bk_enonce),
   use_module(difficulty_partition).
  
% ----------
test :-
	Enonce = instance(15,'r=b<g<y'),
	gtrace,
	fonctions_enonce:solutions_instance(Enonce, Solutions),
	fonctions_enonce:solutions_instance_positions(Enonce, Solutions_positions),
	bk_enonces:difficulty_instance(Enonce, 3, Difficulty),
	nl,
	writeln(Enonce),
	nl,
	writeln(Difficulty),
	nl,
	writeln(Enonce),
    liste:affiche_liste(Solutions),
	nl,
	nl,
	liste:affiche_liste(Solutions_positions),
	nl,
    halt.

test2 :-
	gtrace,
	bk_enonce:difficulty_instance(instance(15,'r=b=g=y'), 3, Difficulty),
	nl,
	writeln(Difficulty),
	nl,
	halt.

/* ============================== FIN LISTING =============================== */
