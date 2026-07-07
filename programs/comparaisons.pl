/* ============= GERE LES COMPARAISONS ENTRE COULEURS, VALEURS ============== */

:- module(
          comparaisons, 
          [      

		   get_var_const_comp/3,
		   memes_comparaisons/2,
           est_comparaison/1,
		   ordonne_comp_var_const/2,
           ordonne_comparaison/2, 
		   ordonne_comparaison_lexico/2,
           convertit_comp_couleurs/2,
           check_egalite_couleurs/2,
           comp_valeurs_avant/2,
           
		   comparaison_compatible_ordre_couleurs/2,	
           comp_satisfaite/2,
           comp_insatisfaite/2,
           contredit/2,
           comp_constantes_satisfaite/2,
           
           negation_comp_couleurs/2,
           negation_comp_valeurs/2,
		   negation_comp/2,
           
           comp_valeurs/1,
           comp_couleurs/1
          ]
		 ).
 
:- use_module(operateurs),
   use_module(domaines),
   use_module(evaluation),
   use_module(donnees_contraintes).


% ----------
	% retourne la variable et la constante 
	% d'une comparaison entre une variable et une constante
get_var_const_comp(Comp, Var, Const) :-
	Comp =..[_Op, Var, Const],
	donnees_contraintes:variable(Var),
	donnees_contraintes:constante(Const),
	!.

get_var_const_comp(Comp, Var, Const) :-
	Comp =..[_Op, Const, Var].

% ----------
memes_comparaisons(Comp1, Comp2) :-
	ordonne_comparaison(Comp1, Comp),
	ordonne_comparaison(Comp2, Comp).

% ----------
est_comparaison(Comparaison) :-
    Comparaison =..[Op, _Arg1, _Arg2],
    operateurs:op_comparaison(Op).

% ----------
	% Dans une comparaison place la variable avant la consante
ordonne_comp_var_const(Comp, Comp) :-
	Comp =..[_Op, Var, Const],
	donnees_contraintes:variable(Var),
	donnees_contraintes:constante(Const),
	!.

ordonne_comp_var_const(Comp, Comp1) :-
	Comp  =..[Op, Const, Var],
	ordonne_comp_var_const2(Op, Const, Var, Comp1).

% ----------
ordonne_comp_var_const2(=, Const, Var, Var = Const) :-
	!.

ordonne_comp_var_const2(\=, Const, Var, Var \= Const) :-
	!.

ordonne_comp_var_const2(<, Const, Var, Var > Const) :-
	!.

ordonne_comp_var_const2(=<, Const, Var, Var >= Const) :-
	!.

ordonne_comp_var_const2(>, Const, Var, Var < Const) :-
	!.

ordonne_comp_var_const2(>=, Const, Var, Var =< Const) :-
	!.

ordonne_comp_var_const2(meme_rang, Const, Var, Var meme_rang Const) :-
	!.

ordonne_comp_var_const2(avant, Const, Var, Var apres Const) :-
	!.

ordonne_comp_var_const2(avant_meme_rang, Const, Var, Var apres_meme_rang Const) :-
	!.

ordonne_comp_var_const2(apres, Const, Var, Var avant Const) :-
	!.

ordonne_comp_var_const2(apres_meme_rang, Const, Var, Var avant_meme_rang Const) :-
	!.

% ----------
	% ordonne la comparaison par ordre lexicographique de ses arguments
	% que ce soit des constantes ou des variables
ordonne_comparaison_lexico(Comp, Comp_out) :-
    ordonne_comparaison(Comp, Comp1),
    ordonne_comp_lexico(Comp1, Comp_out).

% ----------
ordonne_comp_lexico(Comp, Comp1) :-
	Comp =..[Op, Arg1, Arg2],
	member(Op, [=, \=, meme_rang, pas_meme_rang]),
	(
		Arg1 @=< Arg2
			-> Comp1 =..[Op, Arg1, Arg2]
		    ;  Comp1 =..[Op, Arg2, Arg1]
	).

ordonne_comp_lexico(Comp, Comp).
	
% ----------
ordonne_comparaison(C1 apres C2, C2 avant C1) :-
    !.

ordonne_comparaison(C1 apres_meme_rang C2, C2 avant_meme_rang C1) :-
    !.

    % on compare 2 variables couleur
ordonne_comparaison(C1 meme_rang C2, CA meme_rang CB) :-
    donnees_contraintes:variable_couleur(C1),
    donnees_contraintes:variable_couleur(C2),
    (
        C1 @=< C2
        -> CA = C1, CB = C2  % ordre lexicographique des constantes
        ;  CA = C2, CB = C1
    ),             
    !.

    % on compare 2 constantes couleur
ordonne_comparaison(C1 meme_rang C2, CA meme_rang CB) :-
    donnees_contraintes:constante_couleur(C1),
    donnees_contraintes:constante_couleur(C2),
    (
        C1 @=< C2
        -> CA = C1, CB = C2  % ordre lexicographique des constantes
        ;  CA = C2, CB = C1
    ),             
    !.

    % on compare 1 variable et 1 constante couleur
    % C2 est une constante couleur
ordonne_comparaison(C1 meme_rang C2, C1 meme_rang C2) :-   
    donnees_contraintes:constante_couleur(C2),
    !.

    % C1 est une constante couleur
ordonne_comparaison(C1 meme_rang C2, C2 meme_rang C1) :-   
    donnees_contraintes:constante_couleur(C2),
    !.

ordonne_comparaison(V1 > V2, V2 < V1) :-
    !.

ordonne_comparaison(V1 >= V2, V2 =< V1) :-
    !.

   % on compare 2 variables valeur
ordonne_comparaison(V1 = V2, VA = VB) :-
    donnees_contraintes:variable_valeur(V1),
    donnees_contraintes:variable_valeur(V2),
    (
        V1 @=< V2		% ordre lexicographique 
        -> VA = V1, VB = V2  
		;  VA = V2, VB = V1 
    ),             
    !.

  % on compare 2 variables couleur
ordonne_comparaison(C1 meme_rang C2, CA meme_rang CB) :-
    donnees_contraintes:variable_couleur(C1),
    donnees_contraintes:variable_couleur(C2),
    (
        C1 @=< C2
        -> CA = C1, CB = C2  
		;  CA = C2, CB = C1
    ),             
    !.

   % on compare 2 constantes valeur
ordonne_comparaison(V1 = V2, VA = VB) :-
    donnees_contraintes:constante_valeur(V1),
    donnees_contraintes:constante_valeur(V2),
    (
        V1 @=< V2
        -> VA = V1, VB = V2  % ordre lexicographique
        ;  VA = V2, VB = V1
    ),             
    !.


    % on compare 1 variable et 1 constante valeur
    % V2 est une constante valeur
ordonne_comparaison(V1 = V2, V1 = V2) :-   
    donnees_contraintes:constante_valeur(V2),
    !.

ordonne_comparaison(V1 = V2, V2 = V1) :-   
    donnees_contraintes:constante_valeur(V1),
    !.

 % on compare 2 variables (2 couleurs ou 2 valeurs) 
ordonne_comparaison(V1 \= V2, VA \= VB) :-
    donnees_contraintes:variable(V1),
    donnees_contraintes:variable(V2),
    (
        V1 @=< V2
        -> VA = V1, VB = V2  % ordre lexicographique 
		;  VA = V2, VB = V1
    ),             
    !.

   % on compare 2 constantes (2 couleurs ou 2 valeurs)
ordonne_comparaison(V1 \= V2, VA \= VB) :-
    donnees_contraintes:constante(V1),
    donnees_contraintes:constante(V2),
    (
        V1 @=< V2
        -> VA = V1, VB = V2  % ordre lexicographique
        ;  VA = V2, VB = V1
    ),             
    !.

    % on compare 1 variable et 1 constante valeur
    % V2 est une constante valeiur
ordonne_comparaison(V1 \= V2, V1 \= V2) :-   
    donnees_contraintes:constante(V2),
    !.

ordonne_comparaison(V1 \= V2, V2 \= V1) :-   
    donnees_contraintes:constante(V1),
    !.

ordonne_comparaison(Comp, Comp).

% ----------
convertit_comp_couleurs(Contrainte, Contrainte_out) :-
    Contrainte =..[Op, Arg1, Arg2],
    operateurs:traduit_op_couleur(Op, Op1),
    Contrainte_out =..[Op1, Arg1, Arg2].

% ----------
	% retourne toutes les comparaisons compatiable avec le premier argument
	% pouvant apparaitre dans l'ordre des couleurs
 
	% meme_rang 
comparaison_compatible_ordre_couleurs(C meme_rang C1, C meme_rang C1).

comparaison_compatible_ordre_couleurs(C meme_rang C1, C1 meme_rang C).

	% avant
comparaison_compatible_ordre_couleurs(C avant C1, C avant C1).

	% avant_meme_rang
comparaison_compatible_ordre_couleurs(C avant_meme_rang C1, C avant C1).

comparaison_compatible_ordre_couleurs(C avant_meme_rang C1, C meme_rang C1).

comparaison_compatible_ordre_couleurs(C avant_meme_rang C1, C1 meme_rang C).

	% apres
comparaison_compatible_ordre_couleurs(C apres C1, C1 avant C).

	% apres_meme_rang
comparaison_compatible_ordre_couleurs(C apres_meme_rang C1, C1 avant C).

comparaison_compatible_ordre_couleurs(C apres_meme_rang C1, C meme_rang C1).

comparaison_compatible_ordre_couleurs(C apres_meme_rang C1, C1 meme_rang C).

	% pas_meme_rang
comparaison_compatible_ordre_couleurs(C pas_meme_rang C1, C avant C1).

comparaison_compatible_ordre_couleurs(C pas_meme_rang C1, C1 avant C).

% ----------
	% comparaisons entre au plus 2 variables valeur
comp_satisfaite(Comp, Domaines) :-
	comp_valeurs(Comp),
	!,
	prepare_comp_valeurs(Comp, Domaines, Op, Domaine1, Domaine2),
	domaines:compare_domaines_valeur(Domaine1, Domaine2, Op).

	% comparaison entre au plus 2 variables couleur
comp_satisfaite(Comp, Domaines) :-
	prepare_comp_couleurs(Comp, Domaines, Op, Domaine1, Domaine2),
	domaines:compare_domaines_couleur(Domaine1, Domaine2, Op).
	
% ----------
	% comparaisons entre au plus 2 variables valeur
comp_insatisfaite(Comp, Domaines) :-
	comp_valeurs(Comp),
	!,
	prepare_comp_valeurs(Comp, Domaines, Op, Domaine1, Domaine2),
	domaines:compare_domaines_valeur(Domaine1, Domaine2, Op1),
    (
     Op1 == aucun               % domaines non comparables
        -> fail
        ;
         \+ operateurs:operateurs_comparaison_compatibles(Op, Op1)
     ).

	% comparaison entre au plus 2 variables couleur
comp_insatisfaite(Comp, Domaines) :-
	prepare_comp_couleurs(Comp, Domaines, Op, Domaine1, Domaine2),
	domaines:compare_domaines_couleur(Domaine1, Domaine2, Op1),
    (
      Op1 == aucun          % domaines non comparables
        -> fail
	    ;
         \+ operateurs:operateurs_comparaison_compatibles(Op, Op1)
    ).
	
% ----------
prepare_comp_valeurs(Comp, Domaines, Op, Domaine1, Domaine2) :-
	Comp =..[Op, Arg1, Arg2],
	evaluation:evalue(Arg1, ArgA),
	evaluation:evalue(Arg2, ArgB),
	check_arguments:arguments_impliques(ArgA, [ArgX]),
	check_arguments:arguments_impliques(ArgB, [ArgY]),
	domaine(ArgX, Domaines, Domaine1),
	domaine(ArgY, Domaines, Domaine2).
	
% ----------
prepare_comp_couleurs(Comp, Domaines, Op, Domaine1, Domaine2) :-
	Comp =..[Op, Arg1, Arg2],
	check_arguments:arguments_impliques(Arg1, [ArgX]),
	check_arguments:arguments_impliques(Arg2, [ArgY]),
	domaine(ArgX, Domaines, Domaine1),
	domaine(ArgY, Domaines, Domaine2).
	
% ---------
comp_couleurs_satisfaite(C1 < C2, Ordre_couleurs, _Domaines) :-
    member(C1 avant C2, Ordre_couleurs),
    !.

comp_couleurs_satisfaite(C1 = C2, Ordre_couleurs, _Domaines) :-
    member(C1 meme_rang C2, Ordre_couleurs),
    !.

comp_couleurs_satisfaite(C1 =< C2, Ordre_couleurs, _Domaines) :-
    member(C1 meme_rang C2, Ordre_couleurs).    
	
% ---------
comp_constantes_satisfaite(Comp, Domaines) :-
    Comp=..[_Op, Arg1, Arg2],
    donnees_contraintes:constante(Arg1),
    donnees_contraintes:constante(Arg2),
    donnees_contraintes:type_constante(Arg1, Type),
    comp_const_satisfaite(Comp, Type, Domaines).
    
% ---------    
comp_const_satisfaite(V1 < V2, valeur, _Domaines) :-
    V1 < V2,
    !.
    
comp_const_satisfaite(V1 =< V2, valeur, _Domaines) :-
    V1 =< V2,
    !.
    
comp_const_satisfaite(V1 = V2, valeur, _Domaines) :-
    V1 == V2,
    !.
    
comp_const_satisfaite(Comp_couleurs, couleur, Domaines) :-
    kimind_run:ordre_couleurs(Ordre_couleurs),
    comp_couleurs_satisfaite(Comp_couleurs, Ordre_couleurs, Domaines).

% ----------
	% verifie si Comp1 contredit Comp2
contredit(C1 avant C2, C1 meme_rang C2) :-
	!.
	
contredit(C1 avant C2, C2 meme_rang C1) :-
	!.
	
contredit(C1 apres C2, C1 meme_rang C2) :-
	!.
	
contredit(C1 apres C2, C2 meme_rang C1) :-
	!.
	
contredit(C1 meme_rang C2, C1 avant C2) :-
	!.
	
contredit(C2 meme_rang C1, C1 avant C2) :-
	!.
	
contredit(C1 apres C2, C1 avant_meme_rang C2) :-
	!.
	
contredit(C1 meme_rang C2, C1 apres C2) :-
	!.
	
contredit(C2 meme_rang C1, C1 apres C2) :-
	!.

contredit(C1 avant C2, C1 apres C2) :-
	!.
	
contredit(C1 avant C2, C1 apres_meme_rang C2) :-
	!.
	
	% couleurs
contredit(V1 < V2, V1 = V2) :-
	!.
	
contredit(V1 > V2, V1 = V2) :-
	!.
	
contredit(V1 > V2, V1 < V2) :-
	!.
	
contredit(V1 >= V2, V1 < V2) :-
	!.
	
contredit(V1 > V2, V1 =< V2) :-
	!.
	
contredit(V1 < V2, V1 > V2) :-
	!.
	
contredit(V1 =< V2, V1 > V2) :-
	!.
	
contredit(V1 < V2, V1 >= V2).

% ----------
negation_comp(Comp, Comp_niee) :-
	negation_comp_couleurs(Comp, Comp_niee),
	!.

negation_comp(Comp, Comp_niee) :-
	negation_comp_valeurs(Comp, Comp_niee).

% ----------
negation_comp_couleurs(C1 meme_rang C2, C2 pas_meme_rang C1) :-
	!.
	
negation_comp_couleurs(C1 pas_meme_rang C2, C2 meme_rang C1) :-
	!.
		
negation_comp_couleurs(C1 avant C2, C2 avant_meme_rang C1) :-
	!.
	
negation_comp_couleurs(C1 avant_meme_rang C2, C2 avant C1) :-
	!.
	
negation_comp_couleurs(C1 apres C2, C1 avant_meme_rang C2) :-
	!.
	
negation_comp_couleurs(C1 apres_meme_rang C2, C1 avant C2).

% ----------
negation_comp_valeurs(V1 = V2, V1 \= V2) :-
	!.

negation_comp_valeurs(V1 < V2, V2 =< V1) :-
	!.

negation_comp_valeurs(V1 =< V2, V2 < V1) :-
	!.
	
negation_comp_valeurs(V1 > V2, V2 >= V1) :-
	!.
	
negation_comp_valeurs(V1 >= V2, V2 > V1).

% ---------
comp_valeurs(Comp) :-
    Comp=..[Op, V1, V2],
    operateurs:operateurs_valeur(Op_valeurs),
    member(Op, Op_valeurs),
    (donnees_contraintes:type_valeur(V1) ;  
     donnees_contraintes:type_valeur(V2)),
    !.
    
% ---------
comp_couleurs(Comp) :-
    Comp=..[Op, C1, C2],
    operateurs_couleur(Op_couleurs),
	member(Op, Op_couleurs),
    (donnees_contraintes:type_couleur(C1) ; 
     donnees_contraintes:type_couleur(C2)),
    !.
    
% ------	
check_egalite_couleurs(C1 = C2, C1 meme_rang C2) :-
	donnees_contraintes:variable_couleur(C1),
	!.
	
check_egalite_couleurs(C1 = C2, C1 meme_rang C2) :-
	donnees_contraintes:variable_couleur(C2),
	!.
	
check_egalite_couleurs(Contrainte, Contrainte).

% ----------
 comp_valeurs_avant(V1 =< V2, V1 < V2) :-
    donnees_contraintes:variable(V1),
    donnees_contraintes:variable(V2),
    !.

 comp_valeurs_avant(C =< V, C < V) :-
    donnees_contraintes:constante(C),
    donnees_contraintes:variable(V),
    !.
    		% ! pour eviter points de choix inutiles
 
/* =============================== FIN LISTING ============================== */
