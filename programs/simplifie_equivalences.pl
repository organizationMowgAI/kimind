/* ========================================================================== */
/*                  VERIFIE L'IMPACTE DES REDUCTIONS DE DOMAINES	              */
/*					     SUR LES CONTRAINTES D'EQUIVALENCE                    */
/* ========================================================================== */

:- module(
          simplifie_equivalences,
          [
           simplifie_equivalences/5
          ]
		 ).
		
:-   
   use_module(library(lists)),
   use_module(liste),
   use_module(bk),
   use_module(ajout_suppression_contraintes),
   use_module(donnees_contraintes),
   use_module(recupere_contraintes),
   use_module(domaines),
   use_module(operateurs),
   use_module(comparaisons).
      
% ---------
	% simplifie les contraintes d'equivalence
	% peut supprimer certaines equivalences et ajouter de nouvelles
	% contraintes                
simplifie_equivalences(Contraintes, Domaines, 
                       Contraintes_out, New_contraintes_out, Exp_out) :-
	simplifie_equivalences2(Contraintes, Domaines, 
	                        Contraintes_out, New_contraintes_out, Exp_out).
		
% ---------
simplifie_equivalences2([], _Domaines, [], [], []) :-
    !.
    
simplifie_equivalences2([Contrainte|Contraintes], Domaines,
                        Contraintes_out, New_contraintes_out, 
						Explications_out) :-         
    compare_contrainte_equivalence(Contrainte, Domaines,
                                   Contrainte1, New_contraintes, Exps1),
    simplifie_equivalences2(Contraintes, Domaines,
                            Contraintes2, New_contraintes1, Exps2),
    append(New_contraintes, New_contraintes1, New_contraintes_out),
    append(Contrainte1, Contraintes2, Contraintes_out),
	append(Exps1, Exps2, Explications_out).
    
% ---------
	% L'equivalence est supprimee si une des comparaisons
	% est evaluee a vrai ou faux
    % apporte eventuellement de nouvelles Contraintes
    
    % on met Comp_couleurs en premier argument de l'equivalence
compare_contrainte_equivalence(Comp_valeurs <=> Comp_couleurs, 
                               Domaines, LContrainte, LNew_contraintes, Exp) :-
	comparaisons:comp_couleurs(Comp_couleurs),
	!,
	compare_contrainte_equivalence(Comp_couleurs <=> Comp_valeurs, 
	                               Domaines, LContrainte, 
								   LNew_contraintes, Exp).
	
		% Comp_couleurs est vraie
compare_contrainte_equivalence(Comp_couleurs <=> Comp_valeurs,
                               Domaines, [], [Comp_valeurs], Exp) :-
	comparaisons:comp_satisfaite(Comp_couleurs, Domaines),	
    !,
	Exp_comp = [],
    ajout_suppression_contraintes:
    simplifie_equivalence_couleur(Comp_couleurs <=> Comp_valeurs,
    	                              Comp_couleurs, Comp_valeurs, Exp_equi),
	append(Exp_comp, Exp_equi, Exp).
    	
		% Comp_couleurs est fausse
        % on supprime l'equivalence
compare_contrainte_equivalence(Comp_couleurs <=> Comp_valeurs, 
							   Domaines, [], [], []) :-	
	comparaisons:comp_insatisfaite(Comp_couleurs, Domaines),
    !,
    ajout_suppression_contraintes:
    supprime_equivalence(Comp_couleurs <=> Comp_valeurs, Comp_couleurs). 
    	                       
	% Comp_valeurs est vraie
compare_contrainte_equivalence(Comp_couleurs <=> Comp_valeurs, 
							   Domaines, [], [Comp_couleurs], Exp) :-	
	comparaisons:comp_satisfaite(Comp_valeurs, Domaines),
    !,
	% gtrace,
	% ajout_suppression_contraintes:
	% ajout_comparaison(Comp_valeurs, Exp_comp),
	Exp_comp = [],
    ajout_suppression_contraintes:
    simplifie_equivalence_valeur(Comp_couleurs <=> Comp_valeurs, 
    	                         Comp_valeurs, Comp_couleurs, Exp_equi),
	append(Exp_comp, Exp_equi, Exp).

  	% Comp_valeurs est fausse
compare_contrainte_equivalence(Comp_couleurs <=> Comp_valeurs, 
							   Domaines, [], [], []) :-	
	comparaisons:comp_insatisfaite(Comp_valeurs, Domaines),	
    !,
    ajout_suppression_contraintes:
    supprime_equivalence(Comp_couleurs <=> Comp_valeurs,  Comp_valeurs).    	         
    	                               
    	% Contrainte non modifiee
compare_contrainte_equivalence(Contrainte, _Domaines, [Contrainte], [], []).
    
/* ============================= FIN LISTING ================================ */ 
