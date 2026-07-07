/* ============================== GERE DES CONTRAINTES ====================== */

:- module(
          contraintes, 
          [      
           get_contraintes/2,
           contraintes/2,
           regroupe_contraintes/3,
           traite_contraintes_exp/4,
           comp_ordre_couleurs/1
          ]
		 ).

:- use_module(library(clpfd)),
   use_module(library(lists)),
   use_module(bk_contraintes),
   use_module(liste),
   use_module(donnees_contraintes),
   use_module(operateurs),
   use_module(comparaisons),
   use_module(check_arguments),
   use_module(domaines).

/* =============== CHANGE VARIABLES PAR CONSTANTES DANS CONTRAINTE ========== */

% ----------
    % retourne l'ensemble des contraintes du CSP sous un format simplifie
get_contraintes(Cartes, Contraintes) :- 
    copy_term(Cartes, Cartes, Contraintes1),
    cartes_constantes(Cartes, Cartes_noms),  
    renomme_contraintes2(Contraintes1, Cartes, Cartes_noms, Contraintes2),
    vars_contraintes(Contraintes2, Contraintes3),
    simplifie_contraintes(Contraintes3, Contraintes4),
    traite_all_distinct(Contraintes4, Contraintes5),
    traduit_operateurs_couleurs(Contraintes5, Contraintes6),
    traite_contraintes_swi(Cartes, Contraintes6, Domaines, Contraintes7),
    Contraintes = [dom(Domaines)|Contraintes7].

% ----------
traite_contraintes_swi(Cartes, Contraintes, Domaines, Contraintes_out) :-
    regroupe_contraintes(Cartes, Contraintes, Contraintes1),
    simplifie_groupes_contraintes(Contraintes1, Contraintes2),
    simplifie_equivalences(Contraintes2, Contraintes3),
    domaines:isole_domaines(Contraintes3, Domaines, Contraintes4),
    variables_valeurs(Valeurs),
    simplifie_groupes_comparaisons(Contraintes4, Valeurs, Contraintes5),
    elimine_groupes_vides(Contraintes5, Contraintes6),
    traduit_ordre_couleurs(Contraintes6, Contraintes_out).

% ----------
traite_contraintes_exp(Cartes, Contraintes5, Domaines, Contraintes_out) :-
    regroupe_contraintes_exp(Cartes, Contraintes5, Domaines, Contraintes6),
    simplifie_groupes_contraintes(Contraintes6, Contraintes7),
    simplifie_equivalences(Contraintes7, Contraintes8),
    domaines:isole_domaines(Contraintes8, _Domaines_out, Contraintes9),
    variables_valeurs(Valeurs),
    simplifie_groupes_comparaisons(Contraintes9, Valeurs, Contraintes10),
    elimine_groupes_vides(Contraintes10, Contraintes11),
	Contraintes_out = Contraintes11.
    % traduit_ordre_couleurs(Contraintes11, Contraintes_out).

% ---------
traduit_operateurs_couleurs(Contraintes, Contraintes_out) :-
    traduit_operateurs_couleurs2(Contraintes, Contraintes_out).
    
% --------
traduit_operateurs_couleurs2([], []) :-
	!.
	
traduit_operateurs_couleurs2([((V1 = V2) #<==> Comp1 /\ _Comp2)|Contraintes],
							 [(V1 = V2) <=> Comp_out |Contraintes1]) :-		
	!,
	check_arguments:
        consts_vars_couleurs_impliquees(Comp1, [C1, C2]),
	Comp_out=..[=, C1, C2],
	traduit_operateurs_couleurs2(Contraintes, Contraintes1).	
	
traduit_operateurs_couleurs2(
							  [Comp_valeurs #<==> Comp_couleurs|Contraintes], 
							  [Comp_valeurs <=> Comp_couleurs1|Contraintes1]
							 ) :-
	comparaisons:comp_valeurs(Comp_valeurs),						
	!,
	simplifie_contrainte_equivalence(Comp_valeurs, Comp_couleurs, 
									 Comp_couleurs1),
	traduit_operateurs_couleurs2(Contraintes, Contraintes1).
	
traduit_operateurs_couleurs2(
							[Comp_couleurs #<==> Comp_valeurs|Contraintes], 
							Contraintes_out
							) :-					
	!,
	traduit_operateurs_couleurs2([Comp_valeurs #<==> Comp_couleurs|Contraintes],
								  Contraintes_out).
		
traduit_operateurs_couleurs2([Comp_couleurs|Contraintes], 
							 [Comp_couleurs1|Contraintes1]) :-
	comparaisons:comp_couleurs(Comp_couleurs),
	!,						
	traduit_operateur_couleurs_comp(Comp_couleurs, Comp_couleurs1),
	traduit_operateurs_couleurs2(Contraintes, Contraintes1).
	
traduit_operateurs_couleurs2([Contrainte|Contraintes], 
							 [Contrainte|Contraintes1]) :-
	traduit_operateurs_couleurs2(Contraintes, Contraintes1).

% ---------
	% pas une comparaison couleurs
traduit_operateur_couleurs_comp(Comp, Comp) :-
	  check_arguments:consts_vars_couleurs_impliquees(Comp, []),
	  !.
	
	% comparaison de 2 couleurs
traduit_operateur_couleurs_comp(Comp, Comp_out) :-
	  traduit_comp_les_couleurs(Comp, Comp_out).
		
    % ---
traduit_ordre_couleurs(Contraintes, Contraintes_out) :-
    traduit_ordre_couleurs2(Contraintes,  Contraintes_out).
    
% ----------
traduit_ordre_couleurs2([], []) :-
    !.
       
traduit_ordre_couleurs2([co(Contraintes)|Groupes], 
                         [co(Contraintes)|Groupes1]) :-
    !,                     
    traduit_ordre_couleurs2(Groupes, Groupes1).
      
traduit_ordre_couleurs2([Groupe|Groupes], [Groupe1|Groupes1]) :-
    traduit_groupe_couleurs(Groupe,  Groupe1),
    traduit_ordre_couleurs2(Groupes, Groupes1).
    
% ----------    
traduit_groupe_couleurs(co(Carte, Contraintes), 
                        co(Carte, Contraintes1)) :-
    !,     
    traduit_comp_couleurs(Contraintes, Contraintes1).    

traduit_groupe_couleurs(co(Carte1, Carte2, Contraintes), 
                        co(Carte1, Carte2, Contraintes1)) :-
    traduit_comp_couleurs(Contraintes,  Contraintes1).
    
% ---------
traduit_comp_couleurs([],  []) :-
    !.
    
    % pas de couleurs impliquees
traduit_comp_couleurs([Comp|Comps], [Comp|Comps1]) :-
    check_arguments:
        consts_vars_couleurs_impliquees(Comp, []),
    !,
    traduit_comp_couleurs(Comps, Comps1).
    
    % couleurs impliquees   
traduit_comp_couleurs([Comp|Comps],  [Comp1|Comps1]) :-
    traduit_comp_les_couleurs(Comp, Comp1),
    traduit_comp_couleurs(Comps, Comps1).
    
% ---------       
traduit_comp_les_couleurs(Comp_valeurs <=> Comp_couleurs, 
                          Comp_valeurs <=> Comp_couleurs1) :-
    comp_valeurs(Comp_valeurs),
    !,
    traduit_comp_les_couleurs(Comp_couleurs, Comp_couleurs1).
    
traduit_comp_les_couleurs(Comp_couleurs <=> Comp_valeurs, 
                          Equivalence) :-
    !,                      
    traduit_comp_les_couleurs(Comp_valeurs <=> Comp_couleurs, Equivalence).
 
traduit_comp_les_couleurs(C1 \= C2, C1 \= C2) :-
    !. 
 
traduit_comp_les_couleurs(C1 < C2, C1 avant C2) :-
    !.
    
traduit_comp_les_couleurs(C1 =< C2, C1 avant_meme_rang C2) :-
    !.
    
traduit_comp_les_couleurs(C1 = C2, C1 meme_rang C2).
        
% ---------
simplifie_groupes_comparaisons([], _Valeurs, []) :-
    !.
    
simplifie_groupes_comparaisons([Groupe|Groupes], Valeurs, [Groupe1|Groupes1]) :-
    simplifie_un_groupe_comparaisons(Groupe, Valeurs, Groupe1),
    simplifie_groupes_comparaisons(Groupes, Valeurs, Groupes1).
       
% ---------    
simplifie_un_groupe_comparaisons(co(Contraintes), _Valeurs, co(Contraintes)) :-
 !.  
    
simplifie_un_groupe_comparaisons(co(Carte, Contraintes), _Valeurs,
                                 co(Carte, Contraintes1)) :-
    !,
    simplifie_comp(Contraintes, Contraintes1).

simplifie_un_groupe_comparaisons(co(Carte1, Carte2, Contraintes), Valeurs, 
                                 co(Carte1, Carte2, Contraintes1)) :-
    compare_comparaisons(Contraintes, Valeurs, Contraintes1).

% ---------
compare_comparaisons([], _Valeurs, []) :-
    !.
   
compare_comparaisons([Comp], _Valeurs, [Comp]) :-
    !.

   % comparaison comprenant uniquement des valeurs
compare_comparaisons([Comp|Contraintes], Valeurs, Contraintes_out) :-
    comp_valeurs(Comp),
    !,
    check_comp_valeurs_inutiles(Contraintes, Comp, Contraintes1),
    compare_comparaisons(Contraintes1, Valeurs, Contraintes_out).
    
   % par uniquement des valeurs impliquees 
compare_comparaisons([Comp|Contraintes], Valeurs, [Comp|Contraintes_out]) :-
    compare_comparaisons(Contraintes, Valeurs, Contraintes_out).
  
% ----------    
comp_ordre_couleurs(Comp) :-
	Comp=..[Op, C1, C2],
    member(Op, [avant, avant_meme_rang, meme_rang]),
    (donnees_contraintes:type_couleur(C1) ; 
     donnees_contraintes:type_couleur(C2)),
    !.
    
% ---------
    % Comp1 est utile
check_comp_valeurs_inutiles([], _Comp1, []) :-
    !.
    
check_comp_valeurs_inutiles([Comp|Contraintes], Comp1, 
                            [Comp2|Contraintes]) :-
    garde_comp(Comp, Comp1, Comp2),
    !.
    
check_comp_valeurs_inutiles([Comp|Contraintes], Comp1, 
                            [Comp|Contraintes1]) :-
    check_comp_valeurs_inutiles(Contraintes, Comp1, Contraintes1).
    
% ----------
garde_comp(V1 < V2, V1 \= V2, V1 < V2) :-
    !.
    
garde_comp(V1 < V2, V2 \= V1, V1 < V2) :-
    !.
    
garde_comp(V1 \= V2, V1 < V2, V1 < V2) :-
    !.
    
garde_comp(V1 \= V2, V2 < V1, V2 < V1).
 
% ---------
simplifie_les_comparaisons(Contraintes, Domaines, Contraintes1) :-
    simplifie_les_comparaisons2(Contraintes, Domaines, Contraintes1).
                                   
% ----------                            
simplifie_les_comparaisons2([], _Domaines, []) :-
    !.

simplifie_les_comparaisons2([Comp|Contraintes], Domaines, Contraintes1) :-
    est_comparaison(Comp, Op),
    comparaison_superflue(Comp, Op, Domaines),
    nl,
    writeln('!!!'),
    write(Comp),
    writeln(' est superflue'),
    !,
    simplifie_les_comparaisons2(Contraintes, Domaines, Contraintes1).
                                   
simplifie_les_comparaisons2([Contrainte|Contraintes], Domaines, 
                            [Contrainte|Contraintes1]) :-
    simplifie_les_comparaisons2(Contraintes, Domaines, Contraintes1).
  
% ---------
  % retire les comparaisons inutiles
simplifie_comp([], []) :-
    !.
    
simplifie_comp([Comp|Comps], Comps1) :-
    comp_inutile(Comp),
    !,
    simplifie_comp(Comps, Comps1).
    
simplifie_comp([Comp|Comps], [Comp|Comps1]) :-
    simplifie_comp(Comps, Comps1).
     
% ---------
comp_inutile(X =< X) :-
    !.
    
comp_inutile(X >= X) :-
    !.
    
comp_inutile(X = X).
        
% ---------
est_comparaison(Contrainte, Op) :-
    functor(Contrainte, Op, 2),
    member(Op, [<, =<, = , \=]),
    !.                              % ! evite retour sur member
    
% --------
    % la comparaison est superflue si les variables impliquees
    % ont des domaines 
comparaison_superflue(Comp, Op, Domaines) :- 
    check_arguments:
        variables_impliquees(Comp, [V1, V2]),
    get_domaine_valeur(Domaines, V1, Domaine1),
    get_domaine_valeur(Domaines, V2, Domaine2),
    compare_domaines(Op, Domaine1, Domaine2).
    
% ---------
compare_domaines(Op, Domaine1, Domaine2) :-
    min_member(Min1, Domaine1),
    max_member(Max1, Domaine1),
    min_member(Min2, Domaine2),
    max_member(Max2, Domaine2),
    compare_domaines2(Op, Min1, Max1, Min2, Max2).
    
% ---------
compare_domaines2(<, _Min1, Max1, Min2, _Max2) :-
    Max1 < Min2,
    !.
    
compare_domaines2(=<, _Min1, Max1, Min2, _Max2) :-
    Max1 =< Min2,
    !.
    
    % vrai si les deux domaines n'ont pas d'intersection
compare_domaines2(\=, Min1, Max1, Min2, Max2) :-
    (
      compare_domaines2(<, Min1, Max1, Min2, Max2) ;
      compare_domaines2(<, Min2, Max2, Min1, Max1)
    ),
    !.
    
% ----------
get_domaine_valeur([], _V, _Domaine) :-
    !,
    fail.
    
get_domaine_valeur([V in Domaine|_Domaines], V, Domaine) :-
    !.
    
 get_domaine_valeur([_Domaine|Domaines], V, Domaine) :-
    get_domaine_valeur(Domaines, V, Domaine).
       
% ----------
traite_all_distinct(Contraintes, Contraintes_out) :-
    select(all_distinct(Vars), Contraintes, Contraintes1),
    !,
    retire_entiers(Vars, Vars1),
    traduit_vars_distinct(Vars1, New_contraintes),
    append(New_contraintes, Contraintes1, Contraintes_out).
    
traite_all_distinct(Contraintes, Contraintes).
    
% ----------
traduit_vars_distinct([], []) :-
    !.
    
traduit_vars_distinct([_Var], []) :-
    !.
    
traduit_vars_distinct([Var|Vars], Distincts_out) :-
    traduit_distinct_var(Vars, Var, Distincts),
    traduit_vars_distinct(Vars, Distincts1),
    append(Distincts, Distincts1, Distincts_out).

% ----------
traduit_distinct_var([], _Var1, []) :-
    !.
    
traduit_distinct_var([Var|Vars], Var1, [Var1 \= Var|Distincts]) :-
    traduit_distinct_var(Vars, Var1, Distincts).
    
% ----------
retire_entiers([], []) :-
    !.
    
retire_entiers([E|L], L1) :-
    integer(E),
    !,
    retire_entiers(L, L1).
    
retire_entiers([X|L], [X|L1]) :-
    retire_entiers(L, L1).    

% ----------
simplifie_groupes_carte_unique([], _Domaines, []) :-
    !.

simplifie_groupes_carte_unique([co(Carte, Groupe)|Groupes], Domaines, 
                               [co(Carte, Groupe1)|Groupes1]) :-
    !,
    Carte = c(_Position, _Couleur, Valeur),
    get_domaine_valeur_carte(Domaines, Valeur, Domaine),
    simplifie_groupe(Groupe, Carte, Domaine, Groupe1),
    simplifie_groupes_carte_unique(Groupes, Domaines, Groupes1).

simplifie_groupes_carte_unique([Groupe|Groupes], Domaines, 
                               [Groupe|Groupes1]) :-
    simplifie_groupes_carte_unique(Groupes, Domaines, Groupes1).


% ----------
get_domaine_valeur_carte([], _Valeur,  []) :-
    !.

get_domaine_valeur_carte([Valeur in Domaine|_Domaines], Valeur, Domaine) :-
   !.

get_domaine_valeur_carte([_Domaine|Domaines], Valeur, Domaine) :-
   get_domaine_valeur_carte(Domaines, Valeur, Domaine).

% ----------
simplifie_groupe([], _Carte, _Domaine_valeur, []) :-
    !.

simplifie_groupe([Contrainte|Groupe], Carte, Domaine, Groupe1) :-
    get_comp_valeur(Contrainte, Comp_valeur),
    valeur_hors_domaine(Comp_valeur, Domaine),
    !,
    simplifie_groupe(Groupe, Carte, Domaine, Groupe1).

simplifie_groupe([Contrainte|Groupe], Carte, Domaine, [Contrainte|Groupe1]) :-
    simplifie_groupe(Groupe, Carte, Domaine, Groupe1).
   
% ----------
valeur_hors_domaine(Comparaison, Domaine) :-
    Comparaison=..[Op, A, B],
    min_member(Min, Domaine),
    max_member(Max, Domaine),
    (
        place_entier(A, B, gauche) 
            -> hors_domaine(Op, A, Min, Max)
            ;  hors_domaine(Op, B, Min, Max)
    ).
                
%------ ---
place_entier(A, _B, gauche) :-
    integer(A),
    !.

place_entier(_A, _B, droite).

% ----------
dans_domaine(V, Min, Max) :-
    V >= Min,
    V =< Max.

% ----------
hors_domaine(=, V, Min, Max) :-
     \+ dans_domaine(V, Min, Max).
     
hors_domaine(<, V, Min, Max) :-
     V1 is V-1,
     \+ dans_domaine(V1, Min, Max).
    
% ----------
get_comp_valeur(A <=> _B, A) :-
    comparaison_valeurs(A),
    !.

get_comp_valeur(_A <=> B, B) :-
    comparaison_valeurs(B).

% ----------
comparaison_valeurs(Comparaison) :-
    Comparaison=..[Op, X, Y],
    member(Op, [<, =<, =]),
    (integer(X) ; integer(Y)),
    !.

% ----------
elimine_groupes_vides([], []) :-
    !.

elimine_groupes_vides([Groupe|Groupes], Groupes1) :-
    groupe_vide(Groupe),
    !,
    elimine_groupes_vides(Groupes, Groupes1).

elimine_groupes_vides([Groupe|Groupes], [Groupe|Groupes1]) :-
    elimine_groupes_vides(Groupes, Groupes1).

% ----------
groupe_vide(co([])) :-
    !.

groupe_vide(co(_Carte, [])) :-
    !.

groupe_vide(co(_Carte1, _Carte2, [])).

% ----------
simplifie_equivalences([], []) :-
    !.
    
simplifie_equivalences([Groupe|Groupes], [Groupe1|Groupes1]) :-
    simplifie_groupe_equivalences(Groupe, Groupe1),
    simplifie_equivalences(Groupes, Groupes1).
    
% ----------
    % contraintes sur plus de 2 cartes
simplifie_groupe_equivalences(co(Contraintes), co(Contraintes)) :-
    !.
    
    % contrainte sur une Carte
simplifie_groupe_equivalences(co(Carte, Contraintes), 
                              co(Carte, Contraintes1)) :-
    !,
    simplifie_groupe_equivalences2(Contraintes, Contraintes1).
    
    % sur deux cartes
simplifie_groupe_equivalences(co(Carte1, Carte2, Contraintes), 
                              co(Carte1, Carte2, Contraintes1)) :-
    simplifie_groupe_equivalences2(Contraintes, Contraintes1).
 
% ------------
    % recherche les equivalences liant les valeurs et couleurs
    % pour les simplifier
simplifie_groupe_equivalences2([], []) :-
	!.
	
simplifie_groupe_equivalences2([Comp_valeurs #<==> Comp_couleurs|Contraintes], 
                           	   [Comp_couleursA <=> Comp_valeursB|Contraintes1]) :-
                           	   
    comp_valeurs(Comp_valeurs),      
    check_comparaison_valeurs(Comp_valeurs, Comp_valeursA),
    !,
	simplifie_contrainte_equivalence(Comp_valeursA, Comp_couleurs, 
	                                 Comp_couleursA),
    check_terme(Comp_valeursA, Comp_valeursB),
	simplifie_groupe_equivalences2(Contraintes, Contraintes1).
	
simplifie_groupe_equivalences2([Comp_couleurs #<==> Comp_valeurs|Contraintes], 
                                Contraintes1) :-                          
    comp_couleurs(Comp_couleurs),
	simplifie_groupe_equivalences2([Comp_valeurs #<==> Comp_couleurs|Contraintes],
								    Contraintes1).
    % T1 n'est pas une comparaison
    % contrainte inutile aucune valeur n'apparaissant (!!! a verifier !!!)
simplifie_groupe_equivalences2([_T1 #<==> _T|Contraintes], Contraintes1) :-   
	simplifie_groupe_equivalences2(Contraintes, Contraintes1).

simplifie_groupe_equivalences2([Contrainte|Contraintes], 
                               [Contrainte|Contraintes1]) :-
	simplifie_groupe_equivalences2(Contraintes, Contraintes1).

% ---------
    % verifie si T est une comparaison de valeurs avec un integer
    % ex) 3 < V1
check_comparaison_valeurs(T, T_out) :-
    T =..[=<, A, B],
    !,
    (
        integer(A) 
        -> 
            A1 is A-1,
            T_out=..[<, A1, B] 
        ;
        (
            integer(B) 
            ->
              B1 is B+1,
              T_out=..[<, A, B1]
            ;
              T_out=T
        )
      ).
      
check_comparaison_valeurs(T, T) :-
    functor(T, Op, _Arity),
    member(Op, [<, =]),
    !.
    
% ---------
check_terme(T, TA) :-
    T =..[Op, Arg1, Arg2],
    integer(Arg1),
    !,
    inverse_operandes(Op, Arg1, Arg2, TA).

check_terme(T, T).

% ---------
inverse_operandes(=, Arg1, Arg2, Arg2 = Arg1) :-
	!.
	
inverse_operandes(<, Arg1, Arg2, Arg2 > Arg1) :-
	!.
	
inverse_operandes(=<, Arg1, Arg2, Arg2 > Arg1) :-
	!.
	
inverse_operandes(>, Arg1, Arg2, Arg2 =< Arg1) :-
	!.
	
inverse_operandes(>=, Arg1, Arg2, Arg2 < Arg1).
	    
% ---------
	% V1 < V2 <=> terme(C1, C2) devient C1 < C2 <=> V1 < V2, etc..
	% V1 et V2 sont des variables de valeur v0, v1 etc...
	% C1 et C2 des variables de couleurs c0, c1 et...
	
	% on recupere les variables de couleurs et ecrit la contrainte equivalente
simplifie_contrainte_equivalence(Comp_valeurs, Comp_couleurs, 
                                 Comp_couleurs_out) :-
    Comp_valeurs=..[Op_valeur, _V1, _V2],
    check_comp_couleurs(Comp_couleurs, Op_valeur, Comp_couleurs_out).
  
% ---------
check_comp_couleurs(Comp_couleurs, Op_valeur, Comp_couleurs_out) :-
    
    check_arguments:
        vars_couleurs_impliquees(Comp_couleurs,  Vars_c),
    check_arguments:
        constantes_couleurs_impliquees(Comp_couleurs, Consts_c),  
    traite_comparaison_couleurs2(Comp_couleurs, Op_valeur, Vars_c, Consts_c, 
                                 Comp_couleurs_out).

% ---------
traite_comparaison_couleurs2(_Comp_couleurs, =, [C1, C2], [], 
							 C1 = C2) :-
	!.
	
traite_comparaison_couleurs2(_Comp_couleurs, =, [C], [V], 
							 C = V) :-
	!.

    % 2 variables couleurs
traite_comparaison_couleurs2(Comp_couleurs, Op, [C1, C2], [], 
							 Comp_couleurs_out) :-
    !,
    (
    	Comp_couleurs=..[_Op_couleurs, _Arg, C2-C1] 
    	-> 
    		Comp_couleurs_out =..[Op, C1, C2]
    	;
    		Comp_couleurs_out =..[Op, C2, C1]
    ).
    
    
    % 1 couleur et une valeur
traite_comparaison_couleurs2(Comp_couleurs, Op, [C], [V], 
							 Comp_couleurs_out) :-
    !,
    (
    	Comp_couleurs=..[_Op_couleurs, _Arg, C-V] 
    	-> 
    		Comp_couleurs_out =..[Op, V, C]
    	;
    		Comp_couleurs_out =..[Op, C, V]
    ).
 
% ---------
	% reecrit la comparaison en plaçant Var comme element unique
	% d'un cote de la comparaison
	
	% Var est dans Arg1
reecrit_comp(Op_valeur, Arg1, Vars_couleurs, Var_couleur, Couleur, Comp) :-
	couleurs_impliquees(Arg1, Vars_couleurs, [Var_couleur]),
	Comp=..[Op_valeur, Var_couleur, Couleur].
	
	% Var est dans Arg2
reecrit_comp(Op_valeur, _Arg1, _Vars, Var_couleur, Couleur, Comp) :-
	Comp=..[Op_valeur, Var_couleur, Couleur].
		
% ---------
simplifie_groupes_contraintes([], []) :-
    !.
    
simplifie_groupes_contraintes([Groupe|Groupes], [Groupe1|Groupes1]) :-
    simplifie_groupe_contraintes(Groupe, Groupe1),
    simplifie_groupes_contraintes(Groupes, Groupes1).
    
    % ---
    % contraintes sur plus de 2 cartes
simplifie_groupe_contraintes(co(Contraintes), co(Contraintes)) :-
    !.
    
    % contrainte sur Carte
simplifie_groupe_contraintes(co(Carte, Contraintes), 
                             co(Carte, Contraintes)) :-
    !. 
    
    % sur sur Carte1 et Carte2
simplifie_groupe_contraintes(co(Carte1, Carte2, Contraintes), 
                             co(Carte1, Carte2, Contraintes1)) :-
    simplifie_sup_inf(Contraintes, Contraintes1).
    
    % ---
    % X < Y et X \= Y ---> X < Y
    % X < Y et X =< Y ---> X < Y
    
simplifie_sup_inf([], []) :-
    !.

simplifie_sup_inf([Comparaison|Contraintes], [Comp_final|Contraintes_out]) :-
    Comparaison=..[Comp,_Arg1,_Arg2],
    comparateur(Comp),
    !,
    simplifie_sup_inf2(Contraintes, Comparaison, [Comp_final|Contraintes1]),
    simplifie_sup_inf(Contraintes1, Contraintes_out).
    
simplifie_sup_inf([Contrainte|Contraintes], [Contrainte|Contraintes_out]) :-
        simplifie_sup_inf(Contraintes, Contraintes_out).
        
    % ---
simplifie_sup_inf2([], Compare, [Compare]) :-
    !.
    
simplifie_sup_inf2([Compare1|Contraintes], Compare, Contraintes_out) :-
    simplifie_comparaisons(Compare, Compare1, Compare2),
    !,
    simplifie_sup_inf2(Contraintes, Compare2, Contraintes_out).
    
simplifie_sup_inf2([Contrainte|Contraintes], Compare, 
                   [Contrainte|Contraintes_out]) :-
    simplifie_sup_inf2(Contraintes, Compare, Contraintes_out).
    
% ----------
simplifie_comparaisons(Comp1, Comp2, Comp) :-
    Comp1=..[Op1, X, Y],
    Comp2=..[Op2, X, Y],
    !,
    simplifie_comp(Op1, Op2, Op),
    Comp=..[Op, X, Y].
    
simplifie_comparaisons(Comp1, Comp2, Comp) :-
    Comp1=..[Op1, X, Y],
    Comp2=..[Op2, Y, X],
    !,
    inverse_op(Op2, Op3),               % X Op3 Y a la place de Y Op2 X
    simplifie_comp(Op1, Op3, Op),
    Comp=..[Op, X, Y].
      
% ----------             
simplifie_comp(=, >=, =) :-
    !.
    
simplifie_comp(=, >=, =) :-
    !.
        
simplifie_comp(<, =<, <) :-
    !.
    
simplifie_comp(<, \=, <) :-
    !.
    
simplifie_comp(=<, <, <) :-
    !.
    
simplifie_comp(=<, \=, <) :-
    !.
    
simplifie_comp(=<, =, =) :-
    !.
    
simplifie_comp(\=, <, <) :-
    !.
    
simplifie_comp(\=, =<, <) :-
    !.
    
simplifie_comp(=, =<, =).
    
% ----------
comparateur(<) :-
    !.
    
comparateur(=<) :-
    !.
    
comparateur(=) :-
    !.
    
comparateur(\=).  
  
% ----------  
est_var_couleur(Couleur) :-
    variables_couleurs(Couleurs),
    member(Couleur, Couleurs).
    
est_var_valeur(Valeur) :-
    variables_valeurs(Valeurs),
    member(Valeur, Valeurs).
       
% ----------
simplifie_contraintes(Contraintes, Contraintes_out) :-
    retire_listes(Contraintes, Contraintes1),
    numbervars(Contraintes1, 0, _End, [attvar(bind)]),
    retire_diezes(Contraintes1, Contraintes2),
    sup_vers_inf(Contraintes2, Contraintes3),
    inf_egal_vers_inf(Contraintes3, Contraintes4),
    simplifie_in(Contraintes4, Contraintes5),
    sort(Contraintes5, Contraintes6),
    simplifie_contraintes_booleennes(Contraintes6, Contraintes7),
    ordonne_contraintes(Contraintes7, Contraintes8), 
    reecrit_operations_booleennes(Contraintes8, Contraintes9),
    domaines_vers_listes(Contraintes9, Contraintes10),
    evalue_operations(Contraintes10, Contraintes11),
    ecrit_couleurs(Contraintes11, Contraintes_out).
    
% ----------
    % convertit chaque domaine en une liste de valeurs
domaines_vers_listes([], []) :-
    !.
    
domaines_vers_listes([Contrainte|Contraintes], [Contrainte1|Contraintes1]) :-
    domaine_vers_liste(Contrainte, Contrainte1),
    domaines_vers_listes(Contraintes, Contraintes1).

    % convertit le domaine de la contrainte en une liste
domaine_vers_liste(in(A,Domaine), in(A, Liste)) :-
    !,
    dom_integers(Domaine, Liste).
    
domaine_vers_liste(Contrainte, Contrainte).
    
% ----------
    % change les operations arithmetiques impliquant des entiers
    % par leur resultat
evalue_operations([], []) :-
    !.
    
evalue_operations([Contrainte|Contraintes], [Contrainte1|Contraintes1]) :-
    evalue_operations_contrainte(Contrainte, Contrainte1),
    evalue_operations(Contraintes, Contraintes1).

% ----------
evalue_operations_contrainte(A, A) :-
    atom(A),
    !.
     
evalue_operations_contrainte(Contrainte, Contrainte_out) :-
    Contrainte =..[Op, _A, _B],
    member(Op, [+,*]),                      % operation commutative
    !,
    traite_operation_commutative(Op, Contrainte, Contrainte_out).
      
evalue_operations_contrainte(Contrainte, Contrainte_out) :-
    Contrainte =..[Op, A, B],
    !,
    evalue_operations_contrainte(A, X),
    evalue_operations_contrainte(B, Y),
    evalue(X, Op, Y, Contrainte_out).
     
evalue_operations_contrainte(Contrainte, Contrainte).

% ----------
traite_operation_commutative(Op, Contrainte, Contrainte_out) :-
    regroupe_entiers_gauche(Contrainte, Op, Gauche, Droite),
    evalue_liste(Gauche, Op, Valeur_gauche),
    !,
    construit_contraintes_droite(Droite, Op, Contrainte_droite),
    construit_contrainte(Op, Valeur_gauche, Contrainte_droite, Contrainte_out).
    
traite_operation_commutative(Op, Contrainte, Contrainte_out) :-
    Contrainte =..[Op, A, B],
    !,
    evalue_operations_contrainte(A, X),
    evalue_operations_contrainte(B, Y),
    evalue(X, Op, Y, Contrainte_out).

% ---------    
construit_contrainte(_Op, Valeur, [], Valeur) :-
    !.  

construit_contrainte(+, 0, Droite, Droite) :-
    !.
    
construit_contrainte(*, 1, Droite, Droite) :-
    !.
    
construit_contrainte(Op, Gauche, Droite, Contrainte) :-
    Contrainte =..[Op, Gauche, Droite].
    
% ---------
    % retourne la somme, la multiplication, ou la soutraction de tous les 
    % elements de L
evalue_liste(L, +, S) :-
    !,
    sum_list(L, S).
    
evalue_liste(L, -, -S) :-
    !,
    sum_list(L, S).
    
evalue_liste([], *, 1) :-
    !.
    
evalue_liste([0|_L], *, 0) :-
    !.
    
evalue_liste([X|L], *, M) :-
    evalue_liste(L, *, M1),
    M is X * M1.
 
% ----------
construit_contraintes_droite([X], _Op, X) :-
    !.    

construit_contraintes_droite([X,Y], Op, Contrainte) :-
    !,
    Contrainte =..[Op, X, Y].
    
construit_contraintes_droite([X,Y|L], +, X+Y+Contrainte1) :-
    construit_contraintes_droite(L, +, Contrainte1).
        
% ----------
    % regroupe a gauche les entiers d'une operation compose du meme operateur
    % ex) a+b+2+c+1 ---> 2+1+a+b+c 
regroupe_entiers_gauche(E, _Op, [E], []) :-
    integer(E),
    !.

regroupe_entiers_gauche(A, _Op, [], [A]) :-
    atom(A),
    !.
    
regroupe_entiers_gauche(Contrainte, Op, Gauche, Droite) :-
    Contrainte=..[Op, A, B],
    regroupe_entiers_gauche(A, Op, Entiers_a, Reste_a),
    regroupe_entiers_gauche(B, Op, Entiers_b, Reste_b),
    append(Reste_a, Reste_b, Droite),
    append(Entiers_a, Entiers_b, Gauche). 

% ---------- 
    % evalue l'operation X op Y si X et Y sont des entiers
evalue(X, Op, Y, Z) :-
    member(Op, [+,-,*]),
    integer(X),
    integer(Y),
    !,
    evalue2(X, Op, Y, Z).
    
evalue(X, Op, Y, Z) :-
    Z =..[Op, X, Y].
    
% ----------    
    % evalue l'operation
evalue2(X, + , Y, Z) :-
    !,
    Z is X+Y.
    
evalue2(X, - , Y, Z) :-
    !,
    Z is X-Y.
    
evalue2(X, * , Y, Z) :-
    Z is X*Y.
  
% ---------
    % rassemble les contraintes par carte ou couple de cartes
regroupe_contraintes(Cartes, Contraintes, Contraintes_out) :-
    build_cartes_simples(Cartes, Cartes_simples),
    regroupe_contraintes2(Cartes_simples, Contraintes, Contraintes_out).

  % rassemble les contraintes par carte ou couple de cartes
regroupe_contraintes_exp(Cartes, Contraintes, Domaines, Contraintes_out) :-
    build_cartes_simples_domaines(Cartes, Domaines, Cartes_simples),
    regroupe_contraintes2(Cartes_simples, Contraintes, Contraintes_out).

% ---------
regroupe_contraintes2(Cartes_simples, Contraintes, 
                      [co(Reste1)|Contraintes1]) :-
    regroupe_contraintes_cartes_seules(Cartes_simples, Contraintes, 
                                       Contraintes_cartes_seules, Reste),
    get_couples_cartes(Cartes_simples, Couples),
    regroupe_contraintes_couples(Couples, Reste, Contraintes_couples_cartes, 
                                 Reste1),
    append(Contraintes_cartes_seules, Contraintes_couples_cartes, Contraintes1).
 
% ---------
  % regroupe toutes les contraintes par carte 
  % (une seule carte est implique dans les contraintes
regroupe_contraintes_cartes_seules([], Reste,  [], Reste) :-
    !.
    
regroupe_contraintes_cartes_seules(
                            [Carte|Cartes], Contraintes, 
                            [co(Carte, Contraintes_carte)|Contraintes_cartes],
                            Reste) :-                     
    regroupe_contraintes_une_carte(Contraintes, Carte, 
                                   Contraintes_carte, Reste1),
                                   
    regroupe_contraintes_cartes_seules(Cartes, Reste1, 
                                       Contraintes_cartes, Reste).
  
% ----------
    % regroupe les contraintes impliquant uniquement Carte
regroupe_contraintes_une_carte([], _Carte,  [], []) :-
    !.
    
regroupe_contraintes_une_carte([Contrainte|Contraintes], 
                               c(Position, Couleur, Valeur),  
                               [Contrainte|Contraintes_carte], Reste) :-
    carte_impliquee(Contrainte, Couleur, Valeur),
    !,
    regroupe_contraintes_une_carte(Contraintes, c(Position, Couleur, Valeur), 
                                   Contraintes_carte, Reste).
                                   
regroupe_contraintes_une_carte([Contrainte|Contraintes], Carte, 
                                Contraintes_carte, [Contrainte|Reste]) :-
    regroupe_contraintes_une_carte(Contraintes, Carte, 
                                   Contraintes_carte, Reste).
    
% ----------
     % retourne les variables de couleurs (c0, ...,c4) et de
     % valeurs (v0,..,c4) impliquees dans la contrainte
    
carte_impliquee(Contrainte, Couleur, Valeur) :-
    (
     check_arguments:variables_impliquees(Contrainte, [Couleur], [Valeur]) ;
     check_arguments:variables_impliquees(Contrainte, [Couleur], []) ;
     check_arguments:variables_impliquees(Contrainte, [], [Valeur]) 
     ),
     !.

    % ---
check_couleur(C, C).
    
    % ---
check_valeur(V, V).    
          

% -------------------- REGROUPE CONTRAINTES COUPLES CARTES ---------------------   
  
regroupe_contraintes_couples([], Reste, [], Reste) :-
    !.
    
regroupe_contraintes_couples(
                         [cp(C1, C2)|Couples], Contraintes, 
                         [co(C1, C2, Contraintes_couple)|Contraintes_couples], 
                         Reste) :-                    
    regroupe_contraintes_un_couple(Contraintes, cp(C1, C2),  
                                   Contraintes_couple, Reste1),
    regroupe_contraintes_couples(Couples, Reste1, 
                                 Contraintes_couples, Reste).
    

    % ---
    % recupere toutes les contraintes faisant reference au
    % couple de cartes Carte1 et Carte2
regroupe_contraintes_un_couple([], _Couple, [], []) :-
    !.

regroupe_contraintes_un_couple([Contrainte|Contraintes], Couple,  
                               [Contrainte|Contraintes_couple],
                               Reste) :-                              
    implique_couple_cartes(Contrainte, Couple),
    !,
    regroupe_contraintes_un_couple(Contraintes, Couple, 
                                  Contraintes_couple, Reste).
                                
regroupe_contraintes_un_couple([Contrainte|Contraintes], Couple,  
                                Contraintes_couple, [Contrainte|Reste]) :-
    regroupe_contraintes_un_couple(Contraintes, Couple, 
                                   Contraintes_couple, Reste).
                       
    % ---
    % verifie si la contrainte concerne uniquement le couple de cartes C1 et C2
implique_couple_cartes(Contrainte, cp(Carte1, Carte2)):-
    check_variables_impliquees(Contrainte, Carte1, Carte2).
  
  
check_variables_impliquees(Contrainte, 
                           c(_P1, C1, V1), c(_P2, C2, V2)) :-  
    check_arguments:variables_impliquees(Contrainte, 
                                       Couleurs_contrainte, Valeurs_contrainte),
    check_couple_implique(C1, C2, V1, V2, 
                           Couleurs_contrainte, Valeurs_contrainte).
    
    % ---
    % des couleurs sont dans la contrainte et pas dans le couple
check_couple_implique(C1, C2,  V1, V2,  
                      Couleurs_contrainte, Valeurs_contrainte) :- 
    subtract(Couleurs_contrainte, [C1,C2], []),
    subtract(Valeurs_contrainte, [V1,V2], []),
                            % aucune valeur ou couleur hors couple
    check_couple(C1, C2, V1, V2, Couleurs_contrainte, Valeurs_contrainte).
    

    
    % les couleurs et valeurs dans la contrainte sont dans le couple
    % la contrainte doit impliquer les 2 cartes par les couleurs et/ou valeurs
    % les deux couleurs du couple sont impliquees dans Contrainte
 check_couple(C1, C2, _V1, _V2, Couleurs_contrainte, _Valeurs_contrainte) :-
    egales([C1,C2], Couleurs_contrainte),
    !.
    
    % les deux valeurs du couple sont impliquees
 check_couple(_C1, _C2, V1, V2, _Couleurs_contrainte, Valeurs_contrainte) :-
    egales([V1,V2], Valeurs_contrainte),
    !.
    
    % une couleur et une valeur du couple sont impliquees
check_couple(C1, C2, V1, V2, Couleurs_contrainte, Valeurs_contrainte) :-
    subset([C1,C2], Couleurs_contrainte),
    subset([V1,V2], Valeurs_contrainte).
    

% --------- 
    %creer des cartes de constantes c(0, c0, v0), etc...
build_cartes_simples([], []) :-
    !.
    
build_cartes_simples([c(Position, _, _)|Cartes], 
                   [c(Position, Couleur, Valeur)|Cartes1]) :-
    atom_concat(c, Position, Couleur),
    atom_concat(v, Position, Valeur),
    build_cartes_simples(Cartes, Cartes1).

% ---------
    % creer des cartes de constantes c(0, c0, v0), etc...
build_cartes_simples_domaines([], _Domaines, []) :-
    !.
    
build_cartes_simples_domaines([c(Position, _, _)|Cartes], Domaines, 
                             [Carte1|Cartes1]) :-
    select(c(Position, Domaine_couleurs, Domaine_valeurs), Domaines, Domaines1),
    atom_concat(c, Position, Couleur),
    atom_concat(v, Position, Valeur),
    build_carte(Position, Couleur, Valeur, Domaine_couleurs, Domaine_valeurs,
                Carte1),
    build_cartes_simples_domaines(Cartes, Domaines1, Cartes1).
   
% ---------
build_carte(Position, _Couleur1, _Valeur1, [Couleur], [Valeur],
            c(Position, Couleur, Valeur)) :-
    !.

build_carte(Position, _Couleur1, Valeur, [Couleur], _Domaine_valeurs,
            c(Position, Couleur, Valeur)) :-
    !.

build_carte(Position, Couleur, _Valeur1, _Domaines_couleurs, [Valeur],
            c(Position, Couleur, Valeur)) :-
    !.

build_carte(Position, Couleur, Valeur, _Domaines_couleurs, _Domaines_valeurs,
            c(Position, Couleur, Valeur)).
   
% ---------
get_couples_cartes(Cartes, Couples_cartes) :-
    ordonne_cartes(Cartes, Cartes1),
    get_couples_cartes2(Cartes1, Couples_cartes).

% ---------
    % constitue tous les couples possibles avec les cartes  
get_couples_cartes2([_Carte], []) :-
    !.
  
get_couples_cartes2([Carte|Cartes], Couples) :-
    creer_couples(Cartes, Carte, Couples1),
    get_couples_cartes2(Cartes, Couples2),
    append(Couples1, Couples2, Couples).

% ---------
creer_couples([], _Carte, []) :-
    !.

creer_couples([Carte|Cartes], Carte1, [cp(Carte1, Carte)|Couples]) :-
    creer_couples(Cartes, Carte1, Couples).

% ---------
    % ordonne les cartes selon leur positions
ordonne_cartes(Cartes, Cartes1) :-
    sort(1,@<, Cartes, Cartes1).
  

   % ---
cree_couples([], []) :-
    !.
    
cree_couples([Position|Positions], Couples) :-
    position_couples(Positions, Position, Couples1),
    cree_couples(Positions, Couples2),
    append(Couples1, Couples2, Couples).
    
    % ---
position_couples([], _Postion, []) :-
    !.
    
position_couples([Position1|Positions], Position, 
                  [cp(Carte, Carte1)|Couples]) :-
   creer_carte(Position, Carte),
   creer_carte(Position1, Carte1),
   position_couples(Positions, Position, Couples).               


creer_carte(Position, c(Position, Couleur, Valeur)) :-
    atom_concat(c, Position, Couleur),
    atom_concat(v, Position, Valeur).
    
    % ---    
get_positions([], []) :-
    !.
    
get_positions([c(Position,_,_) |Cartes], [Position|Positions]) :-
    get_positions(Cartes, Positions).
      
  
      
    % ---
    % on remplace les numeros des couleurs par leur nom    
ecrit_couleurs([], []) :-
    !.

    %
ecrit_couleurs([Contrainte|Contraintes], 
               [Contrainte1|Contraintes1]) :-                       
    ecrit_couleurs_contrainte(Contrainte, Contrainte1),
    !,
    ecrit_couleurs(Contraintes, Contraintes1).
    

    %---
ecrit_couleurs_contrainte(N, Couleur) :-
    integer(N),
    get_couleur(N, Couleur),
    !.
    
  % terme compose
ecrit_couleurs_contrainte(Contrainte, Contrainte1) :-
    Contrainte=..[Op, Arg1, Arg2],
    !,
    ecrit_couleurs_contrainte(Arg1, ArgA),
    ecrit_couleurs_contrainte(Arg2, ArgB),
    Contrainte1=..[Op, ArgA, ArgB].
    
ecrit_couleurs_contrainte(Contrainte, Contrainte).
 
% ----------
    % on elimine les comparaisons a domaine booleen (0..1)
reecrit_operations_booleennes([], []) :-
    !.

    %
reecrit_operations_booleennes([Contrainte|Contraintes], 
                              [Contrainte1|Contraintes1]) :-                       
    reecrit(Contrainte, Contrainte1),
    !,
    reecrit_operations_booleennes(Contraintes, Contraintes1).
 
 
   % ---
reecrit(Contrainte, Contrainte1) :-
    Contrainte=..[Op, Arg1, Arg2],
    !,
    reecrit(Arg1, ArgA),
    reecrit(Arg2, ArgB),
    compose_expression(Op, ArgA, ArgB, Contrainte1).
    
reecrit(Contrainte, Contrainte).
    

    % ---
compose_expression(<==>, A, B, Exp) :-
    atom_concat(A, equivalent, A1),
    atom_concat(A1, B, Exp).
    
compose_expression(Op, A, B, Exp) :-
    Exp=..[Op, A, B].

        
    % ---
    % on elimine les comparaisons a domaine booleen (0..1)
simplifie_contraintes_booleennes([], []) :-
    !.

    %
simplifie_contraintes_booleennes([Contrainte|Contraintes], Contraintes1) :-
    comparaison_booleenne(Contrainte),
    !,
    simplifie_contraintes_booleennes(Contraintes, Contraintes1).
    
simplifie_contraintes_booleennes([Contrainte|Contraintes], 
                                 [Contrainte|Contraintes1]) :-
    simplifie_contraintes_booleennes(Contraintes, Contraintes1).
    
    % ---
comparaison_booleenne(Contrainte) :-
    Contrainte=..[in, Arg, 0..1],
    comparaison(Arg).
    
    % verifie s'il s'agit d'une comparaison
comparaison(Term) :-
    functor(Term, Name, _Arity),
    member(Name, [<, =<, >, >=, =]).
    
    
    % ---
simplifie_in([], []) :-
    !.
    
    % elimine les contraintes de la forme X-Y in Domaine
simplifie_in([Contrainte|Contraintes], Contraintes1) :-
    Contrainte=..[in, _X-_Y, _Arg],
    !,
    simplifie_in(Contraintes, Contraintes1).

simplifie_in([Contrainte|Contraintes], [Contrainte1|Contraintes1]) :-
    simplifie_in_contrainte(Contrainte, Contrainte1),
    simplifie_in(Contraintes, Contraintes1).
    
    % ---

simplifie_in_contrainte(Contrainte, ArgA in ArgB) :-
    Contrainte=..[in, Arg1, Arg2],
    check_args_in(Arg1, Arg2, ArgA, ArgB),
    !.

simplifie_in_contrainte(Contrainte, Contrainte).

    % ---
check_args_in(X, Deb..Fin, X1, Deb1..Fin1) :-
    (X = X1+1 ; X=1+X1),
    Deb1 is Deb-1,
    Fin1 is Fin-1.
    
    % ---
    % ordonne les contraintes en fonction du nombre de constantes qu'elles ont
ordonne_contraintes(Contraintes, Contraintes_out) :-
    dependances_constantes(Contraintes, Contraintes1),
    sort(3, @=<, Contraintes1, Contraintes2),
    retire_constantes(Contraintes2, Contraintes_out).
    
    % ---
retire_constantes([], []) :-
    !.
    
retire_constantes([co(Contrainte, _Consts, _N)|Contraintes],
                  [Contrainte|Contraintes1]) :-
   retire_constantes(Contraintes, Contraintes1).          
                  

    % ---
    % associe chaque contrainte au constantes qu'elle contient    
dependances_constantes(Contraintes, Contraintes_out) :-
    variables_couleurs_valeurs(Constantes),
    dependances_constantes2(Contraintes, Constantes, Contraintes_out).
    
    % ---
dependances_constantes2([], _Constantes, []) :-
    !.
    
dependances_constantes2([Contrainte|Contraintes], Constantes, 
                        [Contrainte1|Contraintes1]) :-
    dependances_constantes_contrainte(Contrainte, Constantes, Contrainte1),
    dependances_constantes2(Contraintes, Constantes, Contraintes1).
    
    % ---
dependances_constantes_contrainte(Contrainte, Constantes, 
                                  co(Contrainte, Consts, N)) :-
    get_constantes_contrainte(Contrainte, Constantes, Consts),
    sort(Consts, Consts1),
    length(Consts1, N).
    
    %---
    % constante trouve
get_constantes_contrainte(Const, Constantes, [Const]) :-
    member(Const, Constantes),
    !.
    
    % terme compose 1 argument
get_constantes_contrainte(Contrainte, Constantes, Consts) :-
    Contrainte=..[_Op, Arg],
    !,
    get_constantes_contrainte(Arg, Constantes, Consts).
    
    % terme compose 2 arguments
get_constantes_contrainte(Contrainte, Constantes, Consts) :-
    Contrainte=..[_Op, Arg1, Arg2],
    !,
    get_constantes_contrainte(Arg1, Constantes, Consts1),
    get_constantes_contrainte(Arg2, Constantes, Consts2),
    append(Consts1, Consts2, Consts).
    
    % autre terme
get_constantes_contrainte(_Contrainte, _Constantes, []).

    % ---
    % les relations x+1 =< y des equivalences sont reecrites x < y
inf_egal_vers_inf([], []) :-
    !.
    
inf_egal_vers_inf([Contrainte|Contraintes], [Contrainte1|Contraintes1]) :-
    inf_egal_vers_inf_contrainte(Contrainte, Contrainte1),
    inf_egal_vers_inf(Contraintes, Contraintes1).
  
% ----------    
inf_egal_vers_inf_contrainte(Comp_couleurs #<==> Comp_valeurs , Contrainte) :-
    comparaisons:comp_couleurs(Comp_couleurs),
    !,
    inf_egal_vers_inf_contrainte(Comp_valeurs #<==> Comp_couleurs , Contrainte).

    % aucune constante valeur dans V1 =< V2
inf_egal_vers_inf_contrainte(V1 =< V2 #<==> Comp_couleurs, 
                             Va < V2 #<==> Comp_couleurs) :-
    check_arguments:constantes_valeurs_impliquees(V1, []),
    check_arguments:constantes_valeurs_impliquees(V2, []),
    Va is V1 -1,
    !.

    % constante valeur dans V1
inf_egal_vers_inf_contrainte(V1 =< V2 #<==> Comp_couleurs, 
                             Va < V2 #<==> Comp_couleurs) :-

    check_arguments:constantes_valeurs_impliquees(V2, []),
    !,
    decremente_exp_valeur(V1, Va).

    % constante valeur dans V2
inf_egal_vers_inf_contrainte(V1 =< V2 #<==> Comp_couleurs, 
                             V1 < Va #<==> Comp_couleurs) :-
    check_arguments:constantes_valeurs_impliquees(V1, []),
    !,
    incremente_exp_valeur(V2, Va).

inf_egal_vers_inf_contrainte(Contrainte, Contrainte).

% ----------
    % Exp contient une valeur qu'il faut incrementer
incremente_exp_valeur(Valeur, Valeur1) :-
    number(Valeur),
    !,
    Valeur1 is Valeur+1.

incremente_exp_valeur(Atom, Atom) :-
    atom(Atom),
    !.

incremente_exp_valeur(Exp, Exp_out) :-
   Exp =..[Op, Arg1, Arg2],
   !,
   incremente_exp_valeur(Arg1, Arga),
   incremente_exp_valeur(Arg2, Argb),
   check_arg_nul(Op, Arga, Argb, Exp_out).

% ----------
    % Exp contient une valeur qu'il faut decrementer
decremente_exp_valeur(Valeur, Valeur1) :-
    number(Valeur),
    !,
    Valeur1 is Valeur-1.

decremente_exp_valeur(Atom, Atom) :-
    atom(Atom),
    !.

decremente_exp_valeur(Exp, Exp_out) :-
   Exp =..[Op, Arg1, Arg2],
   !,
   decremente_exp_valeur(Arg1, Arga),
   decremente_exp_valeur(Arg2, Argb),
   check_arg_nul(Op, Arga, Argb, Exp_out).

% ----------
check_arg_nul(_Op, 0, Argb, Argb) :-
    !.

check_arg_nul(_Op, Arga, 0, Arga) :-
    !.

check_arg_nul(Op, Arga, Argb, Exp_out) :-
    Exp_out =..[Op, Arga, Argb].
    
% ----------
    % retire # des operateurs dans les contraintes
 retire_diezes([], []) :-
    !.
    
 retire_diezes([Contrainte|Contraintes], [Contrainte1|Contraintes1]) :-
    retire_diezes_contrainte(Contrainte, Contrainte1),
    retire_diezes(Contraintes, Contraintes1).
    
    
    % ---
    % retire les diezes de Contrainte
    % variable
retire_diezes_contrainte(Contrainte, Contrainte) :-    
    var(Contrainte),
    !.

    % terme compose
retire_diezes_contrainte(Contrainte, Contrainte1) :-    
    Contrainte=..[Op, Arg1, Arg2],
    !,
    retire_dieze_operateur(Op, Op1),
    retire_diezes_contrainte(Arg1, ArgA),
    retire_diezes_contrainte(Arg2, ArgB),
    Contrainte1=..[Op1, ArgA, ArgB].
    
    % constante simple
retire_diezes_contrainte(Contrainte, Contrainte).    
    
    
    % ---
    % exception pour l'equivalence
retire_dieze_operateur(#<==>, #<==>) :-
    !.
    
retire_dieze_operateur(Op, Op1) :-
    atom_concat(#, Op1, Op),
    !.
    
retire_dieze_operateur(Op, Op).


    % ---
    % les relations > et >= sont reecrites en < et <=
sup_vers_inf([], []) :-
    !.
    
sup_vers_inf([Contrainte|Contraintes], [Contrainte1|Contraintes1]) :-
    sup_vers_inf_contrainte(Contrainte, Contrainte1),
    sup_vers_inf(Contraintes, Contraintes1).

    % ---
sup_vers_inf_contrainte(Contrainte, Contrainte1) :-
    Contrainte=..[>, Arg1, Arg2],
    Contrainte1=..[<, Arg2, Arg1],
    !.    
    
sup_vers_inf_contrainte(Contrainte, Contrainte1) :-
    Contrainte=..[>=, Arg1, Arg2],
    Contrainte1=..[=<, Arg2, Arg1],
    !.
  
    % terme compose
sup_vers_inf_contrainte(Contrainte, Contrainte1) :-
    Contrainte=..[Op, Arg1, Arg2],
    !,
    sup_vers_inf_contrainte(Arg1, ArgA),
    sup_vers_inf_contrainte(Arg2, ArgB),
    Contrainte1=..[Op, ArgA, ArgB].
    
    % terme simple
sup_vers_inf_contrainte(Contrainte, Contrainte).
    
    
    % ---
    % remplace toutes les variables des contraintes par leur equivalent
    % en termes de co,...c4 (couleurs) et v0,...v4 (valeurs)
vars_contraintes(Contraintes, Contraintes_out) :-
    retrouve_variables(Contraintes, Contraintes_vars),
    reduit_contraintes_equivalence(Contraintes_vars, Contraintes_vars2),
    vars_contraintes2(Contraintes_vars2, Contraintes_out).
    

    % ---
reduit_contraintes_equivalence(Contraintes, Contraintes_out) :-
    get_contraintes_equivalence(Contraintes, Contraintes_eq, Reste),
    reduit_contraintes_eq(Contraintes_eq, Contraintes_eq1, Vars_supprimees),
    supprime_domaines_variables_supprimees(Reste, Vars_supprimees, Reste1),
    append(Contraintes_eq1, Reste1, Contraintes_out).


supprime_domaines_variables_supprimees([], _Vars_supprimees, _Contraintes_out) :-
    !.

supprime_domaines_variables_supprimees([co(V in _Domaine, _Vars)|Contraintes], 
                                       Vars_supprimees, 
                                       Contraintes_out) :-
    var(V),
    liste:strict_member(V, Vars_supprimees),
    !,
    supprime_domaines_variables_supprimees(Contraintes, Vars_supprimees, 
                                           Contraintes_out).

supprime_domaines_variables_supprimees([Contrainte|Contraintes], 
                                       Vars_supprimees, 
                                       [Contrainte|Contraintes_out]) :-
        supprime_domaines_variables_supprimees(Contraintes, Vars_supprimees, 
                                               Contraintes_out).
    

    % ---
    % les contraintes de la forme A1 <=> B, A2 <==> B, ..., An <=> B
    % sont fusionnees en A1 <==> A2 ... <=> An
reduit_contraintes_eq([], [], []) :-
    !.

reduit_contraintes_eq([co(A #<==> Var, Vars)|Contraintes], 
                      [Contrainte_fus|Contraintes1],
                      [Var|Vars_supprimes]) :-  
    var(Var),
    !,
    get_contraintes_meme_var(Contraintes, Var, Contraintes_meme_var, Reste),
    fusionne_contraintes([co(A #<==> Var, Vars)| Contraintes_meme_var], 
                         Contrainte_fus),
    reduit_contraintes_eq(Reste, Contraintes1, Vars_supprimes).
    
reduit_contraintes_eq([Contrainte|Contraintes], [Contrainte|Contraintes1], 
                      Vars_supprimes) :-                  
  reduit_contraintes_eq(Contraintes, Contraintes1, Vars_supprimes).
                
    
    % ---
    % contrainte unique pas de fusion
fusionne_contraintes([Contrainte], Contrainte) :-
    !.

fusionne_contraintes(Contraintes, co(Fusion, Variables1)) :-
    recupere_parties_gauches(Contraintes, Parties_gauches, Variables),
    liste:retire_doublons_variables(Variables, Variables1),
    fusionne_equivalences(Parties_gauches, Fusion).


    % ---
fusionne_equivalences([A], A) :-
    !.

fusionne_equivalences([A|L], A #<==> F) :-
    fusionne_equivalences(L, F).

    % ---
recupere_parties_gauches([], [], []) :-
    !.

recupere_parties_gauches([co(A #<==> Var, Vars1)|Contraintes], 
                         [A|Parties_gauches], Variables_out) :-
    liste:strict_select(Var, Vars1, Vars),
    recupere_parties_gauches(Contraintes, Parties_gauches, Variables),
    append(Vars, Variables, Variables_out).

    % ---
get_contraintes_meme_var([], _Var, [], []) :-
    !. 

get_contraintes_meme_var([co(A #<==> Var1,Vars)| Contraintes], Var, 
                         [co(A #<==> Var, Vars)|Contraintes_meme_var], Reste) :-
    Var1 == Var,
    !,
    get_contraintes_meme_var(Contraintes, Var, Contraintes_meme_var, Reste).

get_contraintes_meme_var([Contrainte|Contraintes], Var, 
                         Contraintes_meme_var, [Contrainte|Reste]) :-
    get_contraintes_meme_var(Contraintes, Var, Contraintes_meme_var, Reste).
    

    % ---
    % selectionne dans Contraintes les contraintes de forme A #<==> B
get_contraintes_equivalence([], [], []) :-
    !.

get_contraintes_equivalence([Contrainte|Contraintes], 
                            [Contrainte|Contraintes_eq],
                            Autres_contraintes) :-
    contrainte_equivalence(Contrainte),
    !,
    get_contraintes_equivalence(Contraintes, Contraintes_eq, Autres_contraintes).

get_contraintes_equivalence([Contrainte|Contraintes], 
                            Contraintes_eq,
                            [Contrainte|Autres_contraintes]) :-
        get_contraintes_equivalence(Contraintes, Contraintes_eq, 
                                    Autres_contraintes).

    % ---
contrainte_equivalence(co(Contrainte, _Vars)) :-
    Contrainte =..[#<==> |_Args].


vars_contraintes2(Contraintes_out, Contraintes_out) :-
    plus_de_variable(Contraintes_out),
    !.
    
vars_contraintes2(Contraintes, Contraintes_out) :-
    recherche_definitions_vars(Contraintes, Contraintes1, Definitions),
    (
      Definitions == [] 
      -> 
        Contraintes_out = Contraintes
      ;
        remplace_variables(Definitions, Contraintes1, Contraintes2),
        vars_contraintes2(Contraintes2, Contraintes_out)
    ).
    

    % ---
plus_de_variable([]) :-
    !.
    
plus_de_variable([co(_Contrainte, []) |Contraintes]) :-
    plus_de_variable(Contraintes).
    

retire_listes([], []) :-
    !.
    
retire_listes([co(Contrainte, _L)|Contraintes], 
                 [Contrainte|Contraintes1]) :-        
    retire_listes(Contraintes, Contraintes1). 
   
   
retire_longueurs([], []) :-
    !.
    
retire_longueurs([co(Contrainte, Vars, _N)|Contraintes], 
                 [co(Contrainte,Vars)|Contraintes1]) :-        
    retire_longueurs(Contraintes, Contraintes1). 

    % ---
    % associe a chaque contrainte son nombre de variables
nb_vars([], []) :-
    !.
    
nb_vars([co(Contrainte, Vars)|Contraintes], 
        [co(Contrainte, Vars, Nb_vars)|Contraintes1]) :-
        length(Vars, Nb_vars),
        nb_vars(Contraintes, Contraintes1).
        
    % ---
    % remplace les variables dans Contraintes par leurs definitions
remplace_variables([], Contraintes, Contraintes) :-
    !.
    
 remplace_variables([Definition|Definitions], Contraintes, Contraintes2) :-
    remplace_une_variable(Contraintes, Definition, Contraintes1),
    remplace_variables(Definitions, Contraintes1, Contraintes2).
  
  
    % ---
    % remplace Var par sa Definition dans Contraintes
remplace_une_variable([], _Definition, []) :-
    !.
    
remplace_une_variable([co(Contrainte, Vars) |Contraintes], 
                      d(Definition, Var), 
                      [co(Contrainte1, Vars1)|Contraintes1]) :-      
    liste:strict_member(Var, Vars),
    !,
    liste:strict_select(Var, Vars, Vars1),
    remplace_variable_par_def(Contrainte, Definition, Var, Contrainte1),
    remplace_une_variable(Contraintes, d(Definition, Var), Contraintes1).
    
remplace_une_variable([Contrainte|Contraintes], Definition, 
                      [Contrainte|Contraintes1]) :-
    remplace_une_variable(Contraintes, Definition, Contraintes1).
    
    %---
    % remplace l'occurrence de Var dans Contrainte et la remplace par Def
remplace_variable_par_def(Contrainte, Definition, Var, Contrainte1) :-
    Definition =..[_Op, Var, Exp],
    remplace_var(Contrainte, Var, Exp, Contrainte1).
    
    
    % Dans Exp1 remplace Var par Exp 
    % Var pas la
remplace_var(Exp1, _Var, _Exp, Exp1) :-
    ground(Exp1),
    !.

    % Var trouve
remplace_var(Var1, Var, Exp, Exp) :-
    Var1 == Var,
    !.
    
    % autre variable
remplace_var(Var1, _Var, _Exp, Var1) :-
    var(Var1),
    !.    

    % L est une liste
remplace_var(L, Var, Exp, Exp2) :-
    L =..['[|]', E, LArgs],
    !,
    remplace_var(E, Var, Exp, E1),
    remplace_var(LArgs, Var, Exp, LArgs1),
    Exp2=..['[|]', E1, LArgs1].
    

    % Exp1 motif compose
remplace_var(Exp1, Var, Exp, Exp2) :-
    Exp1 =..[Op|LArgs],
    remplace_var(LArgs, Var, Exp, LArgs1),
    Exp2 =..[Op|LArgs1].
    
  
recherche_definitions_vars([], [], []) :-
    !.

    % contrainte sans variable
recherche_definitions_vars([co(Contrainte, [])|Contraintes], 
                           [co(Contrainte, [])|Contraintes1], 
                           Definitions) :-
    !,
    recherche_definitions_vars(Contraintes, 
                               Contraintes1, 
                               Definitions).
 
    
    % contrainte avec une variable
recherche_definitions_vars([co(Contrainte, [Var]) |Contraintes], 
                           Contraintes1, 
                           [d(Def, Var)|Definitions]) :-
    retrouve_definition(Contrainte, Var, Def),
    !,
    recherche_definitions_vars(Contraintes, 
                               Contraintes1, 
                               Definitions).
    
    
    % contrainte avec plusieurs variables ou 1 variable mais pas definition
recherche_definitions_vars([Contrainte|Contraintes], 
                           [Contrainte|Contraintes1], 
                           Definitions) :-
    !,
    recherche_definitions_vars(Contraintes, 
                               Contraintes1, 
                               Definitions).
    
    
    % ---
    % retrouve l'expression definissant Var dans Contrainte
retrouve_definition(Contrainte, Var, Def) :-
   Contrainte=..[Op, Partie_gauche, Partie_droite],
   member(Op, [#=, #\=, #<==>]),
   !,
   (
    var_dans_expression(Partie_gauche, Var, Exp)
        -> 
            construit_def(Var, Op, Partie_droite, Exp, Def)
        ;
            var_dans_expression(Partie_droite, Var, Exp),
            construit_def(Var, Op, Partie_gauche, Exp, Def)
    ).
    
    
construit_def(Var, Op, Partie_opposee, vide, Def) :-
    !, 
    Def =..[Op, Var, Partie_opposee].
    
construit_def(Var, Op, Partie_opposee, Exp, Def) :-
      Def =..[Op, Var, Partie_opposee-Exp].

       
    % recherche Var dans Exp
var_dans_expression(Exp, _Var, _Exp1) :-
    ground(Exp),
    !,
    fail.
    
var_dans_expression(Var1, Var, vide) :-
    Var == Var1,
    !.
    
    % Exp est une liste
var_dans_expression(Exp, Var, Exp1) :-
    Exp=..['[|]', Head, Args],
    !,
    (var_dans_expression(Head, Var, Exp1) ; 
     var_dans_expression(Args, Var, Exp1)),
    !.                          % enleve point de choix de la disjonction
    
    % Exp est un operateur binaire
var_dans_expression(Exp, Var, Exp1) :-
    Exp=..[+, Var1, Exp1],
    Var1 == Var,
    !.
       

    %---    
    % recherche les contraintes avec une variable hors c0,..,c4 
    % et v0,...,v4

retrouve_variables([], []) :-
    !.

retrouve_variables([Contrainte|Contraintes], [co(Contrainte, Vars) |
                                              Contraintes_vars]) :-
    contient_variables(Contrainte, Vars),
    retrouve_variables(Contraintes, Contraintes_vars).
   

    % analyse la contrainte et verifie si elle contient un unique variable Var
contient_variables(T, []) :-
    ground(T),
    !.

contient_variables(V, [V]) :-
    var(V),
    !.

contient_variables(L, Vars) :-
    is_list(L),
    !,
    liste_contient_variables(L, Vars).
    
    % term compose
contient_variables(Term, Vars) :-
    Term =.. [_Functor|Args],             
    contient_variables(Args, Vars).  


    % recherche si le Term contient une unique variable
liste_contient_variables([], []) :-
    !.
    
liste_contient_variables([Term|Terms], Vars) :-
    contient_variables(Term, Vars1),
    liste_contient_variables(Terms, Vars2),
    append(Vars1, Vars2, Vars).
   

 % ---
renomme_contraintes2([], _Terme, _Noms, []) :-
    !.
    
renomme_contraintes2([Contrainte|Contraintes], Cartes, Cartes_noms, 
                    [Contrainte1|Contraintes1]):-
  traite_une_contrainte(Contrainte, Cartes, Cartes_noms, Contrainte1),
    renomme_contraintes2(Contraintes, Cartes, Cartes_noms, Contraintes1).
    
traite_une_contrainte(clpfd:(Contrainte), Cartes, Cartes_noms, Contrainte1) :-
    term_variables(Contrainte, Variables_contraintes),
    dans_terme(Cartes, Variables_contraintes, Cartes1),  
        % Cartes1 contient les cartes ayant des variables communes
        % avec Contrainte
    renomme_contrainte(Contrainte, Cartes1, Cartes_noms, Contrainte1).
   
    % ---
    % renomme les variables de Contrainte en utilisant Noms
renomme_contrainte(Contrainte,  Cartes, Cartes_noms, Contrainte1) :-
    get_noms(Cartes, Cartes_noms, Cartes_noms1),
    retrouve_noms_variables(Cartes, Cartes_noms1, Substitutions),
    substituer_terme(Contrainte, Substitutions, Contrainte1).
    
% Applique les substitutions dans le terme
    
substituer_terme(Term, _Substitutions, Term) :-
                % term instancite
    ground(Term),
    !.

        % variable qui apparait dans une substitution
substituer_terme(Var, Substitutions, Const) :-
    var(Var),
    get_const(Substitutions, Var, Const),
    !.
    
        % variable qui n'apparait pas dans substitutions
        % variable de travail cree par le solveur de contraintes de swi
substituer_terme(Var, _Substitutions, Var) :-
    var(Var),
    !.   
    
substituer_terme(L, Substitutions, Term_const) :-
    is_list(L),
    !,
    substituer_termes_liste(L, Substitutions, Term_const).
    
    % term compose
substituer_terme(Term, Substitutions, Term_const) :-
    Term =.. [Functor|Args],               
    substituer_terme(Args, Substitutions, Args_const),  
    % enleve_dieze(Functor, Functor1),
    Term_const =.. [Functor|Args_const].    


substituer_termes_liste([], _Substitutions, []) :-
    !.
    
substituer_termes_liste([Term|Terms], Substitutions, 
                       [Term_const|Liste_consts]) :-
    substituer_terme(Term, Substitutions, Term_const),
    substituer_termes_liste(Terms, Substitutions, Liste_consts).


    % ---  
get_const([], _V, _C) :-
    !,
    fail.
    
get_const([X=C|_Substitutions], V, C) :-
    X==V,
    !.
    
get_const([_Sub|Substitutions], V, C) :-
    get_const(Substitutions, V, C).
    
 
    % ---
retrouve_noms_variables([], _Cartes_noms, []) :-
    !.

retrouve_noms_variables([c(Position, C, V)|Cartes], Cartes_noms, 
                        [C=Nc, V=Nv|Noms_variables]) :-
    select(c(Position, Nc, Nv), Cartes_noms, Cartes_noms1),
    retrouve_noms_variables(Cartes, Cartes_noms1, Noms_variables).
                           
   % retrouve dans 
get_noms([], _Cartes_noms, []) :-
    !.
    
get_noms([c(Position, _Valeur, _Couleur)|Cartes], Cartes_noms,
         [c(Position, Val, Coul)|Cartes_out]) :-
    select(c(Position, Val, Coul), Cartes_noms, Cartes_noms1),
    get_noms(Cartes, Cartes_noms1, Cartes_out).
    
    % ---
    % ramene tous les atomes contenant
    % au moins une variable de Variables
dans_terme([], _Variables, []) :-
    !.
    
dans_terme([Atom|LAtoms], Variables, [Atom|LAtoms1]) :-
    term_variables(Atom, LVars),
    variable_commune(LVars, Variables),
    !,
    dans_terme(LAtoms, Variables, LAtoms1).
    
dans_terme([_Atom|LAtoms], Variables, LAtoms1) :-
    dans_terme(LAtoms, Variables, LAtoms1).
    
   
    % ---
    % vrai si une variable de Vars est dans Vars1
variable_commune([], _Vars1) :-
    !,
    fail.
    
 variable_commune([X|_Vars], Vars1) :-
    strict_member(X, Vars1),
    !.
 
variable_commune([_X|Vars], Vars1) :-
    variable_commune(Vars, Vars1).
    

/* =============================== CONTRAINTES ============================== */

% Générer dynamiquement des paires nommées et capturer les contraintes
contraintes(Cartes, Contraintes) :-
    noms_variables(Cartes, Noms_vars),  
    copy_term(Noms_vars, _, Contraintes).

% Générer des paires nommées Nom-Variable dynamiquement
cartes_constantes([], []) :-
    !.
    
cartes_constantes([c(Position, _Couleur, _Valeur)|Cartes], 
                  [c(Position, Nom_couleur, Nom_valeur) |Cartes1]) :-     
    running_game:carte(Position, nom(Nom_couleur, Nom_valeur)), 
    cartes_constantes(Cartes, Cartes1).
    

    % retourne toutes les contraintes associees aux variables de Terme
contraintes2(Terme, Contraintes) :-
    term_variables(Terme, Vars),
    copy_term(Vars, Vars, Contraintes).


    % ---
    % si un groupe contient A comparaison B et une equivalence
    %  E1 <=> A comparaison2 B, et que 
    % A comparaison2 B,  incompatible avec A comparaison B
    % alors on retire l'equivalence
    
simplifie_comparaisons_equivalences([], []) :-
    !.

    % contrainte porte sur toutes les cartes
simplifie_comparaisons_equivalences([co(Contraintes)|Groupes], 
                                    [co(Contraintes)|Groupes1]) :-
    !,
    simplifie_comparaisons_equivalences(Groupes, Groupes1).
    
simplifie_comparaisons_equivalences([Groupe|Groupes], [Groupe1|Groupes1]) :-
    comparaisons_equivalences(Groupe, Groupe1),                                
    !,
    simplifie_comparaisons_equivalences(Groupes, Groupes1).
        
        
    % ---        
comparaisons_equivalences(co(Carte, Contraintes), co(Carte, Contraintes1)) :-
    !,
    comp_equivalence(Contraintes, Contraintes1).
    
comparaisons_equivalences(co(Carte1, Carte2, Contraintes), 
                          co(Carte1, Carte2, Contraintes1)) :-
    comp_equivalence(Contraintes, Contraintes1).
    
    
    % ---
comp_equivalence(Contraintes, [Comp|Contraintes_out]) :-
    select_comp(Contraintes, Comp, Contraintes1),
    !,
    check_equivalences(Comp, Contraintes1, Contraintes_out).
    
comp_equivalence(Contraintes, Contraintes).


    % ---
    % recherche une comparaison
select_comp([], rien, []) :-
    !,
    fail.
    
select_comp([Comp|Contraintes], Comp, Contraintes) :-
    functor(Comp, Op, _Arity),
    member(Op, [<, =<]),
    !.
    
select_comp([Contrainte|Contraintes], Comp, [Contrainte|Contraintes1]) :-
    select_comp(Contraintes, Comp, Contraintes1).

/* ================================= DIVERS ================================= */

% ----------
/*
dom_integers(D, Is) :- 
	phrase(dom_integers_(D), Is).

dom_integers_(I)      --> { integer(I) }, [I].
dom_integers_(L..U)   --> { numlist(L, U, Is) }, Is.
dom_integers_(D1\/D2) --> dom_integers_(D1), dom_integers_(D2).
*/
    
/* ============================== FIN LISTING =============================== */
