/* ======================= REDUCTIONS VERS CONTRAINTES ====================== */

:- module(
          reductions_contraintes, 
          [
            reductions_vers_contraintes/4
          ]
		 ).
		 
:-   
   use_module(library(clpfd)),
   use_module(ajout_suppression_contraintes),
   use_module(operateurs),
   use_module(donnees_contraintes),
   use_module(domaines).

% ----------
reductions_vers_contraintes(Reductions, Domaines, 
                            Contraintes_out, Explications_out) :-
	reductions_vers_contraintes2(Reductions, Domaines, 
                                 Contraintes1, Explications1),
	contraintes_bornes_domaines(Reductions, Contraintes2, Explications2),
	append(Contraintes1, Contraintes2, Contraintes_out),
	append(Explications1, Explications2, Explications_out).
	
% ----------
	% une reduction du domaine d'une variable apporte au moins une
    % nouvelle contraintes sur une de ses bornes
contraintes_bornes_domaines([], [], []) :-
	!.

contraintes_bornes_domaines([Reduction|Reductions], 
							Contraintes_out, Explications_out) :-
	compare_bornes_domaines(Reduction, Contraintes, Explications),
	contraintes_bornes_domaines(Reductions, Contraintes1, Explications1),
	append(Contraintes, Contraintes1, Contraintes_out),
	append(Explications, Explications1, Explications_out).
	
% ----------
compare_bornes_domaines(reduction(Var, valeur, Dom0, Dom1), 
						Contraintes, Explications) :-
	min_list(Dom0, Min0),
	min_list(Dom1, Min1),
	(
		Min1 > Min0
		->
			MinA is Min1-1,
			Contrainte1 = [MinA < Var],
			ajout_suppression_contraintes:
			ajout_contrainte_borne_valeur(reduction(Var, valeur, Dom0, Dom1), 
		                                  Contrainte1, Explication1)
		;
			Contrainte1 = [],
			Explication1 = []
    ),
	max_list(Dom0, Max0),
	max_list(Dom1, Max1),
	(
		Max1 < Max0
		->
			MaxA is Max1 + 1,
			Contrainte2 = [Var < MaxA],
			ajout_suppression_contraintes:
			ajout_contrainte_borne_valeur(reduction(Var, valeur, Dom0, Dom1), 
		                                  Contrainte2, Explication2)
		;
			Contrainte2 = [],
			Explication2 = []
    ),
	append(Contrainte1, Contrainte2, Contraintes),
	append(Explication1, Explication2, Explications).

compare_bornes_domaines(reduction(Var, couleur, Dom0, Dom1), 
						Contraintes, Explications) :-

	subtract(Dom0, Dom1, Couleurs_retirees),
	ajoute_contraintes_borne_couleur(reduction(Var, couleur, Dom0, Dom1),
									 Couleurs_retirees, 
									 Contraintes, Explications). 

% -----------
ajoute_contraintes_borne_couleur(_Reduction, [], [], []) :-
	!.

ajoute_contraintes_borne_couleur(reduction(Var, couleur, Dom0, Dom1),
								 [Couleur|Couleurs_retirees],
                                 Contraintes_out, Explications_out) :-

	ajout_suppression_contraintes:
	ajout_contrainte_borne_couleur(reduction(Var, couleur, Dom0, Dom1), 
		                           [Var \= Couleur], Explication),

	ajoute_contraintes_borne_couleur(reduction(Var, couleur, Dom0, Dom1),
								     Couleurs_retirees,
                                     Contraintes1, Explications1),
	append([Var \= Couleur], Contraintes1, Contraintes_out),
	append(Explication, Explications1, Explications_out).
	
% ---------
    % Les reductions des domaines apportent de nouvelles contraintes
reductions_vers_contraintes2([], _Domaines, [], []) :-
    !.
    
reductions_vers_contraintes2([Reduction|Reductions], Domaines, 
                             Contraintes_out, Explications_out) :-
    reduction_vers_contraintes(Domaines, Reduction, Contraintes, Exps1),
    reductions_vers_contraintes2(Reductions, Domaines, Contraintes1, Exps2),
    append(Contraintes, Contraintes1, Contraintes_out),
	append(Exps1, Exps2, Explications_out).
    
% ---------
    % verifie l'impact de la reduction du domaine d'une variable
    % sur les autres variables
reduction_vers_contraintes([], _Reduction, [], []) :-
    !.

reduction_vers_contraintes([Dom|Domaines], Reduction, 
							Contraintes_out, Explications_out) :-
    reduction_vers_contrainte(Reduction, Dom, Contraintes, Exp1),
    reduction_vers_contraintes(Domaines, Reduction, Contraintes1, Exps),
    append(Contraintes, Contraintes1, Contraintes_out),
	append(Exp1, Exps, Explications_out).
	
% ---------
    % verifie si la reduction apporte une nouvelle contrainte
    
    % meme variable, on passe
reduction_vers_contrainte(reduction(Var, _Type, _D0, Domaine), 
                          Var in Domaine, [], []) :-
    !.

    % deux variables couleurs
reduction_vers_contrainte(reduction(Var, couleur, D0, Dom), 
                          Var1 in Dom1, Contraintes, Exp) :-
    donnees_contraintes:type_variable(Var1, couleur),
    !,
    domaines:compare_domaines_couleur(Dom, Dom1, Ordre_domaine),
    ordre_couleurs_contrainte(Var, Var1, Ordre_domaine, Contraintes),
    ajout_suppression_contraintes:
    ajout_contrainte_domaines_couleur(reduction(Var,couleur, D0, Dom), 
                                      Var1, Dom1, Ordre_domaine, 
									  Contraintes, Exp).
    
    % deux variables valeurs
reduction_vers_contrainte(reduction(Var, valeur, D0, Dom), 
                          Var1 in Dom1, Contraintes, Exp) :-
    donnees_contraintes:type_variable(Var1, valeur),
    domaines:compare_domaines_valeur(Dom, Dom1, Ordre_domaine),
    ordre_valeurs_contrainte(Var, Var1, Ordre_domaine, Contraintes),
    !,
    ajout_suppression_contraintes:
    ajout_contrainte_domaines_valeur(reduction(Var, valeur, D0, Dom), 
                                     Var1, Dom1, Ordre_domaine, 
									 Contraintes, Exp).
    
    % deux variables de type differents, on passe
reduction_vers_contrainte(_Reduction, _Domaine, [], []).

% ---------
    % toutes les valeurs du domaine de Var sont avant les valeurs
    % du domaine de Var1
ordre_valeurs_contrainte(Var, Var1, <, [Var < Var1]) :-
    !.
    
ordre_valeurs_contrainte(Var, Var1, =<, [Var =< Var1]) :-
    !.
        
ordre_valeurs_contrainte(Var, Var1, >, [Var1 < Var]) :-
    !.
    
ordre_valeurs_contrainte(Var, Var1, >=, [Var1 =< Var]) :-
    !.

ordre_valeurs_contrainte(Var, Var1, =, [Var = Var1]) :-
    !.
    
ordre_valeurs_contrainte(_Var, _Var1, aucun, []).    

% ----------
ordre_couleurs_contrainte(Var, Var1, avant, [Var avant Var1]) :-
    !.
    
ordre_couleurs_contrainte(Var, Var1, avant_meme_rang, 
                          [Var avant_meme_rang Var1]) :-
    !.
        
ordre_couleurs_contrainte(Var, Var1, apres, [Var1 avant Var]) :-
    !.
    
ordre_couleurs_contrainte(Var, Var1, apres_meme_rang, 
                          [Var1 avant_meme_rang Var]) :-
    !.

% ordre_couleurs_contrainte(Var, Var1, meme_rang, [Var = Var1]) :-
ordre_couleurs_contrainte(Var, Var1, meme_rang, [Var meme_rang Var1]) :-
    !.

ordre_couleurs_contrainte(_Var, _Var1, pas_meme_rang, []) :-
    !.
    
ordre_couleurs_contrainte(_Var, _Var1, aucun, []).   

/* ================================ FIN LISTING ============================= */   
