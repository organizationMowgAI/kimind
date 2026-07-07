/* ========================================================================== */
/*                        PROPAGE LES NOUVELLES CONTRAINTES                   */
/*                              (réponses du système)		                  */	
/* ========================================================================== */

:- module(
         propagation_contraintes3, 
         [
			propage_contraintes_initiales/6,
            propage_contraintes/7
         ]
		 ).
		 
:-   
   use_module(library(clpfd)),
   use_module(library(lists)),
   use_module(liste),
   use_module(affichage_contraintes),
   use_module(bk_contraintes),
   use_module(ajout_suppression_contraintes), 
   use_module(supprime_contraintes),
   use_module(remplace_vars_valeurs),
   use_module(donnees_contraintes),
   use_module(recupere_contraintes),
   use_module(simplifie_equivalences),
   use_module(domaines),
   use_module(contraintes_reductions),
   use_module(utilitaires),
   use_module(operateurs),
   use_module(check_arguments),
   use_module(reductions_reductions),
   use_module(reductions_contraintes),
   use_module(suppression_reductions),
   use_module(compteur),
   use_module(analyse_somme).
   	
/* =============================== DEDUCTIONS =============================== */  

% ----------
	% propage les contraintes initiales en l'absence de premier coup
	% ajoutant de nouvelles contraintes	
propage_contraintes_initiales(Cartes, Domaines, Contraintes, 
                              Domaines_out, Contraintes_out, 
                              Explications_out) :-

	compteur:supprime_tous_compteurs,
	cree_compteur(expli),

    domaines:transforme_domaines(Domaines, Domaines_t),
    utilitaires:degroupe(Contraintes, Contraintes1),
	
	cycles_reductions(Contraintes1, Domaines_t, [], 
                      Domaines2, Contraintes2, Explications_out), 

    % utilitaires:formate_ordre_couleurs(Contraintes2, Contraintes3),
    domaines:retrouve_domaines(Domaines2, Domaines_out),
    
    contraintes:traite_contraintes_exp(Cartes, Contraintes2, 
                                       Domaines_out, Contraintes_out),

	compteur:supprime_compteur(expli).

% ----------
	% propage les Contraintes_reponse
propage_contraintes(Contraintes_reponse, Cartes, Domaines, Contraintes, 
                    Domaines_out, Contraintes_out, Explications_out) :-

	compteur:supprime_tous_compteurs,
	compteur:cree_compteur(expli),

    domaines:transforme_domaines(Domaines, Domaines_t),
    utilitaires:degroupe(Contraintes, Contraintes1),

            % les reponses du systeme sont traitees en premier
    traite_contraintes_reponse(Contraintes_reponse, Domaines_t, Contraintes1,
                               Domaines1, Reductions1, Explications1),

    post_traitement_reponses(Reductions1, Domaines1, Contraintes1,  
                             Domaines2, Contraintes2, 
                             New_contraintes, New_explications),

	liste:display_liste(New_contraintes),
	liste:display_liste(New_explications),
	
	cycles_reductions(New_contraintes, Domaines2, Contraintes2, 
                      DomainesB, ContraintesB, Explications2), 
	liste:display_liste(Explications2),
                    
    liste:    
    append_listes([Explications1, New_explications, Explications2], 
                  Explications_out),

    remplace_vars_valeurs:
    remplace_vars_valeurs(ContraintesB, DomainesB, ContraintesC, _, _),

    supprime_contraintes:
    supprime_contraintes_inutiles(ContraintesC, DomainesB, _,  ContraintesD, _),
            
    domaines:retrouve_domaines(DomainesB, Domaines_out),
    
    contraintes:
	traite_contraintes_exp(Cartes, ContraintesD, Domaines_out, Contraintes_out),

	compteur:supprime_compteur(expli).

% ---------    
	% plus de nouvelle contrainte a exploiter
traite_contraintes_reponse([], Domaines, _Contraintes,  Domaines, [], []) :-
    !.             
     
traite_contraintes_reponse([Contrainte_rep|Contraintes_rep], 
                           Domaines, Contraintes,
                           Domaines_out, Reductions_out, Explications_out) :-
 
	nl,
    write('============== traitement de la reponse '),
    write(Contrainte_rep),
    writeln(' ===================== '),
    nl,     

	running_game:assert(reponse(Contrainte_rep)),	
										    % precise que la contrainte est 
											% une reponse du systeme et non
										    % une deduction
			
      	    % Contrainte_actuelle cree des reductions
           	% et modifie Domaines   	
    contraintes_reductions:
    contrainte_vers_reduction(Contrainte_rep, Domaines, Domaines1, 
                              Reductions1, Explications1),
						
	running_game:retractall(reponse(_)),

	nl,
    write('============== fin traitement de la reponse '),
    write(Contrainte_rep),
    writeln(' ===================== '),
    nl,
	                                   
    traite_contraintes_reponse(Contraintes_rep, Domaines1, Contraintes,
                               Domaines_out,  Reductions2, Explications2),

    append(Reductions1, Reductions2, Reductions_out),
	append(Explications1, Explications2, Explications_out).	

% ----------
    % les reductions des domaines des reponses sont
    % sont transformees
post_traitement_reponses(Reductions, Domaines, Contraintes,
                         Domaines_out, Contraintes_out, 
                         New_contraintes_out, Explications_out) :-
    								
                % les reductions cree de nouvelles reductions
                % et modifie les domaines         
    writeln('----- reductions_vers_reductions'),
    nl,
    
    % gtrace,
    reductions_reductions:
	reductions_vers_reductions(Reductions, Domaines, Contraintes, 
                               Domaines_out, Reductions2, Explications3),  
 
   append(Reductions, Reductions2, Reductions3),

	Reductions4 = Reductions3,
	Explications4 = Explications3,
      
    writeln('----- reductions_vers_contraintes'),     
    nl,
                % les reductions creent des nouvelles contraintes         
    reductions_vers_contraintes(Reductions4, Domaines_out, 
                                New_contraintes, New_explications),

    append(Explications4, New_explications, All_explications),

    writeln('----- variables singletons leurs valeurs'),     
    nl,

	New_contraintes1 = New_contraintes,
	Plus_contraintes1 = [],
	Plus_explications1 = [],
	Contraintes3 = Contraintes,
	Plus_contraintes3 = [],
	Plus_explications3 = [],

            % reunit ce qui va constituer les nouvelles contraintes + expli
    liste:
    append_listes([New_contraintes1, Plus_contraintes1, Plus_contraintes3], 
                  New_contraintes4),
    liste:
    append_listes([All_explications, Plus_explications1, Plus_explications3], 
                  All_explications1),

	New_contraintes_out = New_contraintes4,
	All_explications2 = All_explications1,

	Contraintes_out = Contraintes3,
	ExplicationsA = All_explications2,

    liste:
    retire_listes_vides(ExplicationsA, Explications_out).
    
% ---------    
	% plus de nouvelle contrainte a exploiter
cycles_reductions([], Domaines, Contraintes, Domaines, Contraintes, []) :-
    !.                  
    
    % traite les Contraintes correspondant aux reponses du jeu  
cycles_reductions([New_contrainte|New_contraintes], 
                   Domaines, Contraintes,
				   Domaines_out, Contraintes_out, Explications_out) :-	

	traite_new_contraintes([New_contrainte], 
					        Domaines, Contraintes, 
                            Domaines1, Contraintes1, Exps1),
	                                  
    cycles_reductions(New_contraintes, Domaines1, Contraintes1,
                      Domaines_out, Contraintes_out, Exps2),

	append(Exps1, Exps2, Explications_out).
	
% ----------
	% traite Contrainte_actuelle et toutes les contraintes qui en decoulent
traite_new_contraintes([], Domaines_out, Contraintes_out, 
                           Domaines_out, Contraintes_out, []) :-
	!.

traite_new_contraintes([Contrainte_actuelle|Contraintes_actuelles], 
					    Domaines, Contraintes, 
                        Domaines_out, Contraintes_out, Explications_out) :-
	
	traite_new_contrainte(Contrainte_actuelle, Domaines, Contraintes, 
                          Domaines1, New_contraintes1, Contraintes1,
					      Explications1),
                  
   		append(Contraintes_actuelles, New_contraintes1, New_contraintes2),

    	traite_new_contraintes(New_contraintes2, Domaines1, Contraintes1,
                           	   Domaines_out, Contraintes_out, Explications2),
		append(Explications1, Explications2, Explications_out).
	                                    
% ----------	
    % traite une contrainte (Contrainte_actuelle) 
traite_new_contrainte(Contrainte_actuelle, Domaines, Contraintes, 
                      Domaines_out, New_contraintes_out, 
                      Contraintes_out, Explications_out) :-                     
    nl,
    write('---------- !!!! traitement de la contrainte '),
    write(Contrainte_actuelle),
    writeln('!!!! ---------- '),
    nl,      

    writeln('----- contrainte_vers_reductions'),
    nl,
    	    	% Contrainte_actuelle cree des reductions
           		% et modifie Domaines   	

    % gtrace, 
    contraintes_reductions:
    contrainte_vers_reduction(Contrainte_actuelle, Domaines, Domaines1, 
                              Reductions1, New_exps1),   
    								
                % les reductions cree de nouvelles reductions
                % et modifie les domaines         
    writeln('----- reductions_vers_reductions'),
    nl,
    reductions_reductions:
	reductions_vers_reductions(Reductions1, Domaines1, Contraintes, 
                               Domaines2, Reductions2, New_exps2),  

    writeln('----- analyse somme'),
    recupere_somme([Contrainte_actuelle|Contraintes], Somme),
	% (Somme \= no_somme -> gtrace),   
    analyse_somme:
    analyse_somme(Somme, Domaines2, Domaines_out, Reductions3, New_exps3),   

   append([Reductions1, Reductions2, Reductions3], All_reductions1),
   append([New_exps1, New_exps2, New_exps3], All_explications1), 

   All_reductions2 = All_reductions1,
   All_explications2 = All_explications1,
      
   writeln('----- reductions_vers_contraintes'),     
   nl,
                % les reductions creent des nouvelles contraintes       
	reductions_contraintes: 
    reductions_vers_contraintes(All_reductions2, Domaines_out, 
                                New_contraintes1, New_expsA),

    		% les contraintes d'equivalences sont simplifiees
    		% (certaines contraintes sont ajoutees, d'autres supprimees)   
    writeln('----- simplifications equivalences'),
    nl,

  	simplifie_equivalences:
  	simplifie_equivalences(Contraintes, Domaines_out, 
    	                   Contraintes1, New_contraintes2, New_expsB),

			% simplifie la contrainte actuelle si c'est une equivalence
    simplifie_equivalences:
    simplifie_equivalences([Contrainte_actuelle], Domaines_out, 
    	                    Contrainte_actu, New_contraintes_actu, 
							New_exps_actu),
	writeln(Contrainte_actu),

    append([All_explications2, New_expsA, New_expsB, New_exps_actu], ExpsC),
	liste:
    retire_listes_vides(ExpsC, All_explications3),

	LContrainte_actuelle1 = Contrainte_actu,
	All_explications4 = All_explications3,
       
    		% on remplace des variables par leur unique valeur possible
    writeln('----- remplace variables singletons par leurs valeurs '),
    nl,

	LContrainte_actuelle2 = LContrainte_actuelle1,
	New_contraintes3 = [],
	New_expsY = [],      
	Contraintes2 = Contraintes1,
	New_contraintes4 = [],
	New_expsZ = [],
	                          
    append([All_explications4, New_expsY, New_expsZ], All_explications5),
	liste:
    retire_listes_vides(All_explications5, All_explications6),

	append(Contraintes2, LContrainte_actuelle2, Contraintes3),
	                                              
		% on reunit toutes les nouvelles contraintes
    append(
            [
             	New_contraintes1,
             	New_contraintes2,
				New_contraintes_actu,
             	New_contraintes3,
                New_contraintes4
             ],
             All_new_contraintes
        ),      

	All_new_contraintes_bis = All_new_contraintes,
	All_explications7 = All_explications6,
 	All_new_contraintes1 = All_new_contraintes_bis,
	Nouvelles_contraintes1 = [],
	Nouvelles_explications1 = [],  

    append([All_explications7, Nouvelles_explications1],All_new_exps),   

	liste:
    retire_listes_vides(All_new_exps, All_new_exps1),                 
    append([All_new_contraintes1, Nouvelles_contraintes1], All_new_contraintes2),
  
	All_new_contraintes3 = All_new_contraintes2,
	All_new_exps2 = All_new_exps1,
	
	liste:
    retire_listes_vides(All_new_exps2, Explications_out),

	ordonner_contraintes(All_new_contraintes3, New_contraintes_out),
	ordonner_contraintes(Contraintes3, Contraintes_out).
    
/* ===============================  DIVERS ================================== */

% ----------
recupere_somme(Contraintes, Arg1 + Arg2 = Valeur) :-
	member(Arg1 + Arg2  = Valeur, Contraintes),
	!.

recupere_somme(_Contraintes, no_somme).

% ----------
retire_somme(Contraintes, Contraintes_out, [V1 + V2 = Valeur]) :-
    select(V1 + V2 = Valeur, Contraintes, Contraintes_out),
    !.

retire_somme(Contraintes, Contraintes, []).

% ----------
remplace_somme(Contraintes, Valeur, [V1 + V2 = Valeur|Contraintes1]) :-
    select(V1 + V2 = _Valeur1, Contraintes, Contraintes1),
    !.

remplace_somme(Contraintes, _Valeur, Contraintes).

% ----------
ordonner_contraintes(Contraintes, Contraintes_out) :-
	retire_somme(Contraintes, Contraintes1, LSomme_valeurs),
	ordonner_contraintes2(Contraintes1, Contraintes2),
	append(Contraintes2, LSomme_valeurs, Contraintes_out).
	
% ----------
	% on place les contraintes d'egalite en premier (ce sont les plus fortes)
    % puis les comparaisons <, >, avant et apres,
    % puis \= et pas_meme_rang,
    % => les equivalences sont placees en dernier
ordonner_contraintes2(Contraintes, Contraintes_out) :-
    
	findall(V = V1, select(V = V1, Contraintes, _ContraintesA), 
	        Egalites_valeurs),
	subtract(Contraintes, Egalites_valeurs, Contraintes1),   
     
	findall(C meme_rang C1, select(C meme_rang C1, Contraintes1, _ContraintesB),
			Egalites_couleurs),
	subtract(Contraintes1, Egalites_couleurs, Contraintes3),
  
    findall(V < V1, select(V < V1, Contraintes3, _ContraintesD), 
	        Inf_valeurs),
	subtract(Contraintes3, Inf_valeurs, Contraintes4),   

    findall(V > V1, select(V > V1, Contraintes4, _ContraintesE), 
	        Sup_valeurs),
	subtract(Contraintes4, Sup_valeurs, Contraintes5), 

    findall(C avant C1, select(C avant C1, Contraintes5, _ContraintesF), 
	        Avant_couleurs),
	subtract(Contraintes5, Avant_couleurs, Contraintes6), 

    findall(C apres C1, select(C apres C1, Contraintes6, _ContraintesG), 
	        Apres_couleurs),
	subtract(Contraintes6, Apres_couleurs, Contraintes7), 

    findall(V \= V1, select(V \= V1, Contraintes, _ContraintesH), 
	        Dif_valeurs),
	subtract(Contraintes7, Dif_valeurs, Contraintes8),

    findall(C pas_meme_rang C1, 
             select(C pas_meme_rang C1, Contraintes8, _ContraintesI), 
	        Dif_couleurs),
	subtract(Contraintes8, Dif_couleurs, Contraintes9), 

    liste:append_listes(
		                    [
		                     	Egalites_valeurs, 
		                     	Egalites_couleurs,
		                     	Inf_valeurs,
		                     	Sup_valeurs,
	                     		Avant_couleurs,
                                Apres_couleurs,
                                Dif_valeurs,
                                Dif_couleurs,
                                Contraintes9	
		                     ],
    	                     Contraintes_out
                        ).

/* ============================== FIN LISTING =============================== */
