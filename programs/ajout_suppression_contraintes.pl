/* ================== GESTION AJOUT/SUPPRESSION CONTRAINTES ================= */

:- module(
          ajout_suppression_contraintes,
            [
				simplifie_equivalence_couleur/4,
                simplifie_equivalence_valeur/4,
                
                suppression_contrainte/3,
                
                supprime_equivalence/2,

                ajout_comp_valeurs/4,
                ajout_comp_couleurs/4,
                
                suppression_contrainte_domaines/4,
                
                transformation_contrainte/4,
                
                ajout_contrainte/5,
                ajout_contrainte/4,

                ajout_contrainte_domaines_valeur/6,
				ajout_contrainte_domaines_couleur/6,

				ajout_contrainte_borne_valeur/3,
				ajout_contrainte_borne_couleur/3,

                ajout_reduction_max_trop_grand/7,
                ajout_reduction_min_trop_petit/7,
                ajouter_reductions/5,
                ajout_reductions/7,
                
                reduction_deux_vars/7,

                ajout_comparaison/2
            ]
		 ).
		
:-    
   use_module(library(clpfd)),
   use_module(liste),
   use_module(affichage_contraintes),
   use_module(bk_contraintes),
   use_module(donnees_contraintes),
   use_module(operateurs),
   use_module(compteur),
   use_module(affichage_deductions),
   use_module(affiche_explications2),
   use_module(check_arguments).

/* =========================== SIMPLIFICATIONS ============================== */

% ---------
simplifie_equivalence_couleur(Equivalence, Comp_ok, Autre_comp,
					  		 [e(N, simplification_equivalence, 
					         [Comp_ok, Equivalence], [Autre_comp])]) :-
	compteur:lit_compteur(expli, N),
	separateur_contrainte,
    write_contrainte(Comp_ok),
    et,
    writeln_contrainte(Equivalence),
    implique,
    writeln_contrainte(Autre_comp),
    separateur_contrainte,
	saut_contrainte.

% ---------
simplifie_equivalence_valeur(Equivalence, Comp_ok, Autre_comp,
					  		 [e(N, simplification_equivalence, 
					  		 [Comp_ok, Equivalence], [Autre_comp])]) :-
	compteur:lit_compteur(expli, N),
	separateur_contrainte,
    write_contrainte(Comp_ok),
    et,
    writeln_contrainte(Equivalence),
    implique,
    writeln_contrainte(Autre_comp),
    separateur_contrainte,
	saut_contrainte.

/* ================================ SUPPRESSIONS ============================ */

% ----------
    % une des comparaison est fausse, on supprime l'equivalence
supprime_equivalence(Comp1 <=> Comp2, Comp_faux) :-
	separateur_contrainte,
	write_contrainte(Comp_faux),
    writeln(' est faux'),
	implique,
    write('on supprime '),
    writeln_contrainte(Comp1 <=> Comp2),
    separateur_contrainte,
	saut_contrainte.

% ---------
suppression_contrainte(Equivalence, Contrainte, []) :-
	gtrace,
	separateur_contrainte,
    writeln_contrainte(Contrainte),
    implique,
    writeln_contrainte(Equivalence),
    writeln('est supprimee'),
    separateur_contrainte,
    saut_contrainte.

% ---------
suppression_contrainte_domaines(Contrainte, Domaine, Domaine1, []) :-
    Contrainte=..[_Op, Var, Var1],
    separateur_contrainte,
    write('la contrainte '),
    writeln_contrainte(Contrainte),
    writeln('est supprimee car '),
    write('le domaine de '),
    write(Var),
    write(' ('),
    write(Domaine),
    write(') et le domaine de '),
    write(Var1),
    write(' ('),
    write(Domaine1),
    write(')'),
    writeln(' la satisfont'),
    separateur_contrainte,
	saut_contrainte.
   	
% -----------
transformation_contrainte(Contrainte, _Domaines_singletons, _Contrainte1, []) :-
	check_arguments:variables_impliquees(Contrainte, []),
	!. 	

transformation_contrainte(Contrainte, Domaines_singletons, Contrainte1, 
                          [e(N, Type, Antecedents, [Contrainte1])]) :-
	(
		check_arguments:vars_valeurs_impliquees(Contrainte, [])
		-> Type = instantiation_variable_couleur
	    ;  Type = instantiation_variable_valeur
    ),
	compteur:lit_compteur(expli, N),
	separateur_contrainte,
	affichage_deductions:
	write_domaines_singletons(Domaines_singletons, Exps1, '   '),
	writeln_contrainte(Contrainte),
	append(Exps1, [Contrainte], Antecedents),
	implique,
	writeln_contrainte(Contrainte1),
	separateur_contrainte,
	saut_contrainte.
	
/* ================================= AJOUTS ================================= */

% -----------
ajout_comp_valeurs(Comp_coul <=> Comp_val, Domaines_singletons, 
                   Comp_coul1 <=> Comp_val1, []) :-
	separateur_contrainte,
	affichage_deductions:write_domaines_singletons(Domaines_singletons, '   '),
	writeln_contrainte(Comp_coul <=> Comp_val),
	implique,
	writeln_contrainte(Comp_coul1 <=> Comp_val1),
	et_comme,
	write_contrainte(Comp_coul1),
	writeln(' est satisfaite '),
	implique,
	writeln_contrainte(Comp_val1),
	separateur_contrainte,
	saut_contrainte.

% ----------
ajout_comp_couleurs(Comp_coul <=> Comp_val, 
					Domaines_singletons, 
                    Comp_coul1 <=> Comp_val1, 
					[]) :-
	gtrace,
	separateur_contrainte,
	affichage_deductions:write_domaines_singletons(Domaines_singletons, '   '),
	writeln_contrainte(Comp_coul <=> Comp_val),
	implique,
	writeln_contrainte(Comp_coul1 <=> Comp_val1),
	et_comme,
	write_contrainte(Comp_val1),
	writeln(' est satisfaite'),
	implique,
	writeln_contrainte(Comp_coul1),
	separateur_contrainte,
	saut_contrainte.
		
% ---------
ajout_comparaison(Comparaison, 
                  [e(N, comparaison_vraie, [], [Comparaison])]) :-
	compteur:lit_compteur(expli, N),
	separateur_contrainte,
    writeln_contrainte(Comparaison),
    separateur_contrainte,
    saut_contrainte.
	
% ----------
ajout_contrainte_borne_valeur(
			reduction(Var, valeur, _Domaine, Domaine_reduit), 
            [Contrainte],
			[e(N, contrainte_borne_valeur, Antecedents, [Contrainte])]) :-
	compteur:lit_compteur(expli, N),
    separateur_contrainte,
    writeln_domaine(Var, Domaine_reduit),
	Antecedents = [Var dans Domaine_reduit], 
    implique,
    writeln_contrainte(Contrainte),
    separateur_contrainte,
    saut_contrainte.

% ----------
ajout_contrainte_borne_couleur(
			reduction(Var, couleur, Domaine_initial, Domaine_reduit), 
            [Contrainte],
			[e(N, contrainte_borne_valeur, Antecedents, [Contrainte])]) :-
	compteur:lit_compteur(expli, N),
    separateur_contrainte,
	writeln_domaine(Var, Domaine_initial),
	et,
    writeln_domaine(Var, Domaine_reduit),
	Antecedents = [Var dans Domaine_reduit], 
    implique,
    writeln_contrainte(Contrainte),
    separateur_contrainte,
    saut_contrainte.

% ---------
ajout_contrainte_domaines_valeur(_Reduction, _Var1, _Domaine1, 
                                  _Comp_domaines, [], []) :-
	!.

ajout_contrainte_domaines_valeur(
                         reduction(Var, valeur, _Domaine, Domaine_reduit), 
                         Var1, Domaine1, Comp_domaines, [Contrainte],
						 [e(N, contrainte_domaine_valeur, 
                            Antecedents, [Contrainte])]) :-
	compteur:lit_compteur(expli, N),
    separateur_contrainte,
    writeln_domaine(Var, Domaine_reduit),
    et,
    writeln_domaine(Var1, Domaine1),
    et,
	Antecedents = [Var dans Domaine_reduit, Var1 dans Domaine1], 
    write(Domaine_reduit),
    write(' '),
    write(Comp_domaines),
    write(' '),
    writeln(Domaine1),
    implique,
    writeln_contrainte(Contrainte),
    separateur_contrainte,
    saut_contrainte.

% ----------
ajout_contrainte_domaines_couleur(_Reduction, _Var1, _Domaine1, 
                                  _Comp_domaines, [], []) :-
	!.

ajout_contrainte_domaines_couleur(
                         reduction(Var, couleur, _Domaine, [Couleur]), 
                         Var1, [Couleur1], Comp_domaines, [Contrainte],
						 [
							e(-1, contrainte_initiale, [], [Comp_couleurs]),
							e(N, contrainte_domaine_couleur, 
                              Antecedents, [Contrainte])
                         ]) :-
	!,
	compteur:lit_compteur(expli, N),
    separateur_contrainte,
    writeln_domaine(Var, [Couleur]),
    et,
    writeln_domaine(Var1, [Couleur1]),
	et,
	Comp_couleurs =..[Comp_domaines, Couleur, Couleur1],
	Antecedents = [Comp_couleurs, Var dans [Couleur], Var1 dans [Couleur1]], 
    write(Couleur),
    write(' '),
    write(Comp_domaines),
    write(' '),
    writeln(Couleur1),
    implique,
    writeln_contrainte(Contrainte),
    separateur_contrainte,
    saut_contrainte.

ajout_contrainte_domaines_couleur(
                         reduction(Var, couleur, _Domaine, Domaine_reduit), 
                         Var1, Domaine1, Comp_domaines, [Contrainte],
						 [
							e(N, contrainte_domaine_couleur, 
                              Antecedents, [Contrainte])
                         ]) :-
	compteur:lit_compteur(expli, N),
    separateur_contrainte,
    writeln_domaine(Var, Domaine_reduit),
    et,
    writeln_domaine(Var1, Domaine1),
	et,
	Antecedents = [Var dans Domaine_reduit, Var1 dans Domaine1], 
    write(Domaine_reduit),
    write(' '),
    write(Comp_domaines),
    write(' '),
    writeln(Domaine1),
    implique,
    writeln_contrainte(Contrainte),
    separateur_contrainte,
    saut_contrainte.

/* ============================== REDUCTIONS ================================ */

% ---------
ajout_contrainte(_Reduction, _Var1, _Domaine1, [], []) :-
	!.

ajout_contrainte(reduction(Var, _Type, _Domaine, Domaine_reduit), 
                 Var1, Domaine1, [Contrainte], []) :-
    separateur_contrainte,                     
    writeln_domaine(Var, Domaine_reduit),
    et,
    writeln_domaine(Var1, Domaine1),
    implique,
    writeln_contrainte(Contrainte),
    separateur_contrainte,
    saut_contrainte.
    
% ---------    
 ajout_contrainte(Equivalence, Comp_couleurs, Comp_valeurs, []) :-
 	separateur_contrainte,
    writeln_contrainte(Equivalence),
    et,
    writeln_contrainte(Comp_couleurs),
    implique,
    writeln_contrainte(Comp_valeurs),
    separateur_contrainte,
    saut_contrainte.
  
% ----------
ajouter_reductions(_Contrainte, _Domaine1, _Domaine2, [], []) :-
    !.

ajouter_reductions(Arg1 = Arg2, _Domaine1, _Domaine2, Reductions, Expli_out) :-
    !,
    Contrainte = (Arg1 = Arg2),
	compteur:lit_compteur(expli, N),
	check_reponse(N, N1),	% N1 = rep(N) s'il s'agit d'une reponse
	(
		N1 == rep(N)
		-> Expli_contrainte = [e(-1, reponse, [], [Contrainte])]
		;  Expli_contrainte = []
	),
    separateur_contrainte, 
    writeln_contrainte(Contrainte),
	Antecedents = [Contrainte], 
    implique,
    ajouter_reductions2(Reductions, Reductions_exp),
	append(Expli_contrainte, [e(N1, reduction, Antecedents, Reductions_exp)],
		   Expli_out),
	% gtrace,
    separateur_contrainte,
    saut_contrainte.

ajouter_reductions(Contrainte, Domaine1, Domaine2, Reductions, Expli_out) :-
	compteur:lit_compteur(expli, N),
	check_reponse(N, N1),	% N1 = rep(N) s'il s'agit d'une reponse
	(
		N1 == rep(N)
		-> Expli_contrainte = [e(-1, reponse, [], [Contrainte])]
		;  Expli_contrainte = []
	),
	Contrainte=..[_Op, Arg1, Arg2],
    separateur_contrainte, 
    writeln_contrainte(Contrainte),
    (
    	donnees_contraintes:variable(Arg1)
    		->
    			et,
    			writeln_domaine(Arg1, Domaine1),
			 	LArg1 = [Arg1 dans Domaine1]
    		;   
				LArg1 = []
    ),
    (
    	donnees_contraintes:variable(Arg2)
    		->
    			et,
    			writeln_domaine(Arg2, Domaine2),
				LArg2 = [Arg2 dans Domaine2]
    		;   
				LArg2 = []
    ),
	append([LArg1, LArg2, [Contrainte]], Antecedents),
    implique,
    ajouter_reductions2(Reductions, Reductions_exp),
	append(Expli_contrainte, [e(N1, reduction, Antecedents, Reductions_exp)],
		   Expli_out),
    separateur_contrainte,
    saut_contrainte.

% ----------
ajouter_reductions2([], []) :-
    !.

ajouter_reductions2([Reduction|Reductions], [Reduction_exp|Reductions_exp]) :-
    ajout_reduction(Reduction, Reduction_exp),
    ajouter_reductions2(Reductions, Reductions_exp).

% --------- 
ajout_reduction(reduction(Var, _Type, _Domaine, Domaine_reduit),
				Var dans Domaine_reduit) :-            
    writeln_domaine(Var, Domaine_reduit).

% ----------
ajout_reduction_max_trop_grand(Somme, Somme_mins, Domaines, Valeur_max, 
                               Valeur_somme, 
                               reduction(Var, valeur, Domaine, Domaine1),
                               Deductions) :-
    Valeur_somme1 is Valeur_max + Somme_mins,
    separateur_contrainte,
    writeln_contrainte(Somme = Valeur_somme),
    et,
    writeln_domaine(Var, Domaine),
    et,
    si_alors(Var > Valeur_max, Somme > Valeur_somme1),
    implique,
    ajouter_la_reduction(reduction(Var, valeur, Domaine, Domaine1), 
                         _Consequent),
    separateur_contrainte,   
    saut_contrainte,
    cree_deductions_somme_grande(Var, Domaine, Domaine1, Somme, 
                                 Valeur_somme, Somme < Valeur_somme1, 
                                 Domaines,  Valeur_max, Deductions).
% ----------
cree_deductions_somme_grande(
                              Var, Domaine, Domaine_reduit, Somme, 
                              Valeur_somme, 
                              Somme_fautive, Domaines, Valeur_max, 
                              Deductions
                             ) :-
    cree_valeurs_min(Domaines, Valeurs_min),
    cree_deductions_domaines(Domaines, Valeurs_min, Deductions_domaines),
    cree_deduction_si_alors(Var, Domaine, Valeurs_min, Var > Valeur_max, 
                            Somme_fautive, Deduction_si_alors),

    cree_deduction_reduction_somme(somme_trop_grande, 
                                   Somme, Valeur_somme, Var, 
                                   Domaine_reduit,
                                   Deduction_si_alors, 
                                   Deduction_somme),

    append(Deductions_domaines, [Deduction_si_alors, Deduction_somme],
           Deductions).

% ----------
cree_deductions_somme_petite(
                              Var, Domaine, Domaine_reduit, Somme, 
                              Valeur_somme, 
                              Somme_fautive, Domaines, Valeur_min, 
                              Deductions
                            ) :-
    cree_valeurs_max(Domaines, Valeurs_max),
    cree_deductions_domaines(Domaines, Valeurs_max, Deductions_domaines),
    cree_deduction_si_alors(Var, Domaine, Valeurs_max, Var < Valeur_min, 
                            Somme_fautive, Deduction_si_alors),
    
    cree_deduction_reduction_somme(somme_trop_petite, 
                                   Somme, Valeur_somme, Var, Domaine_reduit,
                                   Deduction_si_alors, 
                                   Deduction_somme),

    append(Deductions_domaines, [Deduction_si_alors, Deduction_somme],
           Deductions).

% ----------
ajout_reduction_min_trop_petit(Somme, Somme_maxs, Domaines, Valeur_min, 
                               Valeur_somme, 
                               reduction(Var, valeur, Domaine, Domaine1),
                               Deductions) :-

    Valeur_somme1 is Valeur_min + Somme_maxs,
    separateur_contrainte,
    writeln_contrainte(Somme = Valeur_somme),
    et,
    writeln_domaine(Var, Domaine),
    et,
    si_alors(Var < Valeur_min, Somme < Valeur_somme1),
    implique,
    ajouter_la_reduction(reduction(Var, valeur, Domaine, Domaine1), _Consequent),
    separateur_contrainte,
    saut_contrainte,
    cree_deductions_somme_petite(Var, Domaine, Domaine1, Somme, 
                                 Valeur_somme, Somme < Valeur_somme1, 
                                 Domaines,  Valeur_min, Deductions).

% ----------
cree_deduction_reduction_somme(
                     Type_somme, 
                     Somme, Valeur_somme, Var, Domaine_reduit,
                     e(_N1, si_alors, _Ante, Si_alors),
                     e(N, Type_somme, Antecedents, [dans(Var, Domaine_reduit)])
                               ) :-

    append([Somme = Valeur_somme], Si_alors, Antecedents),
    compteur:lit_compteur(expli, N).
    
% ----------
cree_deduction_si_alors(_Var, _Domaine, Valeurs_extremes, Condition, Consequent, 
                        % e(N, si_alors, Conditions, 
                         e(N, si_alors, Valeurs_extremes, 
                        [si_alors(Condition, Consequent)])) :-
    compteur:lit_compteur(expli, N).
    % append(Valeurs_extremes, [Var dans Domaine], Conditions).

% ----------
cree_deductions_domaines([], [], []) :-
    !.

cree_deductions_domaines([Domaine|Domaines], [Extreme|Extremes], 
                         [Deduction|Deductions]) :- 
    cree_deduction_min_ou_max(Domaine, Extreme, Deduction),
    cree_deductions_domaines(Domaines, Extremes, Deductions).

% ----------
cree_deduction_min_ou_max(Var in Domaine, Extreme, 
                          e(N, Pred, [Var dans Domaine], [Extreme])) :-
    Extreme =..[Pred, Var, _Valeur_extreme],
    compteur:lit_compteur(expli, N).

% ---------- 
cree_valeurs_max([], []) :-
    !.

cree_valeurs_max([Var in Domaine |Domaines], [max(Var,Max)|Valeurs_max]) :-
    max_list(Domaine, Max),
    cree_valeurs_max(Domaines, Valeurs_max).

% ---------- 
cree_valeurs_min([], []) :-
    !.

cree_valeurs_min([Var in Domaine |Domaines], [min(Var,Max)|Valeurs_max]) :-
    min_list(Domaine, Max),
    cree_valeurs_min(Domaines, Valeurs_max).

% ----------
    % aucune reduction
ajout_reductions_couleur(_Contrainte, _Ordre_couleurs,
                         _Var, _Domaine, _Var1, _Domaine1, 
                         _Relations_couleurs, [], []) :-
    !.

    % reduction domaine Var
ajout_reductions_couleur(Contrainte, Var, Domaine, 
                         Var1, Domaine1, Relations_couleurs, Reductions, 
                         [e(N1, reduction, Antecedents, Consequents)]) :-
    !,
    separateur_contrainte,
	writeln_contrainte(Contrainte),
    et,
	writeln_contrainte(Var \= Var1), 
	et,
    writeln_domaine(Var, Domaine),
    et,
    writeln_domaine(Var1, Domaine1),
    et,
    affichage_deductions:antecedents_multiples(Relations_couleurs),
    implique,
    ajouter_les_reductions(Reductions, Consequents),
	% gtrace,
    separateur_contrainte,
    saut_contrainte,
    compteur:lit_compteur(expli, N),
	check_reponse(N, N1),
    append([Contrainte, Var \= Var1, Var dans Domaine, Var1 dans Domaine1], 
            Relations_couleurs, Antecedents).
% ---------
    % aucune reduction
ajout_reductions(_Contrainte, _Var, _Domaine, _Var1, _Domaine1, [], []) :-
    !.

    % reduction domaine de Var1 sachant que Var a un domaine singleton
ajout_reductions(Var = Var1, Var, Domaine, Var1, Domaine1, 
                 [reduction(Var1, valeur, Domaine1, [Valeur])], 
                 [e(N1, reduction, Antecedents, Consequents)]) :-
    !,
    separateur_contrainte,
    writeln_domaine(Var, Domaine),
    et,
    writeln_contrainte(Var = Var1),
    implique,
	% gtrace,
    ajouter_les_reductions([reduction(Var1, valeur, Domaine1, [Valeur])], 
                            Consequents),
    separateur_contrainte,
    saut_contrainte,
    compteur:lit_compteur(expli, N),
	check_reponse(N, N1),
    Antecedents = [Var dans Domaine, Var = Var1].
 
    % reduction domaine Var
ajout_reductions(Contrainte, Var, Domaine, Var1, Domaine1, Reductions, 
                 [e(N1, reduction, Antecedents, Consequents)]) :-
    !,
    separateur_contrainte,
    writeln_domaine(Var, Domaine),
    et,
    writeln_domaine(Var1, Domaine1),
    et,
    writeln_contrainte(Contrainte),
    implique,
	% gtrace,
    ajouter_les_reductions(Reductions, Consequents),
    separateur_contrainte,
    saut_contrainte,
    compteur:lit_compteur(expli, N),
	check_reponse(N, N1),
    Antecedents = [Var dans Domaine, Var1 dans Domaine1, Contrainte].
    
% ----------    
ajouter_les_reductions([Reduction], Exp) :-
	!,
	ajouter_la_reduction(Reduction, Exp).
	
ajouter_les_reductions([Reduction|Reductions], Exps_out) :-
	!,
	ajouter_la_reduction(Reduction, Exp),
	et,
	ajouter_les_reductions(Reductions, Exps),
    append(Exp, Exps, Exps_out).

% ----------
ajouter_la_reduction(reduction(Var, _Type, _Domaine, Domaine_reduit),
					 [Var dans Domaine_reduit]) :-
	writeln_domaine(Var, Domaine_reduit).

% ---------
reduction_deux_vars(_Contrainte, _Var, _Domaine, _Var1, _Domaine1, [], []) :-
    !.

reduction_deux_vars(Contrainte, Var, Domaine, Var1, Domaine1, 
					[reduction(Var_r, Type, Domaine_r, Domaine_reduit)],
					[e(N, reduction, Antecedents, Exp)]) :-
	compteur:lit_compteur(expli, N),
	separateur_contrainte,				
    writeln_domaine(Var, Domaine),
    et,
    writeln_domaine(Var1, Domaine1),
    et,
    writeln_contrainte(Contrainte),
	Antecedents = [Var dans Domaine, Var1 dans Domaine1, Contrainte],
    implique,
    ajouter_la_reduction(reduction(Var_r, Type, Domaine_r, Domaine_reduit),
						 Exp),
    separateur_contrainte,
    saut_contrainte.

/* =============================== DIVERS =================================== */

% ----------
cree_deductions([], []) :-
	!.

cree_deductions([Antecedent|Antecedents], [Deduction|Deductions]) :-
    compteur:lit_compteur(expli, N),
	cree_deduction(Antecedent, N, Deduction),
	cree_deductions(Antecedents, Deductions).

% ----------
cree_deduction(Somme = Valeur, N, e(N, somme, [], [Somme = Valeur])) :-
	!.

cree_deduction(Var dans Domaine, N, 
                    e(N, var_dans_domaine, [], [Var dans Domaine])) :-
	!.

cree_deduction(max(V, Max),  N,
					e(N, max, [], [max(V,Max)])) :-
	!.

cree_deduction(min(V, Min), N,
					e(N, min, [], [min(V, Min)])) :-
	!.

cree_deduction(si_alors(Si, Alors), N,
					e(N, si_alors, [], [si_alors(Si, Alors)])).

% ----------
check_reponse(N, rep(N)) :-
	running_game:reponse(_Contrainte),
	!.

check_reponse(N, N).

/* ============================ FIN LISTING ================================= */ 
