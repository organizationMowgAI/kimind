/* ========================================================================== */
/*                 GERE UN CLIENT PROLOG POUR UN SERVEUR PYTHON               */
/*                   EMET DES REQUETES VERSLE SERVEUR PYTHON                  */ 
/* ========================================================================== */

:- module(
          client_kimind,
          [
            active_client/1,
			client_ouvre_connexion/1,
			client_ferme_connexion/1,
			client_envoie_requete/2
		  ]
		 ).

:- 
	use_module(compteur),
	use_module(client_serveur).

% ----------
active_client(Port) :-
    client_ouvre_connexion(Port).
    
% ----------
client_ouvre_connexion(Port) :-
    client_serveur:ouvre_connexion(Port).

% ----------
client_ferme_connexion(Port) :-
    client_serveur:ferme_connexion(Port).

/* ========================= ENVOIE/ RECEPTION REQUETES ===================== */

% ----------
client_envoie_requete(Port, Requete) :-
	client_serveur:ecrit_json(Port, Requete).

% ----------
client_envoie_requete_reponse(Port, Requete) :-
	client_serveur:ecrit_json(Port, Requete),
    client_lit_message(Port, Reponse),
    traite_reponse(Reponse).

% ----------
client_lit_message(Port, Message) :-
    client_serveur:lit_fonction(Port, Message).

/* =================== TRAITEMENT DES REPONSES DU SERVEUR =================== */

% ----------
traite_reponse(Port, joue) :-
	!,
	writeln('prolog : joue'),
	client_serveur:ecrit(Port, "ai joue").

/* =============================== FIN LISITNG ============================== */ 
