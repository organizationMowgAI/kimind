/* ========================================================================== */
/*                       GERE PARTIE KIMIND (format prolog)                   */
/* ========================================================================== */

:- module(
         kimind_prolog, 
         [
            get_domaine/3,
            select_domaine/4,
            
            get_couleur_carte/2,
            get_valeur_carte/2,
            get_position_carte/2,
            get_temps_carte/2,
            get_couleur_devinee_carte/2,
            get_valeur_devinee_carte/2
         ]
		 ).

:- use_module(divers),
   use_module(liste),
   use_module(fichier).	 

% ----------
separe_coups([], []) :-
	!.

separe_coups(Cartes, Coups) :-
	separe_coups2(Cartes, [], 1, [], Coups1),
    inverse_cartes(Coups1, Coups).

% ----------
	% separe les cartes jouees en coups 
separe_coups2([], _Positions_jouees, Num_coup, Coup, [coup(Num_coup, Coup)]) :-
	!.
			  
	% passe au coup suivant		  
separe_coups2([Carte|Cartes], Positions_jouees, Num_coup, Coup, 
			  [coup(Num_coup, Coup)|Coups]) :-
	get_position_carte(Carte, Pos),
	member(Pos, Positions_jouees),
	!,
	Num_coup1 is Num_coup + 1,
	separe_coups2(Cartes, [Pos], Num_coup1, [Carte], Coups).
	
	% ajoute la carte au coup
separe_coups2([Carte|Cartes], Positions_jouees, Num_coup, Coup, Coups) :-
	get_position_carte(Carte, Pos),
	separe_coups2(Cartes, [Pos|Positions_jouees], Num_coup, [Carte|Coup], Coups).

% ----------
inverse_cartes([], []) :-
    !.

inverse_cartes([coup(N, Cartes)|Coups], [coup(N, Cartes1)|Coups1]) :-
    reverse(Cartes, Cartes1),
    inverse_cartes(Coups, Coups1).

/* ========================== RECUPERATION DONNEES ========================== */   
    
get_domaine([], _Position, pas_trouve) :-
    !,
    fail.

get_domaine([(Position, Couleurs, Valeurs)|_Domaines], Position,
                d(Position, Couleurs, Valeurs)) :-
    !.
    
get_domaine([_Domaine|Domaines], Position, Domaine) :-
     get_domaine(Domaines, Position, Domaine).

select_domaine([], _Position, pas_trouve, []) :-
    !,
    fail.

select_domaine([d(Position, Couleurs, Valeurs)|Domaines], Position,
                d(Position, Couleurs, Valeurs), Domaines) :-
    !.
    
select_domaine([Domaine|Domaines], Position, Domaine_out, 
               [Domaine|Domaines_out]) :-
     select_domaine(Domaines, Position, Domaine_out, Domaines_out).


get_couleur_carte(c(Couleur, _Valeur, _Position, _Temps, 
                    _Couleur_devinee, _Valeur_devinee), Couleur).

                    
get_valeur_carte(c(_Couleur, Valeur, _Position, _Temps, 
                    _Couleur_devinee, _Valeur_devinee), Valeur).
         
                       
get_position_carte(c(_Couleur, _Valeur, Position, _Temps, 
                    _Couleur_devinee, _Valeur_devinee), Position).
         
                    
get_temps_carte(c(_Couleur, _Valeur, _Position, Temps, 
                    _Couleur_devinee, _Valeur_devinee), Temps). 
         
                    
get_couleur_devinee_carte(c(_Couleur, _Valeur, _Position, _Temps, 
                          Couleur_devinee, _Valeur_devinee), Couleur_devinee).
      
                          
get_valeur_devinee_carte(c(_Couleur, _Valeur, _Position, _Temps, 
                         _Couleur_devinee, Valeur_devinee), Valeur_devinee).                                           
                         
% ----------
remplace_cartes_jouees(partie(Nom, Type_jeu, Nb_cartes, Couleurs, Valeurs,
                              Somme, Ordre_couleurs, Solution, 
                              _Cartes_jouees, Resultat),
                         Cartes, 
                         partie(Nom, Type_jeu, Nb_cartes, Couleurs, Valeurs,
                                Somme, Ordre_couleurs, Solution, 
                                Cartes, Resultat)
                        ).
    
/* ============================ FIN LISTING ================================= */
