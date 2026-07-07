/* ====================== REDUCTIONS VERS REDUCTIONS ======================== */ 

:- module(
          reductions_reductions, 
          [
            reductions_vers_reductions/6
          ]
		 ).
		 
:-   
   use_module(ajout_suppression_contraintes),
   use_module(recupere_contraintes),
   use_module(utilitaires),
   use_module(operateurs),
   use_module(contraintes_reductions),
   use_module(gere_deductions),
   use_module(deduction).
   
% ---------
    % engendre de nouvelles reductions a partir de Reductions
reductions_vers_reductions([], Domaines, _Contraintes,  Domaines, [], []) :-
    !.
    
reductions_vers_reductions([Reduction|Reductions], Domaines, Contraintes, 
                            Domaines_out, Nouvelles_reductions_out,
							Exps_out) :-       
    reduction_vers_reductions(Reduction, Domaines, Contraintes, 
                              Domaines1, Nouvelles_reductions, Exps1),
    append(Nouvelles_reductions, Reductions, Reductions2),
    reductions_vers_reductions(Reductions2, Domaines1, Contraintes, 
                               Domaines_out, Nouvelles_reductions1, Exps2),
    append(Nouvelles_reductions, Nouvelles_reductions1, 
           Nouvelles_reductions_out), 
	append(Exps1, Exps2, Exps_out).
% ---------
reduction_vers_reductions(Reduction, Domaines, Contraintes, 
                          Domaines_out,  Reductions_out, Exp_out) :-           
    check_arguments:variables_impliquees(Reduction,  Vars_c, Vars_v),   
    recupere_contraintes(Contraintes,  Vars_c, Vars_v, 
                         Contraintes1, _Contraintes_restantes),                 
    reduction_reductions(Contraintes1, Reduction, Domaines, 
                         Domaines_out, Reductions_out, Exp_out).

% ---------
    % traite de possibles reductions des domaines du a Reduction
    % on a explore toutes les contraintes
reduction_reductions([], _Reduction, Domaines, Domaines, [], []) :-
    !.

    % Reduction concerne 
reduction_reductions([Contrainte|Contraintes], Reduction, 
                     Domaines, Domaines_out, Reductions_out, Exps_out) :-               
    reduction_contrainte(Reduction, Contrainte, Domaines, 
                         Domaines1, Reductions1, Exps1),
    reduction_reductions(Contraintes, Reduction, Domaines1, 
                         Domaines_out, Reductions2, Exps2),
    append(Reductions1, Reductions2, Reductions_out),
	append(Exps1, Exps2, Exps_out).
                         
% ---------
    % la contrainte est une comparaison de couleurs
reduction_contrainte(reduction(Var, couleur, _Domaine_var0, _Domaine_var), 
                              Contrainte, Domaines, Domaines1, 
							  Reductions, Exp) :-
    comparaison_couleurs(Contrainte),
    !,
    analyse_ordre_couleurs(Contrainte, Var, Contrainte1),
	contraintes_reductions:
    contrainte_vers_reduction(Contrainte1, Domaines, Domaines1, 
							  Reductions, Exp).
    
reduction_contrainte(reduction(Var, valeur, _Domaine_var0, _Domaine_var), 
                              Contrainte, Domaines, 
                              Domaines1, Reductions, Exp) :-
    comparaison_valeurs(Contrainte),
    !,
    analyse_ordre_valeurs(Contrainte, Var, Contrainte1),

	contraintes_reductions:
    contrainte_vers_reduction(Contrainte1, Domaines, Domaines1, 
                              Reductions, Exp).
       
reduction_contrainte(reduction(Var, valeur, _Domaine_var0, _Domaine_var), 
                              Contrainte, Domaines, 
                              Domaines1, Reductions, Exp) :-
    addition_binaire(Contrainte),
    !,
    analyse_somme(Contrainte, Var, Contrainte1),
	contraintes_reductions:
    contrainte_vers_reduction(Contrainte1, Domaines, Domaines1, 
                              Reductions, Exp).
    
    % aucune reduction possible
reduction_contrainte(_Reduction, _Contrainte, Domaines, Domaines,  [], []).


% ----------
analyse_somme(Var + Var1 = Valeur, Var, Var + Var1 = Valeur) :-
	!.
	
analyse_somme(Var1 + Var = Valeur, Var, Var + Var1 = Valeur).

% --------------
	 % on place Var1 en deuxième argument

	% meme_rang
analyse_ordre_couleurs(Var meme_rang Var1, Var, Var meme_rang Var1) :-
    !.

analyse_ordre_couleurs(Var1 meme_rang Var, Var, Var meme_rang Var1) :-
    !.

	% egale
analyse_ordre_couleurs(Var = Var1, Var, Var = Var1) :-
    !.

analyse_ordre_couleurs(Var1 = Var1, Var, Var = Var1) :-
    !.

	% differents
analyse_ordre_couleurs(Var \= Var1, Var, Var \= Var1) :-
    !.

analyse_ordre_couleurs(Var1 \= Var, Var, Var \= Var1).

	% avant
analyse_ordre_couleurs(Var avant Var1, Var, Var avant Var1) :-
    !.

analyse_ordre_couleurs(Var1 avant Var, Var, Var apres Var1) :-
    !.

	% avant_meme_rang
analyse_ordre_couleurs(Var avant_meme_rang Var1, Var, 
					   Var avant_meme_rang Var1) :-
    !.

analyse_ordre_couleurs(Var1 avant_meme_rang Var, Var, 
					   Var apres_meme_rang Var1) :-
    !.


	% avant
analyse_ordre_couleurs(Var apres Var1, Var, Var apres Var1) :-
    !.

analyse_ordre_couleurs(Var1 apres Var, Var, Var avant Var1) :-
    !.

	% avant_meme_rang
analyse_ordre_couleurs(Var apres_meme_rang Var1, Var, 
					   Var apres_meme_rang Var1) :-
    !.

analyse_ordre_couleurs(Var1 apres_meme_rang Var, Var, 
					   Var avant_meme_rang Var1) :-
    !.

% -------------
		% on place Var1 en second argument
analyse_ordre_valeurs(Var + Var1, Var, Var + Var1) :-
    !.
    
analyse_ordre_valeurs(Var1 + Var, Var, Var + Var1) :-
    !.
    
analyse_ordre_valeurs(Var = Var1, Var, Var = Var1) :-
    !.

analyse_ordre_valeurs(Var1 = Var, Var, Var = Var1) :-
    !.

analyse_ordre_valeurs(Var \= Var1, Var, Var \= Var1) :-
    !.

analyse_ordre_valeurs(Var1 \= Var, Var, Var \= Var1) :-
    !.

analyse_ordre_valeurs(Var < Var1, Var, Var < Var1) :-
    !.

analyse_ordre_valeurs(Var1 < Var, Var, Var > Var1) :-
    !.
    
analyse_ordre_valeurs(Var =< Var1, Var, Var =< Var1) :-
    !.

analyse_ordre_valeurs(Var1 =< Var, Var, Var >= Var1) :-
	!.

analyse_ordre_valeurs(Var > Var1, Var, Var > Var1) :-
    !.

analyse_ordre_valeurs(Var1 > Var, Var, Var < Var1) :-
    !.
    
analyse_ordre_valeurs(Var >= Var1, Var, Var >= Var1) :-
    !.

analyse_ordre_valeurs(Var1 >= Var, Var, Var =< Var1).

% -------------
addition_binaire(V1 + V2 = _Valeur) :-
    atom(V1),
    atom(V2).

/* ================================ FIN LISTING ============================= */
