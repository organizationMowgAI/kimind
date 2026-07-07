/* ============================== AFFICHAGE ================================= */ 

:- module(
         affichage, 
         [
	    	affiche_partie/1,
	    	affiche_probleme/1,
			affiche_probleme_ident/1,
            affiche_carte_jouee/1,
            affiche_carte_jouee_domaine/2,
            affiche_domaines_carte/1,
            affiche_infos/4,
            affiche_coup/2,
            affiche_domaines/1,
            affiche_domaine/1,
            affiche2_domaines/2,
            affiche2_domaine/2
         ]
		 ).
		 
		 
:- use_module(divers),
   use_module(bk).


   % affiche les caractéristiques d'une partie
affiche_probleme_ident(
			partie(
		             id(_Ident),
					 nom(_Nom_partie),
		             jeu(Jeu),
		             nb_cartes(Nb_cartes),
		             couleurs(Couleurs),
		             valeurs(Valeurs),
		             somme(Somme),
		             ordre_couleurs(Ordre_couleurs),
		             solution(Solution),
		             _Cartes_jouees, 
		             _Resultat
                 )
              ) :-
    nl,         
    write('type de jeu            : '),
    writeln(Jeu),
    
    write('nombre de cartes       : '),
    writeln(Nb_cartes),

    write('couleurs des cartes    : '),
    writeln(Couleurs),    
    
    write('valeurs des cartes     : '),
    writeln(Valeurs),
    
    write('somme des cartes       : '),
    writeln(Somme),
    
    write('ordre des couleurs     : '),
    writeln(Ordre_couleurs),
    
    write('solution               : '),
    writeln(Solution).		 

   % affiche les caractéristiques d'une partie
affiche_probleme(partie(jeu(Jeu),
                 nb_cartes(Nb_cartes),
                 couleurs(Couleurs),
                 valeurs(Valeurs),
                 somme(Somme),
                 ordre_couleurs(Ordre_couleurs),
                 solution(Solution),
                 _Cartes_jouees, 
                 _Resultat
                 )
              ) :-
    nl,         
    write('type de jeu            : '),
    writeln(Jeu),
    
    write('nombre de cartes       : '),
    writeln(Nb_cartes),

    write('couleurs des cartes    : '),
    writeln(Couleurs),    
    
    write('valeurs des cartes     : '),
    writeln(Valeurs),
    
    write('somme des cartes       : '),
    writeln(Somme),
    
    write('ordre des couleurs     : '),
    writeln(Ordre_couleurs),
    
    write('solution               : '),
    writeln(Solution).		 
		 
		 
		     
   % affiche les caractéristiques d'une partie
affiche_partie(partie(jeu(Jeu),
                      nb_cartes(Nb_cartes),
                      couleurs(Couleurs),
                      valeurs(Valeurs),
                      somme(Somme),
                      ordre_couleurs(Ordre_couleurs),
                      solution(Solution),
                      cartes_jouees(Cartes_jouees),
                      resultat(Resultat)
                     )
              ) :-
    write('type de jeu            : '),
    writeln(Jeu),
    
    write('nombre de cartes       : '),
    writeln(Nb_cartes),

    write('couleurs des cartes    : '),
    writeln(Couleurs),    
    
    write('valeurs des cartes     : '),
    writeln(Valeurs),
    
    write('somme des cartes       : '),
    writeln(Somme),
    
    write('ordre des couleurs     : '),
    writeln(Ordre_couleurs),
    
    write('solution               : '),
    writeln(Solution),
    
    writeln('cartes jouees          : '),
    liste:display_liste(Cartes_jouees),
    
    write('resulat                : '),
    writeln(Resultat).
    
    
  % ---	
affiche_coup([], []) :-
    !.
  
affiche_coup([Carte|Cartes], Domaines) :-	
    prolog:get_position_carte(Carte, Position),
    select(d(Position, Couleurs, Valeurs), Domaines, Domaines1),
    affiche_carte_jouee_domaine(Carte, d(Position, Couleurs, Valeurs)),
    affiche_coup(Cartes, Domaines1).
    
    % ---    
affiche_carte_jouee(c(Couleur, Valeur, Position, Temps, 
                    Couleur_devinee, Valeur_devinee)) :-
    nl,
    write('carte '),
    writeln(Position),                
    write('valeur          : '),
    writeln(Valeur),
    write('couleur         : '), 
    writeln(Couleur),
    write('position        : '), 
    writeln(Position),
    write('temps           : '),
    writeln(Temps),
    write('couleur devinee : '), 
    writeln(Couleur_devinee),
    write('valeur devinee  : '),
    writeln(Valeur_devinee).
    
    
affiche_carte_jouee_domaine(c(Couleur, Valeur, Position, _Temps, 
                                      Couleur_devinee, Valeur_devinee),
                                d(Position, Couleurs_possibles, 
                                     inter(Min, Max))
                                ) :-
     write('carte '),
     writeln(Position),          
     write('couleur proposee       : '), 
     write(Couleur),
     write(' parmi ('),
     write(Couleurs_possibles),
     writeln(')'),
     write('couleur devinee        : '),
     writeln(Couleur_devinee),
     write('valeur proposee        : '),
     write(Valeur),
     write(' parmi ('),
     affiche_intervalle(Min, Max),
     writeln(')'),
     write('valeur devinee         : '),
     writeln(Valeur_devinee),
     nl.
 

affiche_domaines_carte(d(_Position, Couleurs_possibles, inter(Min, Max))) :-	
	write('couleurs possibles     : '),
	writeln(Couleurs_possibles),
	write('valeurs possibles      : '),
	divers:affiche_intervalle(Min, Max),
	nl.
     
     
affiche_infos(Nb_solutions_avant, Nb_solutions, Entropie, Entropie1) :- 
    Gain_info1 is Entropie-Entropie1,
    divers:arrondit_float(Gain_info1, 100, Gain_info),
    Gain_solutions is Nb_solutions_avant-Nb_solutions,
    nl,
    write('nb solutions avant     : '),
    writeln(Nb_solutions_avant),
    write('nb solutions restantes : '),
    writeln(Nb_solutions),
    write('diminution solutions   : '),
    writeln(Gain_solutions),
    write('entropie avant         : '),
    writeln(Entropie),
    write('entropie restante      : '), 
    writeln(Entropie1), 
    write('gain information       : '),
    writeln(Gain_info).
    
  
    % ---
affiche2_domaines(Domaines, Domaines1) :-
    bk:ordonne_domaines(Domaines, DomainesA),
    bk:ordonne_domaines(Domaines1, DomainesB),
    affiche_les_domaines(DomainesA, DomainesB).


    % ---    
affiche_les_domaines([], []) :-
    !.
       
affiche_les_domaines([Domaine|Domaines], [Domaine1|Domaines1]) :-
    affiche2_domaine(Domaine, Domaine1),
    affiche_les_domaines(Domaines, Domaines1).

    
    % ---    
affiche2_domaine(
                  d(Position, Couleurs, inter(Min,Max)),
                  d(Position, Couleurs1, inter(Min1, Max1))
                ) :-
    nl,
    write('carte '),
    writeln(Position),  
    write('couleurs restantes : '),
    write(Couleurs),
    write(' -> '),
    writeln(Couleurs1),
    write('valeurs restantes  : '),
    divers:affiche_intervalle(Min, Max),
    write(' -> '),
    divers:affiche_intervalle(Min1, Max1),
    nl.
 
         
    % ---    
affiche_domaines([]) :-
    !.

affiche_domaines([Domaine|Domaines]) :-
    affiche_domaine(Domaine),
    affiche_domaines(Domaines).
    
    
    % ---   
affiche_domaine(
                      d(Position, Couleurs, inter(Min,Max))
                 ) :-
    nl,
    write('carte '),
    writeln(Position),  
    write('couleurs possibles : '),
    writeln(Couleurs),
    write('valeurs possibles  : '),
    divers:affiche_intervalle(Min, Max),
    nl.


 
/* ============================== FIN LISTING =============================== */   
