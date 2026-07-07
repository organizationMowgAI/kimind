/* ========================================================================== */
/*                               BK  KIMIND                                   */
/* ========================================================================== */
  
:- module(
         bk, 
         [
            valeurs_carte/2,
            couleurs_carte/1,
            ordonne_cartes/2,
			construit_cartes/4,

			ordre_couleurs_ids/2,
            sature_ordre_couleurs/2,

            valeur_hors_domaine/2,
            couleur_hors_domaine/2,
            ordonne_domaines/2,
            sort_domaines_couleurs/2,
            maj_domaines/3,
            
            reponse_coup/3,
            ordonne_coup/2,
            
            retire_cartes_devinees/4,
            get_cartes_couleurs_devinees/2,
            retire_cartes_solutions/3
         ]
		 ).
		 		 	 		 
/* ================================= CARTE ================================== */
		
		
% --------------------------------- VALEURS ------------------------------------
		 
valeurs_carte(1,10).

couleurs_carte([blue, green, yellow, red]).

valeur_hors_domaine(Valeur, domaine(Min, _Max)) :-
	Valeur < Min,
	!.

valeur_hors_domaine(Valeur, domaine(_Min, Max)) :-
	Valeur > Max,
	!.

% --------------------------------- COULEURS -----------------------------------
   
   
couleur_hors_domaine(Couleur, domaine(Couleurs)) :-
	\+ member(Couleur, Couleurs).


	% construit en extension tous les ordres de couleurs deux a deux
sature_ordre_couleurs([], []) :- 
	!.

sature_ordre_couleurs([Couleur, Comp|Couleurs], Sat_ordre_couleurs) :-
	!,                          % laisser le cut
	sature_couleur(Couleurs, Couleur, Comp, Sat_ordre_couleurs1),
	sature_ordre_couleurs(Couleurs, Sat_ordre_couleurs2),
	append(Sat_ordre_couleurs1, Sat_ordre_couleurs2, Sat_ordre_couleurs).

	% reste une seule couleur, tout est traite
sature_ordre_couleurs([_Couleur], []).


	% ---
sature_couleur([], _Couleur, _Comp, []) :-
	!. 

sature_couleur([Comp1|Couleurs], Couleur, Comp, Sat_ordre_couleurs1) :-
    member(Comp1, [<, =]),
	!,
	check_comp(Comp, Comp1, Comp2),
	sature_couleur(Couleurs, Couleur, Comp2, Sat_ordre_couleurs1).

sature_couleur([Couleur1|Couleurs], Couleur, =, 
               [eq(Couleur, Couleur1)|Sat_ordre_couleurs1]) :-
	!,
	sature_couleur(Couleurs, Couleur, =, Sat_ordre_couleurs1).

sature_couleur([Couleur1|Couleurs], Couleur, <,
                [inf(Couleur, Couleur1)|Sat_ordre_couleurs1]) :-
	!,
	sature_couleur(Couleurs, Couleur, <, Sat_ordre_couleurs1).	


check_comp(_Comp, <, <) :-
    !.
    
check_comp(Comp, =, Comp).
	
/* ============================ CARTES ====================================== */

	% ---
construit_cartes(_Position, [], [], []) :-
	!.

construit_cartes(Position, [Couleur|Couleurs], [Valeur|Valeurs], 
                 [c(Position, Couleur, Valeur)|Cartes]) :-
	Position1 is Position+1,
	construit_cartes(Position1, Couleurs, Valeurs, Cartes).
	

	% convertit Ordre_couleurs en mettant les ids des couleurs 
	% a la place des noms des couleurs
ordre_couleurs_ids([], []) :-
	!.

ordre_couleurs_ids([Comp|Ordre], [Comp|Ordre1]) :-
	member(Comp, [<,eq]),
	!,
	ordre_couleurs_ids(Ordre, Ordre1).

ordre_couleurs_ids([Couleur|Ordre], [Id|Ordre1]) :-
	get_id_couleur(Couleur, Id),
	!,
	ordre_couleurs_ids(Ordre, Ordre1).


	% ---
ordonne_cartes(Cartes, Cartes_ordonnees) :-
    sort(1, @=<, Cartes, Cartes_ordonnees).
    
    % retire les domaines des cartes devinees et 
    % retourne le nombre de cartes devinees
retire_cartes_devinees([], Domaines, Domaines, []) :-
    !.
    
retire_cartes_devinees([Position|Positions], Domaines, 
                       Domaines_out, 
                       [c(Couleur, Valeur, Position) |Cartes_devinees]):-
	select(d(Position, [Couleur], inter(Valeur,Valeur)), Domaines, Domaines1),
    retire_cartes_devinees(Positions, Domaines1, Domaines_out, Cartes_devinees).
 

    % ---
get_cartes_couleurs_devinees([], []) :-
    !.

get_cartes_couleurs_devinees([d(Position, [Couleur], _Valeurs)|Domaines], 
                             [c(Position,Couleur) |Couleurs_devinees]) :-
    !,  
    get_cartes_couleurs_devinees(Domaines, Couleurs_devinees).
 
 
get_cartes_couleurs_devinees([_Domaine|Domaines], Couleurs_devinees) :-
    get_cartes_couleurs_devinees(Domaines, Couleurs_devinees).   


/* ============================= DOMAINES =================================== */


ordonne_domaines(Domaines, Domaines_ordonnes) :-
        sort(1, @=<, Domaines, Domaines_ordonnes).
        
       
    % ---
sort_domaines_couleurs(Domaines, Domaines_out) :-
    get_taille_couleurs(Domaines, Domaines1),
    sort(3, @=<, Domaines1, Domaines2),
    retire_taille_couleurs(Domaines2, Domaines_out).

    % ---
get_taille_couleurs([], []) :-
    !.  

get_taille_couleurs([d(Position, Couleurs, inter(Min, Max))|Domaines],
                    [d(Position, Couleurs, N, inter(Min, Max))|Domaines1]) :-
    length(Couleurs, N),
    get_taille_couleurs(Domaines, Domaines1).
    
       %
retire_taille_couleurs([], []) :-
    !.  

retire_taille_couleurs([d(Position, Couleurs, _N, inter(Min, Max))|Domaines],
                       [d(Position, Couleurs, inter(Min, Max))|Domaines1]) :-
    retire_taille_couleurs(Domaines, Domaines1).
    
    
    % on retire Couleur des couleurs possibles de Domaines
maj_domaines([], _Couleur, []) :-
    !.
    
maj_domaines([d(Position, Couleurs, Inter)|Domaines], Couleur, 
             [d(Position, Couleurs1, Inter)|Domaines1]) :-
    select(Couleur, Couleurs, Couleurs1),
    !,
    maj_domaines(Domaines, Couleur, Domaines1).
      
maj_domaines([Domaine|Domaines], Couleur, [Domaine|Domaines1]) :-
    maj_domaines(Domaines, Couleur, Domaines1).   
    
        
/* ================================ COUP ==================================== */

   
    % classe les coups dans l'ordre des positions
ordonne_coup(Coup, Coup1) :-
    sort(1, @=<, Coup, Coup1).


    % donne la reponse au coup en fonction de la solution
reponse_coup([], _Solution, []) :-    
    !.
    
reponse_coup([Carte|Cartes], Solution, [Carte1|Cartes1]) :-
    reponse(Carte, Solution, Carte1),
    reponse_coup(Cartes, Solution, Cartes1).
    
    
    % ---
reponse(c(Position, Couleur, Valeur), Solution, 
        c(Position, Couleur, Valeur, 0, Comp_couleur, Comp_valeur)) :-
       member(c(Position, Couleur_sol, Valeur_sol), Solution),
       compare_couleur(Couleur, Couleur_sol, Comp_couleur),
       compare_valeur(Valeur, Valeur_sol, Comp_valeur).
       

    % ---
compare_couleur(Couleur, Couleur, oui) :-
    !.
    
compare_couleur(_Couleur, _Couleur_sol, non).


    % ---
compare_valeur(Valeur, Valeur, oui) :-
    !.
    
compare_valeur(Valeur, Valeur_sol, moins) :-
    Valeur > Valeur_sol,
    !.
    
compare_valeur(_Valeur, _Valeur_sol, plus).


/* ================================= SOLUTIONS ============================== */

    % retire des solutions les cartes qui n'apparaissent pas dans Domaines
retire_cartes_solutions([], _Pos_cartes_devinees, []) :-
    !.
        
retire_cartes_solutions([Solution|Solutions], Pos_cartes_devinees, 
                        [Solution1|Solutions_out]) :-
    retire_cartes_solution(Solution, Pos_cartes_devinees, 
                           Solution1),
    retire_cartes_solutions(Solutions, Pos_cartes_devinees, 
                            Solutions_out).
    
    % ---
retire_cartes_solution([], _Pos_cartes_devinees, []) :-
    !.
    
retire_cartes_solution([c(_Couleur, _Valeur, Position)|Cartes], 
                        Pos_cartes_devinees, Solutions1) :-
        member(Position, Pos_cartes_devinees),                
        !,
        retire_cartes_solution(Cartes, Pos_cartes_devinees, 
                              Solutions1).
        
retire_cartes_solution([Carte|Cartes], Pos_cartes_devinees, 
                       [Carte|Solutions1]) :-
        retire_cartes_solution(Cartes, Pos_cartes_devinees, Solutions1).
        
/* ============================ FIN LISTING ================================= */
