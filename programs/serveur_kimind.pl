/* ========================================================================== */
/*                 GERE UN SERVEUR PROLOG POUR UN CLIENT PYTHON               */
/*                 TRAITE LES REQUETES  DEMANDEES PAR PYTHON                  */ 
/*                  (fait office de controleur cote prolog)                   */
/* ========================================================================== */

:- module(
          serveur_kimind,
          [
            active_serveur/2,
			serveur_ouvre_connexion/1,
			serveur_ferme_connexion/1,
			
			serveur_lit_requete/2,
			serveur_lit_traite_requetes/2,

			serveur_envoie_requete/2
		  ]
		 ).

:- 
	use_module(compteur),
	use_module(client_serveur),
    use_module(joue_partie_graphique),
	use_module(kimind_run),
	use_module(bk_contraintes).

% ----------
    % Cartes est obligatoire car elle contient les contraintes
    % qui ne sont pas sauvegardes par assert
active_serveur(Port, Cartes) :-
    serveur_ouvre_connexion(Port),
	serveur_lit_traite_requetes(Port, Cartes).
    
% ----------
serveur_ouvre_connexion(Port) :-
    client_serveur:ouvre_connexion(Port).

% ----------
serveur_ferme_connexion(Port) :-
    client_serveur:ferme_connexion(Port).

/* ========================= ENVOIE/ RECEPTION REQUETES ===================== */

% ----------
serveur_lit_traite_requetes(Port, Cartes) :-
	serveur_lit_requete(Port, Requete),
	traite_requete(Port, Requete, Cartes, Cartes_out),	
	nl,
	(
	   serveur_requete_fin_connexion(Requete)
		-> 	
            writeln('fin des traitements'),
            !
		;
			serveur_lit_traite_requetes(Port, Cartes_out)
    ).

% ----------
serveur_lit_requete(Port, Requete) :-
	client_serveur:lit_fonction(Port, Requete).

% ----------
serveur_envoie_requete(Port, Requete) :-
	client_serveur:ecrit(Port, Requete).

% ----------
serveur_requete_fin_connexion('fin_connexion').

/* ======================= TRAITEMENT DES REQUETES ========================== */

% ----------
traite_requete(Port, joue_coup_robot, Cartes, Cartes_out) :-
	!,
	writeln('prolog : joue_coup_robot'),
    joue_partie_graphique:joue_coup_robot(Cartes, Coup, Cartes_out),
	Coup1 =..[coup|Coup],
	client_serveur:ecrit_json(Port, Coup1).

% ----------
traite_requete(Port, joue_coup_joueur, Cartes, Cartes_out) :-
	!,
	writeln('prolog : joue_coup_joueur'),
    joue_partie_graphique:joue_coup_joueur(Cartes, Coup, Cartes_out),
	Coup1 =..[coup|Coup],
	client_serveur:ecrit_json(Port, Coup1).

% ----------
traite_requete(Port, nombre_solutions, Cartes, Cartes) :-
	!,
	writeln('prolog : nombre de solutions'),
	nb_solutions(Port, Cartes).

% ----------
traite_requete(Port, Requete, Cartes, Cartes) :-
    traite_requete2(Port, Requete).

% ----------
traite_requete2(Port, explique) :-
	!,
	writeln('prolog : explique'),
	running_game:explications(Explications),
	client_serveur:ecrit_avec_fin(Port, Explications).

traite_requete2(Port, carte_devinee(Position)) :-
	!,
	write('prolog : carte devinee en '),
	writeln(Position),
	(
		running_game:carte_devinee(Position) 
		-> 	client_serveur:ecrit(Port, "True")
		;	client_serveur:ecrit(Port, "False")
	).

traite_requete2(Port, ordre_couleurs) :-
	!,
	writeln('prolog : ordre_couleurs'),
	running_game:ordre_couleurs_initial(Ordre_couleurs),
	modif_ordre_couleurs(Ordre_couleurs, Ordre_couleurs1),
	Ordre =..[ordre_couleurs|Ordre_couleurs1],
	client_serveur:ecrit_json(Port, Ordre).

traite_requete2(Port, somme_valeurs) :-
	!,
	writeln('prolog : somme_valeurs'),
	running_game:somme(Somme),
	client_serveur:ecrit(Port, Somme).

traite_requete2(Port, nb_tries) :-
	!,
	writeln('prolog : nb_tries'),
	running_game:nb_tries(Nb_tries),
	client_serveur:ecrit(Port, Nb_tries).

traite_requete2(Port, nb_guess_suits) :-
	!,
	writeln('prolog : nb_guess_suits'),
	running_game:nb_cartes(Nb_couleurs),
	writeln('prolog : passe nb_guess_suits'),
	client_serveur:ecrit(Port, Nb_couleurs).

traite_requete2(Port, regle_jeu) :-
	!,
	writeln('prolog : regle_jeu'),
	client_serveur:ecrit(Port, "regle jeu").

traite_requete2(Port, deduit) :-
	!,
	writeln('prolog : deduit'),
	client_serveur:ecrit(Port, "ai deduit").

traite_requete2(Port, mode_emploi) :-
	!,
	writeln('prolog : mode_emploi'),
	client_serveur:ecrit(Port, "mode emploi").

traite_requete2(Port, nb_guess_cards) :-
	!,
	writeln('prolog : nb_guess_cards'),
	running_game:nb_cartes(Nb_cartes),
	client_serveur:ecrit(Port, Nb_cartes).

traite_requete2(Port, correct_suit(I)) :-
	!,
	writeln('prolog : correct_suit'),
	kimind_run:correct_suit(I, Suit),
	client_serveur:ecrit(Port, Suit).

traite_requete2(Port, correct_value(I)) :-
	!,
	writeln('prolog : correct_value'),
	kimind_run:correct_value(I, Value),
	client_serveur:ecrit(Port, Value).

traite_requete2(Port, fin_connexion) :-
    writeln('prolog : fin_connexion'),
	client_serveur:serveur_ferme_connexion(Port).

/* ================================= DIVERS ================================= */

nb_solutions(Port, Cartes) :-
 	bk_contraintes:
	nombre_solutions(Cartes, Nb_solutions, Nb_solutions_no_position),
	Nombre_solutions =..[nb_solutions, Nb_solutions, Nb_solutions_no_position],
	client_serveur:ecrit_json(Port, Nombre_solutions).

% ----------
modif_ordre_couleurs([], []) :-
	!.

modif_ordre_couleurs([Op|Suite], [Op1|Suite1]) :-
	member(Op, [<, =]),
	!,
	modif(Op, Op1),
	modif_ordre_couleurs(Suite, Suite1).

modif_ordre_couleurs([Couleur|Suite], [Couleur|Suite1]) :-
	modif_ordre_couleurs(Suite, Suite1).

% ----------
modif(<, avant) :-
	!.

modif(=, meme_rang).
	
/* =============================== FIN LISTING ============================== */ 
