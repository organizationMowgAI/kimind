/* ========================================================================== */
/*      REMPLACE LES VARIABLES AVEC DOMAINES SINGLETONS PAR LEUR VALEUR       */
/* ========================================================================== */

:- module(
          remplace_vars_valeurs,
          [
           remplace_vars_valeurs/5
          ]
		 ).
	
:-   
   use_module(library(clpfd)),
   use_module(donnees_contraintes),
   use_module(check_arguments),
   use_module(ajout_suppression_contraintes),
   use_module(evaluation).
   
% ---------
remplace_vars_valeurs([], _Domaines, [], [], []) :-
	!.

remplace_vars_valeurs([Contrainte|Contraintes], Domaines, 
                      Contraintes_restantes_out, New_contraintes_out,
                      Explications_out) :-
	modifie_contrainte(Contrainte, Domaines, LContrainte1, 
						LNew_contrainte, Exp1),
	remplace_vars_valeurs(Contraintes, Domaines, Contraintes1, 
						  New_contraintes1, Exps2),
	append(LContrainte1, Contraintes1, Contraintes_restantes_out),
	append(LNew_contrainte, New_contraintes1, New_contraintes_out),
	append(Exp1, Exps2, Explications_out).
	  
% ---------
	% une variable avec un domaine contenant une seule valeur
	% est remplacee par cette valeur, formant une nouvelle contrainte
modifie_contrainte(Contrainte, Domaines, LContrainte, LNew_contrainte, Exp) :-
	check_arguments:
    variables_impliquees(Contrainte, Vars_couleurs, Vars_valeurs),
	append(Vars_couleurs, Vars_valeurs, Variables),
	recupere_domaines_singletons(Variables, Domaines, Domaines_singletons),
	remplace_variables_valeurs(Contrainte, Domaines_singletons, Contrainte1),
	check_somme(Contrainte1, Contrainte2),
	check_new_contrainte(Contrainte, Contrainte2, Domaines_singletons, 
	                     LContrainte, LNew_contrainte, Exp).

% ----------
check_somme(Arg1 + Arg2 = Valeur, Evaluation):-
	!,
	evaluation:evalue_comp(Arg1 + Arg2 = Valeur, Evaluation).
	
check_somme(Contrainte, Contrainte).

% ----------
	% verifie si Contrainte a ete modifiee
	
	% Conntrainte pas modifiee
check_new_contrainte(Contrainte, Contrainte, _Domaines_singletons,
                     [Contrainte], [], []) :-
	!.
	
	% contrainte somme modifiee, on ne considere pas la modification
	% comme une nouvelle contrainte
check_new_contrainte(Somme, Arg1+Arg2 = Valeur, Domaines_singletons,
                     [Arg1+Arg2=Valeur], [], Exp) :-  
	!,                   
	ajout_suppression_contraintes:
	transformation_contrainte(Somme, Domaines_singletons, 
							  Arg1+Arg2=Valeur, Exp).

	% Contrainte modifiee
check_new_contrainte(Contrainte, Contrainte1, Domaines_singletons,
                     [], [Contrainte1], Exp) :-                  
	ajout_suppression_contraintes:
		transformation_contrainte(Contrainte, Domaines_singletons, 
								  Contrainte1, Exp).
		
% ---------
	% remplace chaque variable ayant un domaine reduit a une Valeur
	% par cette Valeur
remplace_variables_valeurs(Terme, [], Terme) :-
    !.

    % laisser a cette place avant atomic(Var)
remplace_variables_valeurs([], _Subtitutions, []) :-
    !.

remplace_variables_valeurs(Var, Substitutions, Valeur) :-
	atomic(Var),
    !,
	remplace_variable_valeur(Substitutions, Var, Valeur).

remplace_variables_valeurs([X|L], Substitutions, [TermeA|TermeB]) :-
    !,	
    remplace_variables_valeurs(X, Substitutions, Terme1),
    evaluation:evalue(Terme1, TermeA),
    remplace_variables_valeurs(L, Substitutions, Terme2),
    evaluation:evalue(Terme2, TermeB).
    
remplace_variables_valeurs(Terme, Substitutions, Terme_out) :-
    Terme =..[Pred|Args],
    remplace_variables_valeurs(Args, Substitutions, Args1),
    Terme_out =..[Pred|Args1].

% --------- 
remplace_variable_valeur([], Var, Var) :-
    !.

remplace_variable_valeur([s(Var,V)|_Substitutions], Var, V) :-
    !.

remplace_variable_valeur([_Substitution|Substitutions], Var, V) :-
    remplace_variable_valeur(Substitutions, Var, V).

% ---------
recupere_domaines_singletons([], _Domaines, []) :-
	!.
	
recupere_domaines_singletons([Var|Vars], Domaines, 
						   [s(Var, Valeur)|Domaines_singletons]) :-
	select(Var in [Valeur], Domaines, Domaines1),
	!,
	recupere_domaines_singletons(Vars, Domaines1, Domaines_singletons).

recupere_domaines_singletons([_Var|Vars], Domaines, Domaines_singletons) :-
	recupere_domaines_singletons(Vars, Domaines, Domaines_singletons).
	
/* ================================ FIN LISTING ============================= */	
