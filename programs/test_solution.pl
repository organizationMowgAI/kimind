/* ========================================================================== */
/*            TESTE LES PREDICATS DE FONCTIONS_ENONCES                        */
/* ========================================================================== */

:- 
   use_module(fonctions_enonce),
   use_module(fonctions_solution),
   use_module(bk_solution),
   use_module(liste),
   use_module(bk_partie).

% ----------
test_partie :-
	Enonce = instance(22,'r<b<g<y'),
	Solution = [c(0, red, 2), c(1, blue, 4), c(2, green, 7), c(3, yellow,9)].
  
% ----------
test_dichotomie :-
	Enonce = instance(22,'r<b<g<y'),
	Solution = [c(0, red, 2), c(1, blue, 4), c(2, green, 7), c(3, yellow,9)],
	fonctions_solution:dichotomic_solution(Enonce, Solution),
	nl,
	write('la solution '),
	writeln(Solution),
	write('de l''enonce '),
	writeln(Enonce),
	writeln('est de nature dichotomique'),
	nl,
    halt(0).

% ----------
test_limite :-
	Enonce = instance(22,'r<b<g<y'),
	Solution = [c(0, red, 2), c(1, blue, 4), c(2, green, 7), c(3, yellow,9)],
	gtrace, 
	fonctions_solution:limits_solution(Enonce, Solution),
	nl,
	write('la solution '),
	writeln(Solution),
	write('de l''enonce '),
	writeln(Enonce),
	writeln('est de nature limite'),
	nl,
    halt(0).




/* ============================== FIN LISTING =============================== */
