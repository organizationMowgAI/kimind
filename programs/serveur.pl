/* ========================================================================== */
/*             ETABLIT UNE CONNEXION BIDIRECTIONNELLE PROLOG-PYTHON           */
/*                       TRAITE LES REQUETES                                  */ 
/* ========================================================================== */

:- module(
          serveur,
          [
			ouvre_connexion/1,
			ferme_connexion/1,
			
			lit_requete/2,
			lit_traite_requetes/1,

			envo_requete/2
		  ]
		 ).

:- 
	use_module(compteur),
	use_module(client_serveur).

% ----------
top(Port) :-
	writeln('debut serveur prolog'),
	ouvrir_connexion(Port),
	lire_traiter_requetes(Port),
	writeln('fin serveur prolog'),
	halt(0).

% ----------
ouvre_connexion(Port) :-
    client_serveur:ouvre_connexion(Port).

% ----------
ferme_connexion(Port) :-
    client_serveur:ferme_connexion(Port).

/* ========================= ENVOIE/ RECEPTION REQUETES ===================== */

% ----------
envoie_requete(Port, Requete) :-
	client_serveur:ecrit(Port, Requete).

% ----------
lit_requete(Port, Requete) :-
	client_serveur:lit(Port, Requete). 

% ----------
lit_traite_requetes(Port) :-
	lit_requete(Port, Requete),
	traite_requete(Port, Requete),	
	nl,
	(
	   requete_fin_connexion(Requete)
		-> true
		;  lire_traiter_requetes(Port)
    ).

% ----------
requete_fin_connexion("fin_connexion").

/* ======================= TRAITEMENT DES REQUETES ========================== */

% ----------
traite_requete(Port, "fin_connexion") :-
	ferme_connexion(Port).
	
traite_requete(_Port, "joue") :-
	!.

traite_requete(Port, "mode_emploi") :-
	client_serveur:ecrit(Port, "mode emploi").

traite_requete(Port, "regle_jeu") :-
	client_serveur:ecrit(Port, "regle du jeu").

traite_requete(Port, "carte_devinee") :-
	client_serveur:lit(Port, Valeur),
	nl,
	writeln('prolog : valeur recue'),
	writeln(Valeur),
	client_serveur:ecrit(Port, "false").

traite_requete(Port, "correct_suit") :-
	client_serveur:lit(Port, Valeur),
	writeln('prolog : valeur recue'),
	writeln(Valeur),
	client_serveur:ecrit(Port, "blue").

traite_requete(Port, "nb_guess_cards") :-
	!,
	writeln('prolog : nb_guess_cards'),
	running_game:nb_cartes(Nb_cartes),
	writeln('prolog : passe nb_guess_cards'),
	writeln(Nb_cartes),
	client_serveur:ecrit(Port, Nb_cartes).

traite_requete(Port, "nb_guess_suits") :-
	!,
	write('traite '),
	writeln('nb_guess_suits'),
	running_game:nb_couleurs(Nb_couleurs),
	writeln('prolog valeur retourne nb_guess_suits:'),
	writeln(Nb_couleurs),
	client_serveur:ecrit(Port, Nb_couleurs).

/* =============================== FIN LISITNG ============================== */ 
