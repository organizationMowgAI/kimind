
/* ========================================================================== */
/*                               BK  KIMIND                                   */
/* ========================================================================== */

:- module(
         bk_deduction, 
         [
         
			solutions_couleurs/4,
            solutions/4,
            difficulte_partie/4,
            
            ajoute_positions_solutions/2,
            
            deduction_reponses_systeme/4, 
            deduction_couleurs/2,
            deduction_ordre_cartes/3,
            deduction_reduction_domaines/3,
            deduction_solutions/3,
            deduction_solutions_domaines/3,
            get_intervalles_couleurs/3
         ]
		 ).
		 
:- use_module(divers),
   use_module(liste),
   use_module(messages).
		 	 		 
/* ============================ REGLES DE DEDUCTION ========================= */

% ------ Reduction des domaines (couleurs, valeurs) en fonction des reponses ---
% (4.1.1 dans doc)   
deduction_reponses_systeme(Coup, Domaines, Domaines1, Cartes_devinees) :- 
    analyse_coup(Coup, Domaines, Domaines1, Cartes_devinees).
   
   % la réponse à chaque coup limite l'espace des possibilités 
    % (couleurs, valeurs) 
analyse_coup([], [], [], []) :-
    !.
           
analyse_coup([Carte|Cartes], Domaines, [Domaine1|Domaines_out], 
              [Position|Positions]) :-
	carte_devinee(Carte),
	!,
    get_position_carte(Carte, Position),
	traite_carte(Carte, Domaines, Position, Domaine1, Domaines1),
    analyse_coup(Cartes, Domaines1, Domaines_out, Positions).

analyse_coup([Carte|Cartes], Domaines, [Domaine1|Domaines_out], 
              Positions) :-
    get_position_carte(Carte, Position),
	traite_carte(Carte, Domaines, Position, Domaine1, Domaines1),
    analyse_coup(Cartes, Domaines1, Domaines_out, Positions).

    % ---
traite_carte(Carte, Domaines, Position, Domaine1, Domaines1) :-
	select(d(Position, Couleurs, Valeurs), Domaines, Domaines1),
    check_carte_domaines(Carte, d(Position, Couleurs,Valeurs), Domaine1).


    % verifie une carte couleur-valeur proposee et la reponse du jeu
check_carte_domaines(c(Couleur, Valeur, Position, _Duree, 
                       Reponse_couleur, Reponse_valeur), 
                     d(Position, Couleurs_possibles, Valeurs_possibles),
                     d(Position, Couleurs_possibles1, Valeurs_possibles1)) :-   
    nl,
    write('carte '),
    write(Position),
    writeln(' : '),
    check_couleur(Couleur, Reponse_couleur, 
                  Couleurs_possibles, Couleurs_possibles1),
    check_valeur(Valeur, Reponse_valeur, 
                 Valeurs_possibles, Valeurs_possibles1).
                 
  
    % carte devinee (une seule couleur et une seule valeurs possibles)
carte_devinee(c(_Couleur, _Valeur, _Position, _Temps, oui, oui)).

                   
    % couleur devinee
check_couleur(Couleur, oui, Couleurs_possibles, [Couleur]) :-
	!,
    write('- la couleur a ete trouvee : '),
    write(Couleur),
	write(', ses couleurs possibles passent de '),
    write(Couleurs_possibles),
    write(' => '),
	write('['),
    write(Couleur),
    writeln(']').
    
    % couleur non devinee on retire Couleur si elle existe dans
    % Couleurs_possibles
check_couleur(Couleur, non, Couleurs_possibles, Couleurs_possibles1) :-
    select(Couleur, Couleurs_possibles, Couleurs_possibles1),
    !,
	write('- sa couleur n''est pas '),
    write(Couleur),
	write(', ses couleurs possibles passent de '),
    write(Couleurs_possibles),
    write(' => '),
    writeln(Couleurs_possibles1).
    
    % couleur non devinee, et Couleur n'était pas dans Couleurs_possibles
check_couleur(_Couleur, non, Couleurs_possibles, Couleurs_possibles).
       

    % valeur devinee       
check_valeur(Valeur, oui, inter(Min,Max) , inter(Valeur, Valeur)) :-
	!,
    write('- la valeur a ete trouvee : '),
    write(Valeur),
    write(', ses valeurs possibles passent de '),
	affiche_intervalle(Min, Max),
    write(' => '),
    write('['),
    write(Valeur),
    writeln(']').
    
    % valeur inferieure a la valeur réelle
check_valeur(Valeur, plus, inter(Min,Max), inter(Min1, Max)) :-
	!,
    maj_inter_more(Valeur, Min, Min1),
    write('- sa valeur est superieure a '),
    write(Valeur),
    write(', ses valeurs possibles passent de '),
	affiche_intervalle(Min, Max),
    write(' => '),
    affiche_intervalle(Min1, Max),
    nl.
    
    % valeur superieure a la valeur réelle
check_valeur(Valeur, moins, inter(Min,Max), inter(Min, Max1)) :-
	!,
    maj_inter_less(Valeur, Max, Max1),
    write('- sa valeur est inferieure a '),
    write(Valeur),
    write(', ses valeurs possibles passent de '),
	affiche_intervalle(Min, Max),
    write(' => '),
    affiche_intervalle(Min, Max1),
    nl.
    

     % valeur inferieure a la valeur réelle qui est dans [Min,Max]
maj_inter_more(Valeur, Min, Min) :-
    Valeur < Min,
    !.
    
    % valeur est dans l'intervalle (nécessairement pas Max
    % sinon le systeme aurait répondu valeur exacte)
maj_inter_more(Valeur, _Min, Min1) :-
    Min1 is Valeur + 1.
    
    % valeur hors intervalle (trop grande)
maj_inter_less(Valeur, Max, Max) :-
    Valeur > Max,
    !.
    
    % valeur est dans l'intervalle pas nécessairement pas Min
    % sinon le systeme aurait répondu valeur exacte
maj_inter_less(Valeur, _Max, Max1) :-
    Max1 is Valeur - 1.
    
    % un domaine est de la forme 
    % const(position, couleurs_possibles, valeurs_possibles)
    % (couleurs_possibles est une liste de couleurs,
    %  valeurs_possibles est un intervalle : inter(Debut, Fin).
    % pour chaque carte déterminée par une position
    % chaque reponse du sytème peut réduire couleurs_possibles et 
    % valeurs_possibles
    
    
% ---------- deduction domaines couleurs en fonction singleton couleur ---------

    % si la couleur d'une carte est devinee, on retire cette couleur
    % des possibilités des autres cartes
    % (4.1.2 sur doc)
    % la procedure est réitere jusqu'à ce qu'il n'y ait plus de couleur retiree                    
deduction_couleurs(Domaines, [d(Position, [Couleur], Valeurs)|Domaines_out]) :-   
    select(d(Position, [Couleur], Valeurs), Domaines, Domaines1),
    !,
    write('- la carte '),
    write(Position),
    write(' est '),
    write(Couleur),
    writeln(' : on retire cette couleur des autres cartes'),                               
                                    % on la retire des autres domaines
    retirer_couleurs(Domaines1, Couleur, Domaines2),
    deduction_couleurs(Domaines2, Domaines_out).
    
    % pas ou plus de couleur devinee
deduction_couleurs(Domaines, Domaines).


    % retire Couleur de chaque domaine où elle apparait
retirer_couleurs([], _Couleur, []) :-
    !.
    
retirer_couleurs([d(Position, Couleurs, Valeurs)|Domaines], Couleur, 
                 [d(Position, Couleurs1, Valeurs)|Domaines1]) :-
    select(Couleur, Couleurs, Couleurs1),
    !,
    retirer_couleurs(Domaines, Couleur, Domaines1).
      
retirer_couleurs([Domaine|Domaines], Couleur, [Domaine|Domaines1]) :-
    retirer_couleurs(Domaines, Couleur, Domaines1).
      

% --- DEDUCTION D'UN ORDRE ENTRE LES VALEURS DES CARTES EN FONCTION DE --------- 
% --- L'ORDRE DES COULEURS 
%    (4.1.3 dans doc)

    % trouve un eventuel ordre sur valeurs des cartes en fonction de l'ordre
    % (en tenant compte de leur positions)  
    % (4.1.1 sur doc) 

deduction_ordre_cartes(Domaines, Ordre_couleurs, Ordre_cartes) :-
    recupere_couleurs(Domaines, Couleurs),
    recherche_ordre_cartes(Couleurs, Ordre_couleurs, Ordre_cartes).

recupere_couleurs([], []) :-
    !.

recupere_couleurs([d(Position, Couleurs, _Valeurs)|Domaines],
                   [c(Position, Couleurs)|Les_couleurs]) :-
    recupere_couleurs(Domaines, Les_couleurs).                                     


recherche_ordre_cartes([], _Ordre_couleurs, []) :-
    !.
    
recherche_ordre_cartes([c(Position, Couleurs_carte)|Couleurs],
                       Ordre_couleurs, Comparateurs_out) :-
    compare_couleurs_carte(Couleurs, Position, Couleurs_carte, Ordre_couleurs,
                           Comparateurs),
    recherche_ordre_cartes(Couleurs, Ordre_couleurs, Comparateurs1),
    append(Comparateurs, Comparateurs1, Comparateurs_out).
     

    % compare Couleurs_carte avec les couleurs possibles des autres cartes
compare_couleurs_carte([], _Position, _Couleurs_carte, _Ordre_couleurs, []) :-
    !.

compare_couleurs_carte([c(Position1, Couleurs1)|Couleurs], Position, 
                       Couleurs_carte, Ordre_couleurs,
                       [Ordre|Ordres]) :-              
    compare_couleurs(Couleurs_carte, Couleurs1, Ordre_couleurs, Comparateur), 
    !,
    construit_ordre(Comparateur, Operateur),
    Ordre =..[Operateur, Position, Position1],
   	comparateur_atom(Comparateur, Comparateur_a),
    comparateur_atom_s(Comparateur, Comparateur_s),
    write('- selon l''ordre des couleurs : '),
    divers:affiche_liste(Ordre_couleurs),
    nl,
    write('  toutes les couleurs de la carte '),
    write(Position),
    write(' ('),
    write(Couleurs_carte),
    write(')'),
    write(' sont '),
    write(Comparateur_a),
    write(' aux couleurs de la carte '),
    write(Position1),
	write(' ('),
    write(Couleurs1),
    writeln(')'),
    write('  => la valeur de la carte '),
    write(Position),
    write(' est '),
    write(Comparateur_s),
    write(' a la valeur de la carte '),
    writeln(Position1),
    nl,
    compare_couleurs_carte(Couleurs, Position, Couleurs_carte, Ordre_couleurs,
                           Ordres).
       
compare_couleurs_carte([_|Couleurs], Position, Couleurs_carte, Ordre_couleurs,
                       Ordres) :-
    compare_couleurs_carte(Couleurs, Position, Couleurs_carte, Ordre_couleurs,
                           Ordres).
                           
                           
comparateur_atom(<, 'inferieures') :-
    !.
    
comparateur_atom('<=', 'inferieures ou egales') :-
    !.
    
comparateur_atom(>, 'superieures') :-
    !.
            
comparateur_atom('>=', 'superieures ou egales') :-
    !.
        
comparateur_atom(=, 'egales').


	% ---
comparateur_atom_s(<, 'inferieure') :-
    !.
    
comparateur_atom_s('<=', 'inferieure ou egale') :-
    !.
    
comparateur_atom_s(>, 'superieure') :-
    !.
            
comparateur_atom_s('>=', 'superieure ou egale') :-
    !.
        
comparateur_atom_s(=, 'egale').



construit_ordre(<, inf) :-
    !.
    
construit_ordre('<=', inf_eq) :-
    !.
    
construit_ordre(=, eq) :-
    !.
    
construit_ordre(>, sup) :-
    !.
    
construit_ordre('>=', sup_eq).    
    
% ---------- REDUCTION DES VALEURS EN FONCTION DE L'ORDRE DES VALEURS ---------- 

    % On reduit le domaines des cartes en fonction de l'ordre de ces dernieres
    % (4.1.4 sur doc)
    % on cycle tant qu'il y a eu des reductions
deduction_reduction_domaines(Ordres, Domaines, Domaines_out) :-
	reduction_domaines(Ordres, Domaines, Domaines1, Changements),
	cycle_reduction_domaines(Ordres, Domaines1, Changements, Domaines_out).


	% ---
reduction_domaines([], Domaines, Domaines, []) :-   
    !.

reduction_domaines([Ordre|Ordres], Domaines,  Domaines_out, Changements) :-
    reduire_domaines(Ordre, Domaines, Domaines1, Changements1),
    reduction_domaines(Ordres, Domaines1, Domaines_out, Changements2),
	append(Changements1, Changements2, Changements).


	% aucun changement apres derniere reduction
cycle_reduction_domaines(_Ordres, Domaines, [], Domaines) :-
	!.
	
cycle_reduction_domaines(Ordres, Domaines, Changements, Domaines_out) :-
	maj_ordres(Changements, Ordres, Ordres1),
	% selectionne_domaines(Ordres1, Domaines, Domaines1),
    reduction_domaines(Ordres1, Domaines, Domaines1, Changements1),
	cycle_reduction_domaines(Ordres, Domaines1, Changements1, Domaines_out).


	% ---    
reduire_domaines(Ordre, Domaines, [d(Pos1, Couleurs1, inter(MinA,MaxA)),
                                   d(Pos2, Couleurs2, inter(MinB,MaxB))
                                   |Domaines2],
								   Changements) :-
    Ordre =..[Comparateur, Pos1, Pos2],
    select(d(Pos1, Couleurs1, inter(Min1, Max1)), Domaines, Domaines1),
    select(d(Pos2, Couleurs2, inter(Min2, Max2)), Domaines1, Domaines2),
    reduire(Comparateur, Min1, Max1, Min2, Max2, 
			MinA, MaxA, MinB, MaxB, Modif_min, Modif_max),
    verif_modification_min(Pos1, Pos2, Comparateur, Modif_min),
    verif_modification_max(Pos1, Pos2, Comparateur, Modif_max),
	get_modif(Modif_min,Modif_min1),
    get_modif(Modif_max,Modif_max1),
   
	check_modification(Pos1, Pos2, Modif_min1, Modif_max1, Changements).
	

	% ---
get_modif(min(_N, _V1, _V2, _Vmin, Modifie), Modifie) :-
	!.

get_modif(max(_N, _V1, _V2, _Vmax, Modifie), Modifie).


    % ---
verif_modification_min(Pos1, Pos2, Comparateur, 
                       min(N, V1, V2, Vmin, modifie)) :-
    !,
    write('- la carte '),
    write(Pos1),
	write(' de valeur minimale '),
	write(V1),
    write(' est ' ),
    comparateur_atom2(Comparateur, Comparateur_a),
    write(Comparateur_a),
    write(' a la carte '),
    write(Pos2),
    write(' de valeur minimale '),
	writeln(V2),
    verif_min(N, Pos1, Pos2, Vmin).

verif_modification_min(_Pos1, _Pos2, _Comparateur, 
                      min(_N, _V1, _V2, _Vmin, pas_modifie)).

    % ---    
verif_min(1, Pos1, _Pos2, Vmin) :-
    write('  => la valeur minimale de la carte '),
	write(Pos1),
    write(' devient '),
	writeln(Vmin),
    nl.

verif_min(2, _Pos1, Pos2, Vmin) :-
    write('  => la valeur minimale de la carte '),
	write(Pos2),
    write(' devient '),
	writeln(Vmin),
    nl.

	% ---
verif_modification_max(Pos1, Pos2, Comparateur, 
                       max(N, V1, V2, Vmax, modifie)
                       ) :-
	!,
    write('- la carte '),
    write(Pos1),
	write(' de valeur maximale '),
	write(V1),
    write(' est ' ),
    comparateur_atom2(Comparateur, Comparateur_a),
    write(Comparateur_a),
    write(' a la carte '),
    write(Pos2),
    write(' de valeur maximale '),
	writeln(V2),
    verif_max(N, Pos1, Pos2, Vmax).

verif_modification_max(_Pos1, _Pos2, _Comparateur, 
                       max(_N, _V1, _V2, _Vmin, pas_modifie)
                      ).

	% ---
verif_max(1, Pos1, _Pos2, Vmax) :-
    write('  => la valeur maximale de la carte '),
	write(Pos1),
    write(' devient '),
	writeln(Vmax),
    nl.

verif_max(2, _Pos1, Pos2, Vmax) :-
    write('  => la valeur maximale de la carte '),
	write(Pos2),
    write(' devient '),
	writeln(Vmax),
    nl.


comparateur_atom2(inf, 'inferieure') :-
    !.
    
comparateur_atom2(inf_eq, 'inferieure ou egale') :-
    !.
    
comparateur_atom2(sup, 'superieure') :-
    !.
            
comparateur_atom2(sup_eq, 'superieure ou egale') :-
    !.
        
comparateur_atom2(eq, 'egale').
    
	% ---             
reduire(sup, Min1, Max1, Min2, Max2, MinA, Max1, Min2, MaxB, 
        Modif_min, Modif_max) :-
    !,
    MinA is max(Min1, Min2+1),
	min_modifie(1, Min1, Min2, MinA, Modif_min),
    MaxB is min(Max1-1, Max2),
	max_modifie(2, Max1, Max2, MaxB, Modif_max).
	
reduire(sup_eq, Min1, Max1, Min2, Max2, MinA, Max1, Min2, MaxB, 
        Modif_min, Modif_max) :-
    !,
    MinA is max(Min1, Min2), 
	min_modifie(1, Min1, Min2, MinA, Modif_min),
    MaxB is min(Max1, Max2), 
	max_modifie(2, Max1, Max2, MaxB, Modif_max).
    
reduire(inf, Min1, Max1, Min2, Max2, Min1, MaxA, MinB, Max2, 
        Modif_min, Modif_max) :-
    !,
    MinB is max(Min1+1, Min2),
	min_modifie(2, Min1, Min2, MinB, Modif_min),
    MaxA is min(Max1, Max2-1), 
	max_modifie(1, Max1, Max2, MaxA, Modif_max).
    
reduire(inf_eq, Min1, Max1, Min2, Max2, Min1, MaxA, MinB, Max2, 
        Modif_min, Modif_max) :-
    MinB is max(Min1, Min2), 
	min_modifie(2, Min1, Min2, MinB, Modif_min),
	MaxA is min(Max1, Max2), 
	max_modifie(1, Max1, Max2, MaxA, Modif_max).

reduire(eq, Min1, Max1, Min2, Max2, Min, Max, Min, Max, 
        Modif_min, Modif_max) :-
    Min is max(Min1, Min2), 
	modifie_min_eq(Min1, Min2, Min, Modif_min),
    Max is min(Max1, Max2), 
	modifie_max_eq(Max1, Max2, Max, Modif_max).

	% ---
modif(modifie, _Modif2, modifie) :-
	!.

modif(_Modif1, modifie, modifie) :-
	!.

modif(pas_modifie, pas_modifie, pas_modifie).


	% verifie les modifications des mins
min_modifie(1, V1, V2, V1, min(1, V1, V2, V1, pas_modifie)) :- 
	!.
	
min_modifie(1, V1, V2, Vmin, min(1, V1, V2, Vmin, modifie)) :-
    !.
	
min_modifie(2, V1, V2, V2, min(1, V1, V2, V2, pas_modifie)) :- 
	!.
	
min_modifie(2, V1, V2, Vmin, min(2, V1, V2, Vmin, modifie)).
		
		
    % verifie les modifications des maxs
max_modifie(1, V1, V2, V1, max(1, V1, V2, V1, pas_modifie)) :- 
	!.
	
max_modifie(1, V1, V2, Vmax, max(1, V1, V2, Vmax, modifie)) :- 
	!.
	
max_modifie(2, V1, V2, V2, max(2, V1, V2, V2, pas_modifie)) :- 
	!.
	
max_modifie(2, V1, V2, Vmax, max(2, V1, V2, Vmax, modifie)).
	

	% cartes sont egales, on regarde quelle carte a ete modifie
modifie_min_eq(V, V, V, min(-1, V, V, V, pas_modifie)) :- 
	!.
	
modifie_min_eq(V1, V2, V2, min(1, V1, V2, V2, modifie)) :-
    !.

modifie_min_eq(V1, V2, V1, min(2, V1, V2, V1, modifie)).


	% ---
modifie_max_eq(V, V, V, max(-1, V, V, V, pas_modifie)) :- 
	!.
	
modifie_max_eq(V1, V2, V2, max(1, V1, V2, V2, modifie)) :-
    !.

modifie_max_eq(V1, V2, V1, max(2, V1, V2, V1, modifie)).



	% ---
check_modification(_Pos1, _Pos2, pas_modifie, pas_modifie, []) :-
	!.

check_modification(Pos1, Pos2, _,_, [Pos1, Pos2]).


	% on ne retient que les ordres des cartes dont les domaines ont été
	% modifies
maj_ordres([], _Ordres, []) :-
	!.

maj_ordres([Position|Positions], Ordres, Ordres_out) :-
	get_ordres(Ordres, Position, Ordres1),
	maj_ordres(Positions, Ordres, Ordres2),
	append(Ordres1, Ordres2, Ordres_out).


	% recupere les ordres qui impliquent Position
get_ordres([], _Position, []) :-
	!.

get_ordres([Ordre|Ordres], Position, [Ordre|Ordres1]) :-
	ordre_position(Ordre, Position),
	!,
	get_ordres(Ordres, Position, Ordres1).

get_ordres([_Ordre|Ordres], Position, Ordres1) :-
	get_ordres(Ordres, Position, Ordres1).

	%---	
ordre_position(Ordre, Position) :-
	arg(1, Ordre, Position),
	!.

ordre_position(Ordre, Position) :-
	arg(2, Ordre, Position).


% ------------- ELIMINE DES SOLUTIONS EN FONCTION DES VALEURS ------------------
    
deduction_solutions(Solutions, Domaines, Solutions1) :-
	 retire_mauvaises_solutions(Solutions, Domaines, Solutions1).
	
                
    % retire les solutions incompatibles avec les domaines encore possibles
retire_mauvaises_solutions([], _Domaines, []) :-
    !.
    
retire_mauvaises_solutions([Solution|Solutions], Domaines, 
                           [SolutionA|Solutions1]) :-
    solution_compatible_domaines(Solution, Solution, Domaines, SolutionA),
    !,
    retire_mauvaises_solutions(Solutions, Domaines, Solutions1).
    
retire_mauvaises_solutions([_Solution|Solutions], Domaines, Solutions1) :-
    retire_mauvaises_solutions(Solutions, Domaines, Solutions1).  
    

    % verifie si la Solution est compatible avec les Domaines
solution_compatible_domaines([], _Solution_depart, _Domaines, []) :-  
    !.
      
solution_compatible_domaines([Carte|Solution], Solution_depart,
                              Domaines, [Carte1|Solution1]) :-
    carte_compatible_domaines(Solution_depart, Carte, Domaines, Carte1),
    solution_compatible_domaines(Solution, Solution_depart, Domaines, Solution1).
        

    % carte proposee est compatible avec la carte solution
    % elles ont la meme couleur
carte_compatible_domaines(Solution, c(Couleur, Valeur, Position1), 
                         Domaines,
                         c(Couleur, Valeur, PositionA)) :-
    member(d(Position, [Couleur], inter(Vmin, Vmax)), Domaines),
			% la position de la carte est identifiee par sa couleur
    !,
 
    (
		position_ok(Position1, Position, PositionA) -> 
        (
		     valeur_ok(Valeur, inter(Vmin, Vmax)) ->
		        true
		        ;
				write('- la solution '),
			  	write(Solution),
		      	writeln(' est rejetee :'),
                write('  elle indique que la carte '),
		      	write(Couleur),
		      	write(' a la valeur '),
		      	write(Valeur),
                write(','),
		      	write('  or cette carte a '),
                messages:message_intervalle(Vmin, Vmax),
                nl,
                nl,
		        fail
		 )
		 ;
		      writeln('- la solution '),
			  write(Solution),
		      writeln(' est rejetee : '),
              writeln(' elle indique que la carte '),
		      write(Couleur),
		      write(' est en position '),
		      write(Position1),
              writeln(','),
		      write('or cette carte est en position '),
		      writeln(Position),
              nl,
			  fail
    ).
  
carte_compatible_domaines(_Solution, Carte, _Domaines, Carte).  
   
    % position non definie dans la carte solution
    % la carte solution prend la position Position
position_ok(-1, Position, Position) :-
    !.
    
position_ok(Position, Position, Position).
   
    
    % carte solution a pour valeur Valeur
    % la valeur de la carte proposee est compatible
valeur_ok(Valeur, inter(Min, Max)) :-
    Min =< Valeur,
    Valeur =< Max.
    
    
% -------------- REDUIT LES VALEURS EN FONCTION DES SOLUTIONS ------------------
 
    % analyse les domaines des solutions, et reduit eventuellement
    % les domaines des cartes en consequence
deduction_solutions_domaines(Solutions, Domaines, Domaines_out) :-
    get_intervalles_couleurs(Domaines, Solutions, Inter_couleurs),
    reduit_domaines(Domaines, Inter_couleurs, Domaines_out).


    % recupere les domaines de valeurs par couleur
get_intervalles_couleurs(Domaines, Solutions, Inter_couleurs1) :-
    game:valeurs(Valeurs),
    min_member(Min, Valeurs),
    max_member(Max, Valeurs),
    get_couleurs_domaines(Domaines, Couleurs1),
    sort(Couleurs1, Couleurs),
    construit_intervalles_couleurs(Couleurs, Min, Max, Inter_couleurs),
    get_intervalles(Solutions, Inter_couleurs, Inter_couleurs1).


    % ---
get_couleurs_domaines([], []) :-
    !.
    
get_couleurs_domaines([d(_Position, Couleurs,_Valeur)|Domaines], Couleurs_out) :-
    get_couleurs_domaines(Domaines, Couleurs1),
    append(Couleurs, Couleurs1, Couleurs_out).


	% reduction des domaines en fonction des intervalles trouvees dans
	% les solutions
reduit_domaines([], _Inter_couleurs, []) :-
	!. 

	% une seule couleur possible pour la carte a cette Position
reduit_domaines([d(Position, [Couleur], inter(Min, Max))|Domaines], 
                Inter_couleurs, 
                [d(Position, [Couleur], inter(Min2, Max2))|Domaines1]) :-
    !,
	functor(Couleur1, Couleur, 2),
    member(Couleur1, Inter_couleurs),
    arg(1, Couleur1, Min1),
    arg(2, Couleur1, Max1),
    compare_intervalles_min(Min, Min1, Min2, Modif_min),
    messages:message_domaine_modifie_min(Modif_min, game, Position, 
                                                Couleur, Min, Min2), 
	compare_intervalles_max(Max, Max1, Max2, Modif_max),
	messages: message_domaine_modifie_max(Modif_max, game, Position, Couleur, 
                                                 Max, Max2), 
    reduit_domaines(Domaines, Inter_couleurs, Domaines1).
    
	% plusieurs couleurs pour la carte courante, Domaine ne change pas
reduit_domaines([Domaine|Domaines], Inter_couleurs, [Domaine|Domaines1]) :-
    reduit_domaines(Domaines, Inter_couleurs, Domaines1).

	
	% ---
compare_intervalles_min(Min, Min1, Min1, modifie) :-
	Min < Min1,
	!.

compare_intervalles_min(Min, _Min1, Min, pas_modifie).


	% ---
compare_intervalles_max(Max, Max1, Max1, modifie) :-
	Max > Max1,
	!.

compare_intervalles_max(Max, _Max1, Max, pas_modifie).


    % ---
construit_intervalles_couleurs([], _Min, _Max, []) :-
    !.
  
construit_intervalles_couleurs([Couleur|Couleurs], Min, Max,
                               [Couleur1|Couleurs1]) :-
    Max1 is Max + 1,
    Min1 is Min - 1,                           
    Couleur1 =..[Couleur, Max1, Min1],
    construit_intervalles_couleurs(Couleurs, Min, Max, Couleurs1).
    
            
    
    % Pour chaque couleur cherche dans les solutions les valeurs min et max
get_intervalles([], Inter_couleurs, Inter_couleurs) :-
    !.   

get_intervalles([Solution|Solutions], Inter_couleurs, Inter_couleurs_out) :-
    maj_intervalles_couleurs(Solution, Inter_couleurs, Inter_couleurs1),
    get_intervalles(Solutions, Inter_couleurs1, Inter_couleurs_out).


	% ---
maj_intervalles_couleurs([], [], []) :-
	!.

maj_intervalles_couleurs([c(Couleur, Valeur, _Position) | Cartes], 
                         Inter_couleurs,
                        [Couleur2|Inter_couleurs_out]) :-
	functor(Couleur1, Couleur,2),
    select(Couleur1, Inter_couleurs, Inter_couleurs1),
	Couleur1 =..[Couleur, Min, Max],	
    maj_valeurs_min(Valeur, Min, Min1),
    maj_valeurs_max(Valeur, Max, Max1),
	Couleur2 =..[Couleur, Min1, Max1], 
	maj_intervalles_couleurs(Cartes, Inter_couleurs1, Inter_couleurs_out).


	% ---
maj_valeurs_min(Valeur, Min, Valeur) :-
	Valeur < Min,
	!.
	
maj_valeurs_min(_Valeur, Min, Min).


	% ---
maj_valeurs_max(Valeur, Max, Valeur) :-
	Valeur > Max,
	!.
	
maj_valeurs_max(_Valeur, Max, Max).

    
/* =========================== COMPARAISON DE CARTES ======================== */

    % classe 2 cartes (Comparateur dans [<, <=, =,sans_ordre]) 
    % en fonction de l'ordre des couleurs et les couleurs encore possibles
    % des 2 cartes (Couleurs1 et Couleurs2)
compare_couleurs(Couleurs1, Couleurs2, Ordre_couleurs, Comparateur) :-
    compare_couleurs2(Couleurs1, Couleurs2, Ordre_couleurs, rien, Comparateur).
        
compare_couleurs2([], _Couleurs2, _Ordre_couleurs, Comparateur, Comparateur) :-
    !.
    
compare_couleurs2([Couleur|Couleurs1], Couleurs2, Ordre_couleurs, 
                  Comparateur_trouve, Comparateur) :-
    compare_la_couleur(Couleur, Couleurs2, Ordre_couleurs, Comparateur1),
    comparateurs_compatibles(Comparateur_trouve, Comparateur1, 
                             Comparateur_trouve1),                        
    compare_couleurs3(Couleurs1, Couleurs2, Ordre_couleurs,
                      Comparateur_trouve1, Comparateur).
                      
                             
compare_couleurs3(_Couleurs1, _Couleurs2, _Ordre_couleurs,
                  aucun_ordre, aucun_ordre) :-
    !.
                                 
compare_couleurs3(Couleurs1, Couleurs2, Ordre_couleurs,
                  Comparateur_trouve, Comparateur) :-
    compare_couleurs2(Couleurs1, Couleurs2, Ordre_couleurs,
                      Comparateur_trouve, Comparateur).
    
   
    % compare Couleur avec toutes les couleurs de Couleurs
compare_la_couleur(Couleur, Couleurs, Ordre_couleurs, Comparateur) :-
    compare_la_couleur2(Couleurs, Couleur, Ordre_couleurs, rien, Comparateur).


compare_la_couleur2([], _Couleur, _Ordre_couleur, Comparateur, Comparateur) :-
    !.

compare_la_couleur2([Couleur1|Couleurs], Couleur, Ordre_couleurs, 
                    Comparateur_trouve, Comparateur) :-
    compare_deux_couleurs(Couleur, Couleur1, Ordre_couleurs, Comparateur1),
    comparateurs_compatibles(Comparateur_trouve, Comparateur1, 
                             Comparateur_trouve1),                     
    compare_la_couleur3(Couleurs, Couleur, Ordre_couleurs, 
                        Comparateur_trouve1, Comparateur).

compare_la_couleur3(_Couleurs, _Couleur, _Ordre_couleurs, 
                    aucun_ordre, aucun_ordre) :-
    !.
                        
compare_la_couleur3(Couleurs, Couleur, Ordre_couleurs, 
                    Comparateur_trouve, Comparateur) :-
    compare_la_couleur2(Couleurs, Couleur, Ordre_couleurs, 
                        Comparateur_trouve, Comparateur).
                        
                          
    % trouve l'operateur de comparaison entre couleur1 et couleur2
    % dans Ordre_couleurs    
compare_deux_couleurs(Couleur1, Couleur2, Ordre_couleurs, Comparateur) :-
    position_couleur(Ordre_couleurs, 1, Couleur1, Pos1),
    position_couleur(Ordre_couleurs, 1, Couleur2, Pos2),
    trouve_comparateur(Ordre_couleurs, Pos1, Pos2, Comparateur).
 
 
position_couleur([Couleur|_Ordre_couleurs], Position, Couleur, Position) :-
    !.
    
position_couleur([_|Ordre_couleurs], Position, Couleur, Position_out) :-
    Position1 is Position + 1,
    position_couleur(Ordre_couleurs, Position1, Couleur, Position_out).
        

    % 2 couleurs identiques
trouve_comparateur(_Ordre_couleurs, Pos, Pos, =) :-
    !.
    
trouve_comparateur(Ordre_couleurs, Pos1, Pos2, Comparateur) :-
    Pos1 < Pos2,
    !,
    liste:select_n_first(Ordre_couleurs, Pos1, Ordre_couleurs1, _),
    PosB is Pos2-Pos1-1,
    trouve_comparateur2(Ordre_couleurs1, 1, PosB, rien, Comparateur).
    
trouve_comparateur(Ordre_couleurs, Pos1, Pos2, Comparateur) :-
    liste:select_n_first(Ordre_couleurs, Pos2, Ordre_couleurs1, _),
    PosB is Pos1-Pos2-1,
    trouve_comparateur2(Ordre_couleurs1, 1, PosB, rien, Comparateur1),
    inverse_comparateur(Comparateur1, Comparateur).


trouve_comparateur2([Comp|_Ordre_couleurs], Pos_final, Pos_final, 
                    Comparateur_trouve, Comparateur) :-
    !,
    check_comparateur(Comp, Comparateur_trouve, Comparateur).
    
    
trouve_comparateur2([Comp|Ordre_couleurs], Pos, Pos_final, 
                    Comparateur_trouve, Comparateur) :-
    check_comparateur(Comparateur_trouve, Comp, Comparateur_trouve1),
    Pos_final1 is Pos_final-1,
    trouve_comparateur3(Ordre_couleurs, Pos, Pos_final1, Comparateur_trouve1,
                        Comparateur).
      
                        
trouve_comparateur3(_Ordre_couleurs, _Pos, _Pos_final, <, <) :-
    !.
                      
trouve_comparateur3(Ordre_couleurs, Pos, Pos_final1,
                    Comparateur_trouve, Comparateur) :-
    trouve_comparateur2(Ordre_couleurs, Pos, Pos_final1,
                        Comparateur_trouve, Comparateur).                     
        
        
comparateurs_compatibles(rien, Comparateur, Comparateur) :-
    !.
    
    % =
comparateurs_compatibles(=, '<', '<=') :-
    !.
     
comparateurs_compatibles(=, '<=', '<=') :-
    !.
    
comparateurs_compatibles(=, '>', '>=') :-
    !.    
    
comparateurs_compatibles(=, '>=', '>=') :-
    !.    
    
    % <        
comparateurs_compatibles(<, =, '<=') :-
    !.
    
comparateurs_compatibles(<, '<=', '<=') :-
    !.
    
    % <=   
comparateurs_compatibles('<=', =, '<=') :-
    !.  
    
comparateurs_compatibles('<=', <, '<=') :-
    !.  
           
   % >
comparateurs_compatibles(>, =, '>=') :-
    !.
    
comparateurs_compatibles(>, '>=', '>=') :-
    !.
    
   % >=
comparateurs_compatibles('>=', =, '>=') :-
    !.
    
comparateurs_compatibles('>=', >, '>=') :-
    !.

comparateurs_compatibles(Comparateur, Comparateur, Comparateur).
    

inverse_comparateur(=, =) :-
    !.
    
inverse_comparateur(<, >).
                  
                        
check_comparateur(Element, Comparateur, Comparateur) :-
    \+ member(Element, [rien, =, <]),
    !.
 
    % on avait '=' on trouve '<', ce dernier l'emporte
check_comparateur(=, <, <) :-
    !.
    
check_comparateur(<, =, <) :-
    !.
    
check_comparateur(rien, Comparateur, Comparateur) :-
    !. 
    
    % dans tous les autres cas on conserve le comparateur deja vu
check_comparateur(Comparateur_trouve, _Comparateur, Comparateur_trouve).
    
/* ============================ DIFFICULTE PARTIE =========================== */	

difficulte_partie(Solutions, Nb_cartes, Nb_solutions, Quantite_information) :-
    length(Solutions, N),
    divers:fac(Nb_cartes, F),
    Nb_solutions is F*N,
    Q is log(Nb_solutions)/log(2),
    divers:arrondit_float(Q, 100, Quantite_information).
   
/* ========================== SOLUTIONS POSSIBLES =========================== */

    % retourne les solutions avec les couleurs des cartes
solutions_couleurs(Ordre_couleurs, S, Max_value, Solutions_couleurs) :-
    liste:conserve_elements(Ordre_couleurs, [<, =], Operateurs),
    liste:elimine_elements(Ordre_couleurs, [<, =], Couleurs),
    solutions(Operateurs, S, Max_value, Solutions),
    ajoute_couleurs_solutions(Solutions, Couleurs, Solutions_couleurs).
   

    % retourne dans L toutes les possibilités d'additionner N nombres pour faire S
	% sachant que pour chaque nombre, la plus petite valeur est 1, et la plus 
	% grande Max_value.
	% S >= N >= 1
	% Operateurs contient les operateurs de precédence 
	% entre les valeurs des cartes
solutions(Operateurs, S, Max_value, Solutions) :-
    length(Operateurs, N),
    N1 is N+1,
	findall(Somme, uneSolution(Operateurs, S, N1, Max_value, Somme), Solutions).
 
	% il y a un nombre de plus que d'operateurs
uneSolution(Operateurs, S, N, Max_value, Somme) :-
	reverse_ops(Operateurs, Operateurs1),
	liste:liste_ordre_decroissant(Max_value, 1, Valeurs_possibles),
	somme(Operateurs1, S, N, Valeurs_possibles, Max_value, Somme1),
	reverse(Somme1, Somme).

	% premier nombre (le plus a droite sans inversion)
somme(Operateurs, S, N, Valeurs_possibles, Max_value, [V|Somme]) :-
		selectionne_valeur(Valeurs_possibles, S, N, Max_value, 
                           V, Valeurs_possibles1),	
		S1 is S-V,
        N1 is N-1,
        somme1(Operateurs, S1, N1, Valeurs_possibles1, V, Somme).


somme1([=], S, 1, ValeursPossibles, S, [S]) :-
    member(S, ValeursPossibles).

somme1([>], S, 1, ValeursPossibles, ValeurAvant, [V]) :-
    MaxValue is ValeurAvant-1,
    selectionne_valeur(ValeursPossibles, S, 1, MaxValue, 
                       V, _Valeurs_possibles1).

somme1([=|Operateurs], S, N, Valeurs_possibles, Valeur_avant, 
       [Valeur_avant|Somme]) :-
	S1 is S-Valeur_avant,		% valeur prise = Valeur_avant
	N1 is N-1,
	somme1(Operateurs, S1, N1, Valeurs_possibles, Valeur_avant, Somme).
	
somme1([>|Operateurs], S, N, Valeurs_possibles, Valeur_avant, [V|Somme]) :-
	Max_value is Valeur_avant-1,
	selectionne_valeur(Valeurs_possibles, S, N, Max_value, V, Valeurs_possibles1),
	N1 is N-1,
	S1 is S-V,
	somme1(Operateurs, S1, N1, Valeurs_possibles1, V, Somme).


selectionne_valeur([V|Valeurs_possibles], S, N, MaxValue, 
                    V, [V|Valeurs_possibles]) :-   
    Vmin is S - MaxValue*(N-1), % la sommes laissée au nombre suivant
								% doit etre inferieur à Max_value * (N-1)
	V < Vmin,
	!,
	fail.	

	% selectionne une valeur V parmi les valeurs possibles
selectionne_valeur([V|Valeurs_possibles], S, N, MaxValue, 
                    V, [V|Valeurs_possibles1]) :-
    V =< MaxValue,
 	Vmax is S-N+1,
	V =< Vmax,					% il faut laisser au minimum 1, 
	liste:retire_valeurs_superieures(Valeurs_possibles, V, 
	                                        Valeurs_possibles1).
	
selectionne_valeur([_V|Valeurs_possibles], S, N, Max_value, 
                   V, Valeurs_possibles1) :-
	selectionne_valeur(Valeurs_possibles, S, N, Max_value, 
                       V, Valeurs_possibles1).
                       
	
    % ajoute les couleurs aux solutions de valeurs		
ajoute_couleurs_solutions([], _Couleurs, []) :-
    !.	
    
ajoute_couleurs_solutions([Solution|Solutions], Couleurs, 
                          [Solution_couleurs|Solutions_couleurs]) :-
    ajoute_couleurs(Solution, Couleurs, Solution_couleurs),
    ajoute_couleurs_solutions(Solutions, Couleurs, Solutions_couleurs).
	
    % ajoute les couleurs a une solutions de valeurs	
ajoute_couleurs([], [], []) :-
    !.    
    
ajoute_couleurs([Valeur|Valeurs], [Couleur|Couleurs], 
                [c(Couleur, Valeur)|Cartes]) :-
    ajoute_couleurs(Valeurs, Couleurs, Cartes).   
 
 
ajoute_positions_solutions([], []) :-
    !.
    
ajoute_positions_solutions([Solution|Solutions], 
                           [Solution1|Solutions1]) :-
    ajoute_positions(Solution, Solution1),
    ajoute_positions_solutions(Solutions, Solutions1).   
    
    
ajoute_positions([], []) :-
    !.
    
ajoute_positions([c(Couleur, Valeur)|Cartes], 
                 [c(Couleur, Valeur, -1)|Cartes1]) :-
    ajoute_positions(Cartes, Cartes1).                
    
/* ==================== SOLUTIONS SANS ORDRE DES COULEURS =================== */

    % retourne dans L toutes les possibilités d'additionner N nombres pour faire S
	% sachant que pour chaque nombre, la plus petite valeur est 1, et la plus 
	% grande Max_value.
	% S >= N >= 1
distribuer_somme(S, 1, _Max_value, [[S]]) :-
    !.

    % S >= N >= 2    
distribuer_somme(S, N, Max_value, L) :-   
    N1 is N-1,		
	Smax is min(S-1, Max_value*N1),	 % somme max a distribuer sur N-1 nombres
								     % on peut distribuer au plus 10*n1 sur les n1
							         % nombres restant (en dehors du nombre actuel)
    Smin is max(N1, S-Max_value),    % somme min a distribuer sur N-1 nombres 
    reunion_distributions_somme(Smax, Smin, N1, Max_value, L1),
    Vmin is S-Smax,
	ajouter_elt_listes(Vmin, L1, L).
    

reunion_distributions_somme(S, S, N, Max_value,  [L]) :-
    !,
    distribuer_somme(S, N, Max_value, L).
       
reunion_distributions_somme(S, Smin, N, Max_value, [L1|L]) :-
    distribuer_somme(S, N, Max_value, L1),
    S1 is S-1,
    reunion_distributions_somme(S1, Smin, N, Max_value, L).
    
/* ================================ DIVERS ================================== */

reverse_ops([], []) :-
	!.

reverse_ops([=|Ops], Ops2) :-
	!,
	reverse_ops(Ops, Ops1),
	append(Ops1, [=] , Ops2).

reverse_ops([<|Ops], Ops2) :-
	reverse_ops(Ops, Ops1),
	append(Ops1, [>] , Ops2).
	

ajouter_elt_listes(_V, [], []) :-      
    !.

ajouter_elt_listes(V, [L|LL], LL1) :-
	liste:ajouter_elt(V, L, L1),
    V1 is V+1,
    ajouter_elt_listes(V1, LL, L2),
	append(L1, L2, LL1).
    
/* ================================= FIN LISTING ============================ */
