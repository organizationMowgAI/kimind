/* ========================================================================== */
/*                          ANALYSE UNE PARTIE KIMIND                         */
/*                             (version graphique)                            */
/* ========================================================================== */

:- module(
         analyse_partie_graphique, 
         [
            prepare_partie/3,
            joue_partie/11
         ]
		 ).
		 
:- 
   use_module(library(clpfd)),
   use_module(library(lists)),
   use_module(kimind_prolog),
   use_module(liste),
   use_module(affichage_contraintes),
   use_module(affichage_deductions),
   use_module(bk),
   use_module(bk_contraintes),
   use_module(strategie),
   use_module(get_coup_clavier),
   use_module(propagation_contraintes),
   use_module(fichier),
   use_module(domaines),
   use_module(gere_deductions),
   use_module(raisonnement),
   use_module(client_kimind).
   
% ----------
prepare_partie(Cartes, Domaines, Contraintes) :-
    contraintes:get_contraintes(Cartes, [dom(Domaines_exp)|Contraintes]),
 	domaines:retrouve_domaines(Domaines_exp, Domaines).

% ----------   
joue_partie(Joueur, Nb_cartes, Cartes, Solution, Domaines, Contraintes) :-
	
	gtrace,
    analyse_coups(Joueur, 1, Nb_cartes, Cartes, Solution, 
                  Domaines, Contraintes,
                  Solution_trouvee, Domaines_exp_out, Contraintes_exp_out),   
         
    bk:ordonne_cartes(Solution_trouvee, Solution_trouvee1).
                                                           
/* ============================== ANALYSE COUPS ============================= */

% ----------
analyse_coups(Joueur, Numero_coup, 0, [], _Solution, 
              _Cartes_jouees, Domaines, Contraintes,
			  [], Domaines, Contraintes) :-
    !,
    Num_coups is Numero_coup-1,

	messages:message_partie_terminee(Num_coups, Joueur),
    message_swi(message_partie_terminee(Num_coups, Joueur)).

analyse_coups(Joueur, Numero_coup, Nb_cartes_a_deviner,
              Cartes, Solution, Cartes_jouees, 
			  Domaines_exp, Contraintes_exp, 
			  Cartes_devinees_out, Domaines_exp_out, Contraintes_exp_out) :-  
  
	gtrace,
    bk_contraintes:calcule_solutions(Cartes, Solutions),
    bk_strategie:get_domaines_couleurs(Solutions, Extrema_couleurs),

	affichage_contraintes:affiche_solutions_domaines(Cartes),
    affichage_contraintes:swi_affiche_solutions_domaines(Cartes),
 
    (
      Joueur == robot
            % gestion d''un coup     
     -> 
        bk_strategie:get_coup_robot(Solutions, Cartes, Extrema_couleurs,Coup),                      
        bk:reponse_coup(Coup, Solution, CoupA),  % ajoute reponse au coup
        bk:ordonne_cartes(CoupA, Coup1)          
     ;  
     (
        Joueur == joueur
         -> 
            get_coup_joueur(Cartes_jouees, Nb_cartes_a_deviner, Coup, 
                            Cartes_jouees1),       % Coup contient la reponse          
            bk:ordonne_cartes(Coup, Coup1)
         ;     
            get_coup_clavier:get_coup_clavier(Cartes, Coup),      
            bk:reponse_coup(Coup, Solution, CoupA),
            bk:ordonne_cartes(CoupA, Coup1)  
     )   
    ),

    client_kimind:affiche_coup(Port_client, Coup1),

	Cartes_exp = Cartes,

    analyse_coup(Coup1, Cartes, New_contraintes), 

	propagation_contraintes:
	propage_contraintes(New_contraintes, Cartes_exp, Domaines_exp, 
					    Contraintes_exp, Domaines_exp1, Contraintes_exp1, 
						Deductions1),

	gere_deductions: 
    analyse_deductions(Deductions1, Deductions2),

    raisonnement:
    explique_deductions(Deductions2, Domaines_exp, Domaines_exp1, 
                        Contraintes_exp, Explications),

    gtrace,
	affiche_explications:
    display_raisonnements_profondeur(Explications),

    retire_cartes_devinees2(Coup1, Cartes, Cartes2, Cartes_devinees),    
                               
    length(Cartes2, Nb_cartes_a_deviner1),             
    display_cartes_devinees(Joueur, Cartes_devinees),
    
    Numero_coup1 is Numero_coup+1,

    analyse_coups(Joueur, Numero_coup1, Nb_cartes_a_deviner1, 
                  Cartes2, Solution, 
				  Cartes_jouees1, Domaines_exp1, Contraintes_exp1,
                  Cartes_devinees1, Domaines_exp_out, Contraintes_exp_out
                  ),
                  
    append(Cartes_devinees, Cartes_devinees1, Cartes_devinees_out).

% ---------- 
    % analyse les reponses du systeme aux cartes jouees (pour un coup)
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
