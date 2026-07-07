/* ======================= CONTRAINTES VERS REDUCTIONS ====================== */ 
/*                  une reduction est confrontee a une contrainte             */       
/*                  ce qui peut apporter une nouvelle reduction               */
/*                  c0 a ete reduit, la contrainte c0 \c1 peut aboutir        */
/*                  a une reduction du domaine de c1                          */
/* ========================================================================== */

:- module(
          contraintes_reductions, 
          [
            contraintes_vers_reductions/5,
            contrainte_vers_reduction/5
          ]
		 ).
		 
:-   
   use_module(library(clpfd)),
   use_module(liste),
   use_module(domaines),
   use_module(donnees_contraintes),
   use_module(utilitaires),
   use_module(operateurs),
   use_module(ajout_suppression_contraintes).

% ---------
    % retourne les Reductions engendrees par les Contraintes
    % les Domaines sont modifies
contraintes_vers_reductions([], Domaines, Domaines, [], []) :-  
    !.
    
contraintes_vers_reductions([Contrainte|Contraintes], Domaines, 
                            Domaines_out, Reductions, Explications) :-                  
    contrainte_vers_reduction(Contrainte, Domaines, Domaines1, Reductions1, 
							 Expli),
    contraintes_vers_reductions(Contraintes, Domaines1, 
                                Domaines_out, Reductions2, Exps1),
    append(Reductions1, Reductions2, Reductions),
	append(Expli, Exps1, Explications).

% ----------
    % addition de 2 variables 
contrainte_vers_reduction(Var1 + Var2 = Valeur, Domaines, Domaines_out, 
                          Reductions, Exps) :-                 
    donnees_contraintes:variable(Var1),
    donnees_contraintes:variable(Var2),
    !,

    select(Var1 in Domaine1, Domaines, DomainesA),  
    min_list(Domaine1, Min1),
    max_list(Domaine1, Max1), 
    
    select(Var2 in Domaine2, DomainesA, DomainesB),
    min_list(Domaine2, Min2),
    max_list(Domaine2, Max2), 

                        % Var1 = Valeur-Var2
    New_min1 is max(Min1, Valeur-Max2),
    New_max1 is min(Max1, Valeur-Min2),

    liste:elems_sup_egal_valeur(Domaine1, New_min1, Domaine1A),
    liste:elems_inf_egal_valeur(Domaine1A, New_max1, Domaine1B),
    
                        % Var2 = Valeur-Var1 
    New_min2 is max(Min2, Valeur-Max1),
    New_max2 is min(Max2, Valeur-Min1),

    liste:elems_sup_egal_valeur(Domaine2, New_min2, Domaine2A),
    liste:elems_inf_egal_valeur(Domaine2A, New_max2, Domaine2B),

    append([Var1 in Domaine1B, Var2 in Domaine2B], DomainesB, Domaines_out),

   check_somme_reductions(Var1, Var2, Valeur, 
                          Domaine1, Domaine1B, Domaine2, Domaine2B, 
                          Reductions, Exps).

    % comparaison
contrainte_vers_reduction(Contrainte, Domaines, Domaines_out, Reductions, 
						  Expli) :-
	functor(Contrainte, Op, _Arity),
    operateurs:operateurs_comparaison(Ops),
    member(Op, Ops),
    !,
    comparaison_vers_reductions(Contrainte, Domaines, Domaines_out, 
								Reductions, Expli).
    
    % Contrainte n'engendre pas de reduction      
contrainte_vers_reduction(_Contrainte, Domaines, Domaines, [], []).

% ----------
    % aucune reduction des domaines
check_somme_reductions(_Var1, _Var2, _Valeur, 
                        Domaine1, Domaine1, Domaine2, Domaine2, [], []) :-
    !.

    % reduction du domaine de Var1
check_somme_reductions(Var1, Var2, Valeur, 
                       Domaine1, Domaine1_reduit,
                       Domaine2, Domaine2, 
                       [Reduction], Expli) :-
  !,
  Reduction = reduction(Var1, valeur, Domaine1, Domaine1_reduit),
  ajout_suppression_contraintes:
    	ajouter_reductions(Var1 + Var2 = Valeur, 
    	                   Domaine1, Domaine2,
    	                   [Reduction], Expli).

    % reduction du domaine de Var2
check_somme_reductions(Var1, Var2, Valeur, 
                       Domaine1, Domaine1,
                       Domaine2, Domaine2_reduit, 
                       [Reduction], Expli) :-
  !,
  Reduction = reduction(Var2, valeur, Domaine2, Domaine2_reduit),
  ajout_suppression_contraintes:
    	ajouter_reductions(Var1 + Var2 = Valeur, 
    	                   Domaine1, Domaine2, 
    	                   [Reduction], Expli).  

    % reduction des domaines de Var1 et Var2
check_somme_reductions(Var1, Var2, Valeur, 
                       Domaine1, Domaine1_reduit,
                       Domaine2, Domaine2_reduit, 
                       [Reduction1, Reduction2], Expli) :-
  !,
  Reduction1 = reduction(Var1, valeur, Domaine1, Domaine1_reduit),
  Reduction2 = reduction(Var2, valeur, Domaine2, Domaine2_reduit),
  ajout_suppression_contraintes:
    	ajouter_reductions(Var1 + Var2 = Valeur, 
    	                   Domaine1, Domaine2,
    	                   [Reduction1, Reduction2], Expli).   
     
% ----------
    % comparaison entre une constante ou une variable et elle meme, on passe
comparaison_vers_reductions(Contrainte, Domaines, Domaines, [], []) :-
	Contrainte =..[_Op, Arg, Arg],
    !.

    % comparaison entre 2 constantes, on passe
comparaison_vers_reductions(Contrainte, Domaines, Domaines, [], []) :-
	Contrainte =..[_Op, Const1, Const2],
    donnees_contraintes:constante(Const1),
    donnees_contraintes:constante(Const2),
    !.
   
    % comparaison entre un variable et une constante
    % la constante est en premier on inverse les operandes
comparaison_vers_reductions(Contrainte, Domaines, Domaine_out, 
							Reductions, Expli) :-
    Contrainte =..[_Op, Const, Var],
    donnees_contraintes:constante(Const),
    donnees_contraintes:variable(Var),
    !,
    operateurs:inverse_operandes(Contrainte, Contrainte1),
    comparaison_vers_reductions(Contrainte1, Domaines, Domaine_out, 
								Reductions, Expli).

    % Egalite entre une variable et une constante (Var premier argument)
comparaison_vers_reductions(Var = Const, Domaines, [Var in Domaine1|Domaines1], 
                            Reduction, Expli) :-
    donnees_contraintes:variable(Var),            
    donnees_contraintes:constante(Const),   
    !,             
    select(Var in Domaine, Domaines, Domaines1),
    comp_var_const(Var = Const, Domaine, Domaine1),
    type_variable(Var, Type),    
    check_reduction(Var, Type, Domaine, Domaine1, Reduction),
    ajout_suppression_contraintes:
    	ajouter_reductions(Var = Const, Domaine, [Const], Reduction, Expli).
    
    % Comparaison entre une variable et une constante (Var premier argument)
comparaison_vers_reductions(Contrainte, Domaines, [Var in Domaine1|Domaines1], 
                            Reduction, Expli) :-
    Contrainte =..[_Op, Var, Const],
    donnees_contraintes:variable(Var),            
    donnees_contraintes:constante(Const),   
    !,             
    select(Var in Domaine, Domaines, Domaines1),
    comp_var_const(Contrainte, Domaine, Domaine1),
    type_variable(Var, Type),    
    check_reduction(Var, Type, Domaine, Domaine1, Reduction),   
	% gtrace,
    ajout_suppression_contraintes:
    	ajouter_reductions(Contrainte, Domaine, [Const], Reduction, Expli).
   
   % egalite entre 2 variables
comparaison_vers_reductions(Var = Var1, Domaines, Domaines_out, 
							Reductions, Expli) :- 
    donnees_contraintes:variable(Var),  
    donnees_contraintes:variable(Var1),
    !,
    donnees_contraintes:type_variable(Var, Type),
    select(Var in Dom_var, Domaines, Domaines1),
    select(Var1 in Dom_var1, Domaines1, Domaines2),
    comp_variables(Var = Var1, Type, Dom_var, Dom_var1, 
                   Dom_var_out, Dom_var1_out, Reductions, Expli),
    append([Var in Dom_var_out, Var1 in Dom_var1_out], Domaines2,
           Domaines_out).

    % comparaison entre 2 variables
comparaison_vers_reductions(Contrainte, Domaines, Domaines_out, 
							Reductions, Expli) :- 
    Contrainte =..[_Op, Var, Var1],
    donnees_contraintes:variable(Var),  
    donnees_contraintes:variable(Var1),
    !,
    donnees_contraintes:type_variable(Var, Type),
    select(Var in Dom_var, Domaines, Domaines1),
    select(Var1 in Dom_var1, Domaines1, Domaines2),
    comp_variables(Contrainte, Type, Dom_var, Dom_var1, 
                   Dom_var_out, Dom_var1_out, Reductions, Expli),
    append([Var in Dom_var_out, Var1 in Dom_var1_out], Domaines2,
           Domaines_out).
 
	% comparaison entre deux expressions contenant chacune une variable
	% dont une contient aussi une constante
comparaison_vers_reductions(Contrainte, Domaines, Domaines_out, 
							Reductions, Expli) :-
	traite_comp(Contrainte, Contrainte1),
	Contrainte1 =..[Comp, Exp, V],					% V est une variable
	traite_expression(Exp, Exp1),                   % Exp une expression
	Contrainte2=..[Comp, Exp1, V],
	donnees_contraintes:type_variable(V, Type),
	!,
	select(Var in Dom_var, Domaines, Domaines1),
    select(Var1 in Dom_var1, Domaines1, Domaines2),
	comp_exp_var(Contrainte2, Type, Dom_var, Dom_var1, 
				 Dom_var_out, Dom_var1_out, Reductions, Expli),
	append([Var in Dom_var_out, Var1 in Dom_var1_out], Domaines2, 
	       Domaines_out).
	       
comparaison_vers_reductions(_Contrainte, Domaines, Domaines, [], []).       

% ----------
	% place la variable a gauche de la comparaison
traite_comp(Comp, Comp) :-	
	Comp =..[_Op, _Exp, Var],			
 	donnees_contraintes:variable(Var),
 	!.
 	 	
traite_comp(Comp, Comp1) :-	
	operateurs:inverse_operandes(Comp, Comp1).

% ----------
	% Exp est une operation entre une constante et une variable
	% on retourne l'expression ou la constante est en premier		
traite_expression(Exp, Exp) :-	
	Exp =..[_Op, Var, _Const],			
 	donnees_contraintes:variable(Var),
 	!.
 	
traite_expression(Exp, Exp1) :-	
	Exp =..[Op, Const, Var],
	Exp1 =..[Op, Var, Const].

% ----------
   % Var doit avoir des valeurs inferieures a Var1
   % on elimine du domaine de Var les elements superieurs ou egaux
   % du max du domaine de Var1
comp_exp_var(Exp < Var1, Type, Domaine, Domaine1, 
             Domaine_out, Domaine1_out, Reductions, Expli) :-
    Exp =..[Op, Var, Valeur],
    member(Op, [+,-]),
    !,
    max_member(Max1, Domaine1),
    traite_max(Max1, Op, Valeur, Max1_A),
    liste:elems_inf_valeur(Domaine, Max1_A, Domaine_out),
    min_member(Min, Domaine),
    traite_min(Min, Op, Valeur, Min_A), 
    liste:elems_sup_valeur(Domaine1, Min_A, Domaine1_out),
    check_reduction(Var, Type, Domaine, Domaine_out, Reduction1),
    check_reduction(Var1, Type, Domaine1, Domaine1_out, Reduction2),
    append(Reduction1, Reduction2, Reductions),
    ajout_suppression_contraintes:
    	ajout_reductions(Exp < Var1, Var, Domaine, Var1, Domaine1,
                         Reductions, Expli).
                         
comp_exp_var(Exp =< Var1, Type, Domaine, Domaine1, 
             Domaine_out, Domaine1_out, Reductions, Expli) :-
    Exp =..[Op, Var, Valeur],
    member(Op, [+,-]),
    !,
    max_member(Max1, Domaine1),
    traite_max(Max1, Op, Valeur, Max1_A),
    liste:elems_inf_egal_valeur(Domaine, Max1_A, Domaine_out),
    min_member(Min, Domaine),
    traite_min(Min, Op, Valeur, Min_A), 
    liste:elems_sup_egal_valeur(Domaine1, Min_A, Domaine1_out),
    check_reduction(Var, Type, Domaine, Domaine_out, Reduction1),
    check_reduction(Var1, Type, Domaine1, Domaine1_out, Reduction2),
    append(Reduction1, Reduction2, Reductions),
	gtrace,
    ajout_suppression_contraintes:
    	ajout_reductions(Exp =< Var1, Var, Domaine, Var1, Domaine1,
                         Reductions, Expli).
                         
comp_exp_var(Exp > Var1, Type, Domaine, Domaine1, 
             Domaine_out, Domaine1_out, Reductions, Expli) :-
    !,         
	comp_exp_var(Var1 < Exp, Type, Domaine, Domaine1, 
                 Domaine_out, Domaine1_out, Reductions, Expli).
             
comp_exp_var(Exp >= Var1, Type, Domaine, Domaine1, 
             Domaine_out, Domaine1_out, Reductions, Expli) :-    
	comp_exp_var(Var1 =< Exp, Type, Domaine, Domaine1, 
             Domaine_out, Domaine1_out, Reductions, Expli).

% ----------
traite_max(Max, +, Valeur, Max_A) :-
	Max_A is Max-Valeur,
	!.
	
traite_max(Max, -, Valeur, Max_A) :-
	Max_A is Max + Valeur.
	
% ----------
traite_min(Min, +, Valeur, Min_A) :-
	Min_A is Min + Valeur,
	!.
	
traite_min(Min, -, Valeur, Min_A) :-
	Min_A is Min - Valeur.

% ----------
    % les contraintes de comparaisons entre 2 variables entrainent 
    % eventuellement des reductions de leur domaines.
    	
	% variables couleur
comp_variables(Comp_couleurs, _Type, 
			   Domaine, Domaine1, 
			   Domaine_out, Domaine1_out, Reductions, Expli) :-
	Comp_couleurs =..[Operateur, _Var, _Var1],
	operateurs:op_comparaison_couleur(Operateur),
	!,
	reductions_domaines_couleurs(Comp_couleurs, Domaine, Domaine1, Operateur,
								 Domaine_out, Domaine1_out, Reductions, Expli).

	% variables valeur
comp_variables(Var = Var1, Type, Domaine, Domaine1, 
               Domaine_commun, Domaine_commun, Reductions, Expli) :-
    !,
    intersection(Domaine, Domaine1, Domaine_commun),  
    check_reduction(Var, Type, Domaine, Domaine_commun, Reduction1),
	check_reduction(Var1, Type, Domaine1, Domaine_commun, Reduction2),
	append(Reduction1, Reduction2, Reductions),
    ajout_suppression_contraintes:
    	ajout_reductions(Var = Var1, Var, Domaine, Var1, Domaine1, 
    	                 Reductions, Expli).

    % 2 variables valeur differentes 
    % reduction possible si un des deux domaines est un singleton
comp_variables(Var \= Var1, Type, Domaine, Domaine1, 
                      Domaine_out, Domaine1_out, LReduction, Expli) :-
    (Domaine = [Valeur] ; Domaine1 = [Valeur]),
    !,
    valeur_a_exclure(Domaine, Domaine1, Valeur, Position),
    (
        Position == 1       % Domaine Var est un singleton
                            % on exclut sa valeur de Domaine
        -> exclure_valeur_domaine(Valeur, Domaine1, Domaine1_out),
           Domaine_out = Domaine,
           check_reduction(Var1, Type, Domaine1, Domaine1_out, LReduction)
        ;  exclure_valeur_domaine(Valeur, Domaine, Domaine_out),
           Domaine1_out = Domaine1,
           check_reduction(Var, Type, Domaine, Domaine_out, LReduction)
    ),
    ajout_suppression_contraintes:
              reduction_deux_vars(Var \= Var1, Var, Domaine, 
                                  Var1, Domaine1, LReduction, Expli).

   % Var < Var1
   % on elimine du domaine de Var les elements superieurs ou egaux
   % du max du domaine de Var1
comp_variables(Var < Var1, Type, Domaine, Domaine1, 
               Domaine_out, Domaine1_out, Reductions, Expli) :-
    !,
    max_member(Max1, Domaine1),
    liste:elems_inf_valeur(Domaine, Max1, Domaine_out),
    min_member(Min, Domaine),
    liste:elems_sup_valeur(Domaine1, Min, Domaine1_out),
    check_reduction(Var, Type, Domaine, Domaine_out, Reduction1),
    check_reduction(Var1, Type, Domaine1, Domaine1_out, Reduction2),
    append(Reduction1, Reduction2, Reductions),
    ajout_suppression_contraintes:
    	ajout_reductions(Var < Var1, Var, Domaine, Var1, Domaine1,
                         Reductions, Expli).

   % Var <= Var1
   % on elimine du domaine de Var les elements superieurs ou egaux
   % du max du domaine de Var1
comp_variables(Var =< Var1, Type, Domaine, Domaine1, 
               Domaine_out, Domaine1_out, Reductions, Expli) :-
    !,
    max_member(Max1, Domaine1),
    liste:elems_inf_egal_valeur(Domaine, Max1, Domaine_out),
    min_member(Min, Domaine),
    liste:elems_sup_egal_valeur(Domaine1, Min, Domaine1_out),
    check_reduction(Var, Type, Domaine, Domaine_out, Reduction1),
    check_reduction(Var1, Type, Domaine1, Domaine1_out, Reduction2),
    append(Reduction1, Reduction2, Reductions),
    ajout_suppression_contraintes:
    	ajout_reductions(Var =< Var1, Var, Domaine, Var1, Domaine1, 
    					 Reductions, Expli).

    % pas de reduction ni changement de domaine
comp_variables(_Contrainte, _Type, Domaine, Domaine1, Domaine, Domaine1, 
               [], []).
  
% ----------
check_reduction(_Var, _Type, Domaine, Domaine, []) :-
    !.

check_reduction(Var, Type, Domaine, Domaine1, 
                [reduction(Var, Type, Domaine, Domaine1)]).

% ---------
    % Const est retiree du domaine de Var, 
comp_var_const(_Var = Const,  _Domaine, [Const]) :-
    !.

comp_var_const(_Var \= Const, Domaine, Domaine1) :-
    !,
    exclure_valeur_domaine(Const, Domaine, Domaine1).

comp_var_const(_Var < Const, Domaine, Domaine1) :-
    !,
    liste:elems_inf_valeur(Domaine, Const, Domaine1).

comp_var_const(_Var =< Const, Domaine, Domaine1) :-
    !,
    liste:elems_inf_egal_valeur(Domaine, Const, Domaine1).

comp_var_const(_Var > Const, Domaine, Domaine1) :-
    !,
    liste:elems_sup_valeur(Domaine, Const, Domaine1).

comp_var_const(_Var >= Const, Domaine, Domaine1) :-
    !,
    liste:elems_sup_egal_valeur(Domaine, Const, Domaine1).

comp_var_const(_Var meme_rang Const, _Domaine, [Const]) :-
    !.

comp_var_const(_Var avant Const, Domaine, Domaine1) :-
    !,
    couleurs_avant_valeur(Domaine, Const, Domaine1).

comp_var_const(_Var avant_meme_rang Const, Domaine, Domaine1) :-
    !,
    couleurs_avant_meme_rang_valeur(Domaine, Const, Domaine1).

comp_var_const(_Var apres Const, Domaine, Domaine1) :-
    !,
    couleurs_apres_valeur(Domaine, Const, Domaine1).

comp_var_const(_Var apres_meme_rang Const, Domaine, Domaine1) :-
    !,
    couleurs_apres_meme_rang_valeur(Domaine, Const, Domaine1).
  
% ---------
    % retourne la valeur a exclure et la position du Domaine de cette valeur
valeur_a_exclure([V], _Domaine, V, 1) :-
    !.
    
valeur_a_exclure(_Domaine, [V], V, 2).

% ---------
exclure_valeur_domaine(Valeur, Domaine, Domaine1) :-
    select(Valeur, Domaine, Domaine1),
    !.

exclure_valeur_domaine(_Valeur, Domaine, Domaine).

% ----------
	% verifie s'il est possible de reduire Domaine et Domaine1
	% en fonction de la Contrainte Op, et de l'ordre des couleurs
reductions_domaines_couleurs(Comp_couleurs, Domaine, Domaine1, Operateur, 
                             Domaine_out, Domaine1_out, 
                             Reductions_out, Expli_out) :-     
                  
	running_game:ordre_couleurs(Ordre_couleurs),

	retire_couleurs_impossibles(Domaine, Domaine, Domaine1, Comp_couleurs,
								Ordre_couleurs, Operateur, 
								Domaine_out, Reductions, Expli),

    operateurs:inverse_operandes(Comp_couleurs, Comp_couleurs1),
    functor(Comp_couleurs1, Operateur1, _Arity),

	retire_couleurs_impossibles(Domaine1, Domaine1, Domaine_out, Comp_couleurs1,
								Ordre_couleurs, Operateur1, 
								Domaine1_out, Reductions1, Expli1),

	append(Reductions, Reductions1, Reductions_out),
	append(Expli, Expli1, Expli_out).
												
% ----------
    % retire de Domaine les couleurs incompatibles avec 
    % toutes les couleurs de Domaine1

	% Domaine explore
retire_couleurs_impossibles([], _Domaine, _Domaine1, _Comp_couleurs,
                            _Ordre_couleurs, _Operateur, [], [], []) :-
	!.

	% Couleur compatible avec au moins une couleur de Domaine1 on la conserve
retire_couleurs_impossibles([Couleur|Couleurs], Domaine, Domaine1, 
                            Comp_couleurs, Ordre_couleurs, Operateur, 
                            [Couleur|Domaine_out], Reductions, Expli) :-
	couleur_compatible(Domaine1, Couleur, Ordre_couleurs, Operateur),
	!,
	retire_couleurs_impossibles(Couleurs, Domaine, Domaine1, Comp_couleurs, 
	                            Ordre_couleurs, Operateur, Domaine_out, 
	                            Reductions, Expli).

	% Couleur incompatible toutes les couleurs de Domaine1, on la supprime
retire_couleurs_impossibles([Couleur|Couleurs], Domaine, Domaine1, 
                             Comp_couleurs, Ordre_couleurs, Operateur, 
                             Domaine_out, Reductions_out, Expli_out) :-
	Comp_couleurs =..[Operateur, Var, Var1],

    select(Couleur, Domaine, DomaineA),
    
    Reduction = [reduction(Var, couleur, Domaine, DomaineA)],

    relations_ordre_couleurs(Ordre_couleurs, Couleur, Domaine1, Relations),
   
	ajout_suppression_contraintes:
    ajout_reductions_couleur(Comp_couleurs, Var, Domaine, 
                             Var1, Domaine1, Relations, Reduction, Expli1),

	retire_couleurs_impossibles(Couleurs, DomaineA, Domaine1, Comp_couleurs, 
	                            Ordre_couleurs, 
							    Operateur, Domaine_out, Reductions2, Expli2),

	append(Reduction, Reductions2, Reductions_out),
	append(Expli1, Expli2, Expli_out).
	
% ----------	
	% recherche si une couleur de Couleurs est compatible avec Couleur1
couleur_compatible([], _Couleur1, _Ordre_couleurs, _Operateur) :-
	!,
	fail.

	% Couleur compatible avec Couleur1
couleur_compatible([Couleur|_Couleurs], Couleur1, Ordre_couleurs, Operateur) :-
	Couleur \== Couleur1,
	Comp =..[Operateur, Couleur1, Couleur],
	comparaisons:comparaison_compatible_ordre_couleurs(Comp, Comp1),
    member(Comp1, Ordre_couleurs),
	!.
	
	% Couleur pas compatible avec Couleur1
couleur_compatible([_Couleur|Couleurs], Couleur1, Ordre_couleurs, Operateur) :-
		couleur_compatible(Couleurs, Couleur1, Ordre_couleurs, Operateur).

% ----------
    % retourne toutes les relations impliquant Couleur dans Ordre_couleurs

relations_ordre_couleurs(Ordre_couleurs, Couleur, Domaine, Relations) :-
    relations_ordre_couleurs2(Ordre_couleurs, Couleur, Domaine, RelationsA),    
    findall(meme_rang(X,X) , member(meme_rang(X,X), RelationsA), Memes_rangs),
    subtract(RelationsA, Memes_rangs, RelationsB),
    operateurs:inverse_comparaisons(RelationsB, Couleur, Relations).

% ----------
relations_ordre_couleurs2([], _Couleur, _Domaine, []) :-
    !.

relations_ordre_couleurs2([Ordre|Ordre_couleurs], Couleur, Domaine, 
                         [Ordre|Ordres]) :-
    (
        Ordre =..[_Relation1, Couleur, C] ;
        Ordre =..[_Relation2, C, Couleur]
    ),
    member(C, Domaine),
    !,
    relations_ordre_couleurs2(Ordre_couleurs, Couleur, Domaine, Ordres).

relations_ordre_couleurs2([_Ordre|Ordre_couleurs], Couleur, Domaine, Ordres) :-
    relations_ordre_couleurs2(Ordre_couleurs, Couleur, Domaine, Ordres).

/* ============================== FIN LISTING =============================== */
