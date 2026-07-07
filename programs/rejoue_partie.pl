/* ========================================================================== */
/*                          ANALYSE UNE PARTIE KIMIND                         */
/* ========================================================================== */

:- module(
         rejoue_partie, 
         [
            prepare_partie/4,
			joue_partie_robot/4,
			joue_partie_joueur/4,
            analyse_coup/3
         ]
		 ).

:-
   use_module(library(clpfd)),
   use_module(library(lists)),
   use_module(kimind_prolog),
   use_module(liste),
   use_module(affiche_explications2),
   use_module(affichage_contraintes),
   use_module(affichage_deductions2),
   use_module(bk),
   use_module(bk_contraintes),
   use_module(strategie),
   use_module(get_coup_clavier),
   use_module(propagation_contraintes3),
   use_module(fichier),
   use_module(domaines),
   use_module(gere_deductions),
   use_module(raisonnement),
   use_module(simplifie_explications),
   use_module(kimind_run).
	 
% ----------
prepare_partie(Cartes, Nb_solutions, Nb_solutions_sans_position,
               Explications_initiales) :-
    contraintes:get_contraintes(Cartes, [dom(Domaines_exp)|Contraintes]),
 	domaines:retrouve_domaines(Domaines_exp, Domaines),
	explications_initiales(Cartes, Domaines, Contraintes, 
						   Domaines1, Contraintes1, Explications_initiales),	
	bk_contraintes:
	nombre_solutions(Cartes, Nb_solutions, Nb_solutions_sans_position),
	maj_infos_partie(Domaines1, Contraintes1, []).

% --------
	% on propage les contraintes initiales avant le premier coup
	% pour reduire les solutions 
explications_initiales(Cartes, Domaines, Contraintes,
                       Domaines1, Contraintes1, Explications) :-

	propage_contraintes_initiales(Cartes, Domaines, Contraintes, 
                                  Domaines1, Contraintes1, Deductions1),

    gere_deductions: 
    analyse_deductions(Deductions1, Deductions2),

    raisonnement:
    explique_deductions(Deductions2, Domaines, Domaines1, 
                        Contraintes, Reductions),

	simplifie_explications:
	simplifie_reductions_domaines(Reductions, Reductions1),

	affiche_explications2:
           affiche_explications_reductions(Reductions1),

    with_output_to(string(Explications), 
                   affiche_explications2:
                   affiche_explications_reductions(Reductions1)).
                                                            
/* ============================== ANALYSE COUPS ============================= */

% ----------
joue_partie_robot([], _Nb_solutions, [], []) :-
	!,
	nl,
	writeln('Partie terminee').

joue_partie_robot(Cartes, Nb_solutions, 
                  [Coup|Coups], [Explication|Explications]) :-
	joue_coup_robot(Cartes, Nb_solutions, Cartes1, Nb_solutions1, 
					Coup, Explication),
	joue_partie_robot(Cartes1, Nb_solutions1, Coups, Explications).
	
% ----------
joue_coup_robot(Cartes, Nb_solutions, Cartes_out, Nb_solutions1, 
				coup(_N, Nb_solutions, Nb_solutions1, Coup_reponse),
                Explication) :- 
	bk_contraintes:calcule_solutions(Cartes, Solutions),
    strategie:get_domaines_couleurs(Solutions, Extrema_couleurs),
    strategie:get_coup_robot(Solutions, Cartes, Extrema_couleurs, Coup),
	traite_coup(Cartes, Coup, Coup_reponse, Cartes_out, Explication),
	bk_contraintes:
    nombre_solutions(Cartes_out, Nb_solutions1, _).

% ----------
joue_partie_joueur([], _Nb_solutions, [], []) :-
	!,
	nl,
	writeln('Partie terminee').

joue_partie_joueur(Cartes, Nb_solutions, 
                   [Coup|Coups], [Explication|Explications]) :-
	joue_coup_joueur(Cartes, Nb_solutions, Cartes1, Nb_solutions1, 
                     Coup, Explication),
	joue_partie_joueur(Cartes1, Nb_solutions1, Coups, Explications).

% ----------
joue_coup_joueur(Cartes, Nb_solutions, Cartes_out, Nb_solutions1, 
				 coup(N, Nb_solutions, Nb_solutions1, Coup_reponse),
                 Explication) :-
	running_game:retract(coups([coup(N, Coup)|Coups])), 
	running_game:asserta(coups(Coups)),
	traite_coup(Cartes, Coup, Coup_reponse, Cartes_out, Explication),
	bk_contraintes:
    nombre_solutions(Cartes_out, Nb_solutions1, _).
	
% ----------
traite_coup(Cartes, Coup, Coup_reponse, Cartes_out, Explication) :-
    bk:ordonne_cartes(Coup, Coup_reponse),

    Cartes_exp = Cartes,
			
	analyse_coup(Coup_reponse, Cartes, New_contraintes), 

    running_game:domaines(Domaines),
    running_game:contraintes(Contraintes),

    propagation_contraintes3:
	propage_contraintes(New_contraintes, Cartes_exp, Domaines, 
					    Contraintes, Domaines1, Contraintes1, Deductions1),

    gere_deductions: 
    analyse_deductions(Deductions1, Deductions2),

	liste:display_liste("deductions2", Deductions2),

    raisonnement:
    explique_deductions(Deductions2, Domaines, Domaines1, 
                        Contraintes, Reductions),

	simplifie_explications:
	simplifie_reductions_domaines(Reductions, Reductions1),

	liste:
	display_liste("reductions1", Reductions1),

	affiche_explications2:
		display_raisonnements_profondeur(Reductions1),

   affiche_explications2:
           affiche_explications_reductions(Reductions1),

    with_output_to(string(Explication), 
                   affiche_explications2:
                   affiche_explications_reductions(Reductions1)),

    retire_cartes_devinees2(Coup_reponse, Cartes, Cartes_out, Cartes_devinees),
	kimind_run:incremente_nb_tries,
	kimind_run:ajoute_cartes_devinees(Cartes_devinees),    
    maj_infos_partie(Domaines1, Contraintes1, Explication).
	
% ----------
maj_infos_partie(Domaines1, Contraintes1, Explications1) :-
	ignore(running_game:retract(domaines(_Domaines))),
    running_game:assert(domaines(Domaines1)),

    ignore(running_game:retract(contraintes(_Contraintes))),
    running_game:assert(contraintes(Contraintes1)),

    ignore(running_game:retract(explications(_Explications))),
    running_game:assert(explications(Explications1)).
                                                      
/* ============================== ANALYSE COUP ============================= */

% ---------- 
    % analyse les reponses du systeme aux cartes jouees (pour un coup)
	% ajoute de nouvelles contraintes en consequence
analyse_coup([], _Cartes,  []) :-  
    !.  
    
analyse_coup([Carte_jouee|Cartes_jouees], Cartes, Contraintes_out) :-
    analyse_reponse(Carte_jouee, Cartes, Contraintes1),
    analyse_coup(Cartes_jouees, Cartes, Contraintes2),
	append(Contraintes1, Contraintes2, Contraintes_out).

% ----------   
analyse_reponse(c(Position, Couleur_jouee, Valeur_jouee, _, 
                  Rep_couleur, Rep_valeur), Cartes, 
				 [Contrainte_couleur, Contrainte_valeur]) :-     
     
    member(c(Position, Var_couleur, Var_valeur), Cartes),
    get_id_couleur(Couleur_jouee, Id_couleur),  
        
    contraintes:var_couleur(Position, Const_var_couleur),
    
    analyse_reponse_couleur(Var_couleur, Const_var_couleur, 
							Id_couleur, Couleur_jouee, 
                            Rep_couleur, Contrainte_couleur),
	
    contraintes:var_valeur(Position, Const_var_valeur),
    
    analyse_reponse_valeur(Var_valeur, Const_var_valeur, 
						   Valeur_jouee, Rep_valeur, Contrainte_valeur).

% ---------
	% analyse les reponses et propage les nouvelles contraintes
	% (pour le solveur du CSP SWI)
    % couleur devinee 
analyse_reponse_couleur(Var_couleur, Const_var_couleur, Id_couleur, 
						Couleur_jouee, oui, 
						Const_var_couleur = Couleur_jouee) :-
    !,
    Var_couleur #= Id_couleur.
      
analyse_reponse_couleur(Var_couleur, Const_var_couleur, Id_couleur, 
						Couleur_jouee, non, 
						Const_var_couleur \= Couleur_jouee) :-                        
    Var_couleur #\= Id_couleur.
 
% ----------
    % valeur cachee devinee 
analyse_reponse_valeur(Var_valeur, Const_var_valeur, 
					   Valeur_jouee, oui, 
					   Const_var_valeur = Valeur_jouee) :-
    !,        
    Var_valeur #= Valeur_jouee.

    % valeur_cachee < Valeur 
analyse_reponse_valeur(Var_valeur, Const_var_valeur, 
					   Valeur_jouee, moins, 
                       Const_var_valeur < Valeur_jouee) :-
    !,        
    Var_valeur #< Valeur_jouee.
     
   % valeur_cachee > Valeur
analyse_reponse_valeur(Var_valeur, Const_var_valeur, 
					   Valeur_jouee, plus, 
                       Valeur_jouee < Const_var_valeur) :-         
    Var_valeur #> Valeur_jouee.

/* ==================================== DIVERS ============================== */

% -----------                                               	
retire_cartes_devinees2([], Cartes, Cartes, []) :-
	!. 

    % carte devinee
retire_cartes_devinees2([c(Position, Couleur, Valeur, _Time, oui, oui)|Coup], 
                        Cartes,  Cartes_out,
                        [c(Position, Couleur, Valeur)|Cartes_devinees]) :-                           
    get_id_couleur(Couleur, Id_couleur),                             
    select(c(Position, Id_couleur, Valeur), Cartes, Cartes1),             
    !,                                         
	retire_cartes_devinees2(Coup, Cartes1, Cartes_out, Cartes_devinees).

retire_cartes_devinees2([_Carte|Coup], Cartes, Cartes_out,
                        Cartes_devinees) :-
	retire_cartes_devinees2(Coup, Cartes, Cartes_out, Cartes_devinees).

%---------- 
    % recupere le coup jouee
get_coup_joueur(Cartes, Nb_cartes_a_deviner, Coup, Cartes_out) :-
    select_n_first(Cartes, Nb_cartes_a_deviner, Cartes_out, Coup).
                           
/* ============================== FIN LISTING =============================== */
