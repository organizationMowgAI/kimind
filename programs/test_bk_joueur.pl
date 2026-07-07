/* ========================================================================== */
/*            TESTE LES PREDICATS DE GESTION_BK_JOUEUR.PL	                  */
/* ========================================================================== */

:- 
   use_module(gestion_bk_joueur),
   use_module(liste).

test_display_bk(Directory, Joueur) :-
	gestion_bk_joueur:diplay_bk(Directory, Joueur),
	halt(0).

% ----------
test_modifie_bk(Directory, Joueur) :-
	gtrace,
	gestion_bk_joueur:modifie_bk(
									Directory, Joueur, 
									[s(age(colin, 1), age(colin, 31))],
									[a(p1(colin)), a(p2(colin)), r(strong_player(colin))]
								),
	halt(0).

test_lit_bk(Directory, Joueur) :-
	gestion_bk_joueur:lit_bk(Directory, Joueur, En_tete,
                             Caracteristiques, Strategie),
	writeln(En_tete),
	writeln(Caracteristiques),
	writeln(Strategie),
	halt(0).

test_cree_bk(Directory, Joueur) :-
	gestion_bk_joueur:cree_bk(Directory, Joueur),
	writeln(ok),
	halt(0).
	
/* ============================== FIN LISTING =============================== */
