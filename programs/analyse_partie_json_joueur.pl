/* ========================================================================== */
/*                     RECUPERE ET ANALYSE UNE PARTIE JOUEE                   */
/*                               AU FORMAT JSON                               */
/*                      AJOUTE UN IDENTIFIANT A LA PARTIE,                    */
/*             	LE NOMBRE DE SOLUTIONS AVANT ET APRES LES COUPS ET            */
/*                  LES EXPLICATIONS DES REDUCTIONS DES VARIABLES             */
/*                          LE TOUT AU FORMAT PROLOG                          */
/* ========================================================================== */

:- module(analyse_partie_json_joueur,
          [ 
			analyse_partie/4
		  ]
         ).

:-
    use_module(library(clpfd)),
    use_module(initialisation),
    use_module(construit_contraintes),
    use_module(kimind_json),
    use_module(kimind_prolog),
    use_module(bk),
    use_module(affichage),
    use_module(liste),
    use_module(bk_contraintes),
	use_module(coup),
	use_module(rejoue_partie),
	use_module(gestion_module).

% ----------
analyse_partie(Input_file_json, Output_file, Joueur, Numero_partie) :-
    configure_xpce,
    kimind_json:charge_partie(Input_file_json, Partie),
    partie:assert_partie(Partie, running_game),
    affichage:affiche_probleme_ident(Partie),
	initialise_partie(Partie, Cartes, Nb_solutions, Explications_initiales),
	gtrace,
	rejoue_partie:joue_partie_joueur(Cartes, Nb_solutions, Coups, Explications),
	formate_explications([Explications_initiales|Explications], Explications1),
	sauve_partie(Partie, Coups, Output_file, Joueur, Nb_solutions, 
                 Numero_partie, Explications1),
	gestion_module:reset_module(running_game).

% ----------         
initialise_partie(Partie, Cartes, Nb_solutions, Explications_initiales) :-
    initialisation:
    initialisation_robot(Partie, _Nb_cartes, Cartes, _Solution, _Somme), 
    partie:get_partie_prolog(cartes_jouees, Partie, Cartes_jouees),
	coup:cartes_vers_coups_joues(Cartes_jouees, Coups),
    running_game: asserta(coups(Coups)),
    rejoue_partie:prepare_partie(Cartes, Nb_solutions, 
							     _Nb_solutions_sans_positions,
                                 Explications_initiales).

/* ============================ SAUVEGARDE PARTIE =========================== */

% ----------
sauve_partie(Partie, Coups, Output_file, Joueur, Nb_solutions, Numero_partie,
             Explications) :-
	partie:get_partie_prolog(somme, Partie, Somme),
	partie:get_partie_prolog(nom, Partie, Nom_partie),
	partie:get_partie_prolog(ordre_couleurs, Partie, Ordre),
	partie:get_partie_prolog(solution, Partie, Solution),
	partie:get_partie_prolog(resultat, Partie, Resultat),
	partie:construit_identifiant_prolog(Somme, Ordre, Solution, Ident),
	open(Output_file, write, Stream),
	with_output_to(Stream, 
				   ecrit_contenu(Numero_partie, Ident, Joueur, Nom_partie, 
                                 Somme, Ordre, Solution, Nb_solutions, 
                                 Coups, Resultat)
                   ), 
	with_output_to(Stream, ecrit_explications(Explications)),
    close(Stream).

% ----------
ecrit_contenu(N, Ident, Joueur, Nom_partie, Somme, Ordre, Solution, 
              Nb_solutions, Coups, Resultat) :-
	Ident_a =..[ident, N, Ident],
	writeln_point(Ident_a),
	Joueur_a =..[joueur, N, Joueur],
	writeln_point(Joueur_a),
	Partie_a =..[partie, N, Nom_partie],
	writeln_point(Partie_a),
	Somme_a =..[somme, N, Somme],
	writeln_point(Somme_a),
	Ordre_a =..[ordre_couleurs, N, Ordre],
	writeln_point(Ordre_a),
	Solution_a =..[solution, N, Solution],
	writeln_point(Solution_a),
	Nb_solutions_a =..[nb_solutions, N, Nb_solutions],
	writeln_point(Nb_solutions_a),
	ecrire_coups(N, Coups),
	Resultat_a =..[resultat, N, Resultat],
	writeln_point(Resultat_a).
	
% ----------
ecrire_coups(N, Coups) :-
	write('cartes_jouees('),
	write(N),
	writeln(','),
	writeln('   ['),
	ecrire_coups_joues(Coups),
	writeln('   ]'),
	writeln('            ).').

% ----------
ecrire_coups_joues([]) :-
	!.

	% pour eviter virgule en trop
ecrire_coups_joues([Coup]) :-
	!,
	tab(5),
	writeln(Coup).

ecrire_coups_joues([Coup|Coups]) :-
	tab(5),
	write(Coup),
	writeln(','),
	ecrire_coups_joues(Coups).

% ----------
ecrit_explications([]) :-
	!,
	nl.

ecrit_explications([expli(0, "")|Explications]) :-
	!,
	nl,
	writeln('********** no reduction considering the initial constraints *************'),
	ecrit_explications(Explications).

ecrit_explications([expli(N, "")|Explications]) :-
	!,
	nl,
	write('********** no reduction after move '),
	write(N),
	writeln(' **********'), 
	ecrit_explications(Explications).

ecrit_explications([expli(N, Explication)|Explications]) :-
	nl,
	write('************* explanations of the reductions after move '),
	write(N),
	writeln(' *************'), 
	writeln(Explication),
	ecrit_explications(Explications).

/* ================================ DIVERS ================================== */

% ----------
formate_explications(Explications, Explications_out) :-
	formate_explications2(Explications, 0, Explications_out).

% ----------
formate_explications2([], _N, []) :-
	!.

formate_explications2([Explication|Explications], N,
                      [expli(N, Explication)|Explications1]) :-
	N1 is N+1,
	formate_explications2(Explications, N1, Explications1).

% ----------
configure_xpce :-
	assertz(file_search_path(library,pce('prolog/lib'))),
	assertz(file_search_path(pce,swi(xpce))),
	use_module(library(pce)).
    
% ----------
writeln_point(Atom) :-
	writeq(Atom),
	writeln(.).
	
/* ============================== FIN LISTING =============================== */
