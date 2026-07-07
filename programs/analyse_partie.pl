/* ========================================================================== */
/*                    ANALYSE UNE PARTIE (DEJA JOUEE) KIMIND                  */
/*                      RECUPERE LE NOMBRE DE SOLUTIONS                       */  
/*                    AVANT LE PREMIER COUP ET APRES CHAQUE COUP              */
/* ========================================================================== */

:- module(
         analyse_partie, 
         [
            analyse_partie/6
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
   use_module(messages),
   use_module(gere_deductions),
   use_module(raisonnement).
   
% ----------   
analyse_partie(Joueur, Nb_cartes, Cartes, Solution, Coups, File_swi) :-
		
	fichier:set_fichier_swi(File_swi),
	fichier:set_fichier_prolog(user_output),

	contraintes:get_contraintes(Cartes, [dom(Domaines_exp)|Contraintes_exp]),
 	domaines:retrouve_domaines(Domaines_exp, Domaines_expA),	

    analyse_coups(Joueur, 1, Nb_cartes, Cartes, Solution, 
                  Cartes_jouees, Domaines_expA, Contraintes_exp,
                  Solution_trouvee, Domaines_exp_out, Contraintes_exp_out),   
         
    bk:ordonne_cartes(Solution_trouvee, Solution_trouvee1),

	writeln(Domaines_exp_out),
	writeln(Contraintes_exp_out),

	messages:message_solution_trouvee(Solution_trouvee1),
  	messages:message_swi(message_solution_trouvee(Solution_trouvee1)).
                                                            
/* ============================== ANALYSE COUPS ============================= */

% ----------
analyse_coups(Joueur, Numero_coup, 0, [], _Solution, 
              _Cartes_jouees, Domaines_exp, Contraintes_exp,
			  [], Domaines_exp, Contraintes_exp) :-
    !,
    Num_coups is Numero_coup-1,

	messages:message_partie_terminee(Num_coups, Joueur),
    message_swi(message_partie_terminee(Num_coups, Joueur)).

analyse_coups(Joueur, Numero_coup, Nb_cartes_a_deviner,
              Cartes, Solution, Cartes_jouees, 
			  Domaines_exp, Contraintes_exp, 
			  Cartes_devinees_out, Domaines_exp_out, Contraintes_exp_out) :-  

   	messages:message_coup(Numero_coup, Nb_cartes_a_deviner),
	messages:message_swi(message_coup(Numero_coup, Nb_cartes_a_deviner)), 
    
    bk_contraintes:solutions(Cartes, Solutions),
	bk_contraintes:solutions_sans_positions(Cartes, Solutions_sans_positions),

	length(Solutions, Nb_solutions),
	writeln(Nb_solutions),
	nl,
	length(Solutions_sans_positions, Nb_solutions_sans_positions),
	writeln(Nb_solutions_sans_positions),

	affichage_contraintes:affiche_solutions_domaines(Cartes),
    affichage_contraintes:swi_affiche_solutions_domaines(Cartes),

    strategie:get_domaines_couleurs(Solutions, Extrema_couleurs),

    (
      Joueur == robot
            % gestion d''un coup     
     -> 
        strategie:get_coup_robot(Solutions, Cartes, Extrema_couleurs,Coup),                      
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

    messages:message_cartes_jouees(Coup1, Cartes),
    messages:message_swi(message_cartes_jouees(Coup1, Cartes)),

	Cartes_exp = Cartes,

    analyse_coup(Coup1, Cartes, New_contraintes), 

	propagation_contraintes:
	propage_contraintes(New_contraintes, Cartes_exp, Domaines_exp, 
					    Contraintes_exp, Domaines_exp1, Contraintes_exp1, 
						_Deductions1),

    affichage_contraintes:
        display_groupes_contraintes_domaines(Domaines_exp1, Contraintes_exp1),
	affichage_contraintes:
		swi_affiche_domaines_contraintes(Cartes),

	gtrace,
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

/* ========================= ANALYSE UN COUP ================================ */

% ----------
joue_coup_robot(Cartes, Coup_reponse, Cartes_out) :- 
	bk_contraintes:calcule_solutions(Cartes, Solutions),
    strategie:get_domaines_couleurs(Solutions, Extrema_couleurs),
    strategie:get_coup_robot(Solutions, Cartes, Extrema_couleurs, Coup),
	traite_coup(Cartes, Coup, Coup_reponse, Cartes_out).

% ----------
joue_coup_joueur(Cartes, Coup_reponse, Cartes_out) :-
	kimind_run:retract(coups([coup(_N, Coup)|Coups])),
	kimind_run:asserta(coups(Coups)),
	traite_coup(Cartes, Coup, Coup_reponse, Cartes_out).

% ----------
traite_coup(Cartes, Coup, Coup_reponse, Cartes_out) :-
    game:solution(Solution),
    bk:reponse_coup(Coup, Solution, CoupA), 
    bk:ordonne_cartes(CoupA, Coup_reponse),

    Cartes_exp = Cartes,
			
	analyse_coup(Coup_reponse, Cartes, New_contraintes), 

    kimind_run:domaines(Domaines),
    kimind_run:contraintes(Contraintes),

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

    with_output_to(string(Explications), 
                   affiche_explications2:
                   affiche_explications_reductions(Reductions1)),

    retire_cartes_devinees2(Coup_reponse, Cartes, Cartes_out, Cartes_devinees),
	kimind_run:incremente_nb_tries,
	kimind_run:ajoute_cartes_devinees(Cartes_devinees),    
    maj_infos_partie(Domaines1, Contraintes1, Explications).
	
% ----------
maj_infos_partie(Domaines1, Contraintes1, Explications1) :-
    kimind_run:retract(domaines(_Domaines)),
    kimind_run:assert(domaines(Domaines1)),
    kimind_run:retract(contraintes(_Contraintes)),
    kimind_run:assert(contraintes(Contraintes1)),
    kimind_run:retract(explications(_Explications)),
    kimind_run:assert(explications(Explications1)).


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
