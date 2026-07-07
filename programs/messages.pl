/* ========================================================================== */
/*                        MESSAGES POUR L'UTILISATEUR                         */
/* ========================================================================== */

:- module(
         messages, 
         [
			message_swi/1,
			message_solution_trouvee/1,
			message_partie_terminee/2,
			message_position/3,
         	message/2,
         	message_joueur/1,
         	message_cartes_jouees/2,
         	message_coup/2,
			message_carte/2,
            message_intervalle/2,
			message_domaine_modifie_min/6,
			message_domaine_modifie_min/6
         ]
		 ).

:-
	use_module(fichier), 
	use_module(affichage_contraintes).

% ---------- 
message_swi(Message) :-
	fichier:set_sortie_swi,
	Message,
	fichier:retour_sortie_precedente.

% ----------
message_solution_trouvee(Solution_trouvee) :-
	nl,
    writeln('solution trouvee : '), 
    writeln(Solution_trouvee).

% ----------
message_partie_terminee(Num_coups, Joueur) :-
    nl,
    writeln('Analyse partie terminee.'),
    message_joueur(Joueur),
    write('a gagne en '),
    write(Num_coups),
    writeln(' coups').

% ----------
messages:message_valeur_jouee(Valeur_jouee, Rep_valeur) :-
    nl, 
    write('Valeur jouee : '),
    writeln(Valeur_jouee),
    write('reponse      : '),
    writeln(Rep_valeur).

% ----------
message_position(Position, Couleur_jouee, Reponse) :-
  	writeln('--------------------------------------------------------------'),
    write('Position = '),
    writeln(Position),
    nl,
    write('Couleur jouee : '),
    writeln(Couleur_jouee),
    write('reponse       : '),
    writeln(Reponse).

% ----------
message_joueur(joueur) :-
    !,
    write('le joueur ').
    
message_joueur(direct) :-
    !,
    write('le joueur ').    
    
message_joueur(robot) :-
    write('le robot ').   

    % ---
message(Message, V) :-
    write(Message),
    write(' : '),
    writeln(V),
    nl.    
	
% ----------
message_cartes_jouees(Coup, Cartes) :-
 	nl,
    writeln('cartes jouees :'),
	nl,
    affiche_coup_contraintes(Coup, Cartes).

% ----------
message_coup(Numero_coup, Nb_cartes_a_deviner) :-
    nl,                
    write('============================== '),
    write('Coup '),
    write(Numero_coup),
    writeln(' =============================='),
    nl,
        
    write('nb cartes a deviner                  : '),
    writeln(Nb_cartes_a_deviner),    
    nl.

% ----------
message_carte(Message, Position) :-
	write(Message),
    write(' '),
    write(Position).

% ----------
message_intervalle(V, V) :-
    !,
	write('la valeur '),
    write(V).

message_intervalle(Vmin, Vmax) :-
	write('une valeur entre '),
    write(Vmin),
    write(' et '),
    write(Vmax).

% ----------
message_domaine_modifie_min(modifie, Module, _Position, _Couleur, 
                            Min, _Min_nouveau) :-
	Module:valeurs(Valeurs),
    Min1 is Min - 1,
    max_member(Min1, Valeurs),
	!.
    
message_domaine_modifie_min(modifie, _Module, Position, Couleur, Min, 
                            Min_nouveau) :-
	!,
    nl,
	write('- la valeur minimale ('),
    write(Min),
    write(') de la carte '),
	write(Couleur),
    write(' a la position '),
    write(Position),
    write(' a ete remplacee par '),
    writeln(Min_nouveau),
    write('  (aucune solution n''a de carte '),
    write(Couleur),
    write(' de valeur minimale inferieure a '),
    write(Min_nouveau),
    writeln(')').

message_domaine_modifie_min(pas_modifie, _Module, _Position, _Couleur, 
                            _Min, _Min_nouveau).

% ----------
message_domaine_modifie_max(modifie, Module, _Position, _Couleur, 
                            Max, _Max_nouveau) :-
	Module:valeurs(Valeurs),
    Max1 is Max + 1,
    min_member(Max1, Valeurs),
	!.

message_domaine_modifie_max(modifie, _Module, Position, Couleur, 
                            Max, Max_nouveau) :-
	!,
    nl,
	write('- la valeur maximale ('),
    write(Max),
    write(') de la carte '),
    write(Couleur),
    write(' a la position '),
    write(Position),
    write(' a ete remplacee par '),
    writeln(Max_nouveau),
    write('  (aucune solution n''a de carte '),
	write(Couleur),
    write(' de valeur maximale superieure a '),
    write(Max_nouveau),
    writeln(')').

message_domaine_modifie_max(pas_modifie, _Module, _Position, _Couleur, 
                            _Max, _Max_nouveau).

/* ================================ FIN LISTING ============================= */
