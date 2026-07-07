/* ========================================================================== */
/*                  INITIALISE UNE PARTIE KIMIND (format prolog)              */
/* ========================================================================== */

:- module(
          initialisation, 
          [
            initialisation_partie/8,
            initialisation_partie_robot/7,
            initialisation_robot/5,
			initialisation_enonce/6
          ]
		  ).
		
:- 
   use_module(partie),
   use_module(kimind_prolog),
   use_module(liste),
   use_module(bk_deduction),
   use_module(bk_contraintes),
   use_module(construit_contraintes).
   
:- op(400, xfx, <=>),
   op(400, xfx, avant),
   op(400, xfx, apres),
   op(400, xfx, meme_rang).

% ----------
	% initialise une partie a partir d'un enonce (somme + ordre des couleurs)
initialisation_enonce(Somme, Ordre_couleurs, Couleurs, 
				      Valeurs, Nb_cartes, Cartes) :-
	                          
    memorise_ordre_couleurs(Ordre_couleurs),                
    set_ids_couleurs(Couleurs, Ordre_couleurs),    
	get_ids_des_couleurs(Ids_couleurs),       
	                                                              
	Nb_cartes1 is Nb_cartes-1,
	liste_ordre_croissant(0, Nb_cartes1, Positions),
	
    construit_contraintes:construit_contraintes(
                                        Nb_cartes,
                                        Ids_couleurs, 
                                        Valeurs, 
					                    Positions,
                                        Somme,
		                                Cartes).    
 
% ----------
	% initialise la partie d'un joueur
initialisation_partie(Partie, Nb_cartes, Domaine_couleurs,
                      Domaine_valeurs, Ordre_couleurs, Valeur_somme, 
                      Solution, Cartes_jouees) :-
    partie:get_partie_prolog(nb_cartes, Partie, Nb_cartes),
    partie:get_partie_prolog(cartes_jouees, Partie, Cartes_jouees1),
    change_positions_cartes_jouees(Cartes_jouees1, Cartes_jouees),
    partie:get_partie_prolog(couleurs, Partie, Domaine_couleurs),
    partie:get_partie_prolog(valeurs, Partie, Domaine_valeurs),
    init_couleurs_valeurs(Domaine_couleurs, Domaine_valeurs),
    partie:get_partie_prolog(somme, Partie, Valeur_somme),
    partie:get_partie_prolog(solution, Partie, Solution),
    partie:get_partie_prolog(ordre_couleurs, Partie, Ordre_couleurs).
    
% ----------   
initialisation_partie_robot(Partie, Nb_cartes, Domaine_couleurs,
                            Domaine_valeurs, Ordre_couleurs, 
						    Valeur_somme, Solution) :-
    get_partie_prolog(nb_cartes, Partie, Nb_cartes),

    get_partie_prolog(couleurs, Partie, Domaine_couleurs),
    get_partie_prolog(valeurs, Partie, Domaine_valeurs),
    init_couleurs_valeurs(Domaine_couleurs, Domaine_valeurs),

    get_partie_prolog(somme, Partie, Valeur_somme),
    get_partie_prolog(solution, Partie, Solution),
    get_partie_prolog(ordre_couleurs, Partie, Ordre_couleurs),
	running_game:assert(nb_tries(0)),
	running_game:assert(cartes_devinees([])),
    running_game:assert(explications([])).

% ----------
initialisation_robot(Partie, Nb_cartes, Cartes, Solution, Valeur_somme) :-                
    initialisation_partie_robot(Partie, 
                                Nb_cartes,                                                 
                                Domaine_couleurs,
                                Domaine_valeurs,
                                Ordre_couleurs,
                                Valeur_somme,
                                Solution),                
    memorise_ordre_couleurs(Ordre_couleurs),        
                            
    set_ids_couleurs(Domaine_couleurs, Ordre_couleurs),    
	get_ids_des_couleurs(Ids_couleurs),       
	                                                              
	Nb_cartes1 is Nb_cartes-1,
	liste_ordre_croissant(0, Nb_cartes1, Positions),
	
    construit_contraintes:construit_contraintes(
                                        Nb_cartes,
                                        Ids_couleurs, 
                                        Domaine_valeurs, 
					                    Positions,
                                        Valeur_somme,
		                                Cartes).    
		                   
% ----------
init_couleurs_valeurs(Domaine_couleurs, Domaine_valeurs) :-
	(
		running_game:couleurs(Domaine_couleurs) 
			-> true
			;
			running_game:assertz(couleurs(Domaine_couleurs))
	),
	(
		running_game:valeurs(Domaine_valeurs) 
			-> true
			;
			running_game:assertz(valeurs(Domaine_valeurs))
	).

% ----------
memorise_ordre_couleurs(Ordre_couleurs) :-
    running_game:assert(ordre_couleurs_initial(Ordre_couleurs)),
    ordre_couleurs:convertit_ordre_couleurs(Ordre_couleurs, Ordre_couleurs_bis),
    running_game:assert(ordre_couleurs_bis(Ordre_couleurs_bis)),
    modifie_operateurs_ordre_couleurs(Ordre_couleurs, Ordre_couleurs1),
    distribue_ordre_couleurs(Ordre_couleurs1, Ordre_couleurs2),
	ignore(running_game:retract(ordre_couleurs(_))),
    running_game:assert(ordre_couleurs(Ordre_couleurs2)).

% ----------    
construit_domaines(Couleurs, Valeurs, Nb_cartes, Domaines) :-
 	min_member(Min, Valeurs),
    max_member(Max, Valeurs),
    Nb_cartes1 is Nb_cartes-1,   
    construit_domaines2(Nb_cartes1, Couleurs, Min, Max, Domaines).

% ----------
construit_domaines2(-1, _Couleurs, _Min, _Max, []) :-
    !.
    
construit_domaines2(N, Couleurs, Min, Max, 
                      [d(N, Couleurs, inter(Min,Max))|Cons]) :-
    N1 is N-1,
    construit_domaines2(N1, Couleurs, Min, Max, Cons).

%-----------
modifie_operateurs_ordre_couleurs([], []) :-
    !.

modifie_operateurs_ordre_couleurs([=|Couleurs], [meme_rang|Couleurs1]) :-
    !,
    modifie_operateurs_ordre_couleurs(Couleurs, Couleurs1).

modifie_operateurs_ordre_couleurs([<|Couleurs], [avant|Couleurs1]) :-
    !,
    modifie_operateurs_ordre_couleurs(Couleurs, Couleurs1).

modifie_operateurs_ordre_couleurs([Couleur|Couleurs], [Couleur|Couleurs1]) :-
    modifie_operateurs_ordre_couleurs(Couleurs, Couleurs1).

% ---------
distribue_ordre_couleurs(Couleurs, Distribution) :-
    distribue_ordre_couleurs2(Couleurs, Distribution1),
    donnees_contraintes:domaine_couleurs(Les_couleurs),
    build_couleurs_meme_rang(Les_couleurs, Distribution2),
    append(Distribution1, Distribution2, Distribution).

% ---------
build_couleurs_meme_rang([], []) :-
    !.

build_couleurs_meme_rang([Coul|Couleurs], [meme_rang(Coul, Coul)|Couleurs1]) :-
    build_couleurs_meme_rang(Couleurs,Couleurs1).

% ---------
distribue_ordre_couleurs2([_Couleur], []) :-    
    !.
    
distribue_ordre_couleurs2([Couleur, Op | Ordre], Distribution_out) :-
    distribue(Couleur, Op, Ordre, Distribution),
    distribue_ordre_couleurs2(Ordre, Distribution1),
    append(Distribution, Distribution1, Distribution_out).

% ---------
distribue(Couleur, meme_rang, Ordre, Distribution) :-
    !,
    distribue_egal(Ordre, Couleur, Distribution).

distribue(Couleur, avant , Ordre, Distribution) :-
    distribue_inferieur(Ordre, Couleur, Distribution).

% ----------
distribue_egal([], _Couleur, []) :-
    !.

distribue_egal([meme_rang|Ordre], Couleur, Distribution) :-
    !,    
    distribue_egal(Ordre, Couleur, Distribution).

distribue_egal([avant|Ordre], Couleur, Distribution) :-
    !,
    distribue_inferieur(Ordre, Couleur, Distribution).

distribue_egal([Couleur1|Ordre], Couleur, 
               [Couleur meme_rang Couleur1 |Distribution]) :-
    distribue_egal(Ordre, Couleur, Distribution).

% ----------
distribue_inferieur([], _Couleur, []) :-
    !.

distribue_inferieur([Op|Ordre], Couleur, Distribution) :-
    member(Op, [meme_rang, avant]),
    !,    
    distribue_inferieur(Ordre, Couleur, Distribution).

distribue_inferieur([Couleur1|Ordre], Couleur, 
               [Couleur avant Couleur1 |Distribution]) :-
    distribue_inferieur(Ordre, Couleur, Distribution).

% ----------
change_positions_cartes_jouees([], []) :-
    !.
    
change_positions_cartes_jouees([c(Couleur, Valeur, Position, Temps, 
                                Rep_couleur, Rep_valeur)|Cartes], 
                                [c(Position, Couleur, Valeur, Temps, 
                                Rep_couleur, Rep_valeur) |Cartes1]) :-
    change_positions_cartes_jouees(Cartes, Cartes1). 

/* ============================== FIN LISTING =============================== */ 
