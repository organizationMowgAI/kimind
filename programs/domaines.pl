:- module(
          domaines,
          [
          	   get_domaines_cartes/2,
          	   
               isole_domaines/3, 
               
               compare_domaines_valeur/3,
               compare_domaines_couleur/3,
               
               domaine/3,
               
               transforme_domaines/2,
               retrouve_domaines/2,
               
               couleurs_avant_valeur/3,
               couleurs_avant_meme_rang_valeur/3,
               couleurs_apres_valeur/3,
               couleurs_apres_meme_rang_valeur/3
         ]
		 ).

:- 
   use_module(library(clpfd)),
   use_module(donnees_contraintes),
   use_module(ordre_couleurs),
   use_module(liste).
		
/* =============================== DOMAINES ================================= */
 
% ----------
	% retourne les domaines des valeurs et couleurs de chaque carte
get_domaines_cartes([], []) :-
	!.
	
get_domaines_cartes([Carte|Cartes], [Domaine_carte|Domaines_cartes]) :-
	get_domaine_carte(Carte, Domaine_carte),
	get_domaines_cartes(Cartes, Domaines_cartes).
	
% ----------
get_domaine_carte(c(Position, Couleur, Valeur), 
                  c(Position, Domaine_couleur1, Domaine_valeur)) :-
	domaine_liste(Couleur, Domaine_couleur),
	bk_contraintes:retrouve_couleurs(Domaine_couleur, Domaine_couleur1),
	domaine_liste(Valeur, Domaine_valeur).
	
% ----------	
domaine_liste(Var, Liste) :-
    fd_dom(Var, Dom),      % Récupérer le domaine
    domaine_to_liste(Dom, Liste).

% ----------
domaine_to_liste(empty, []) :-
	!.
	
domaine_to_liste(A, [A]) :-
	(atom(A) ; number(A)),
	!.
	
domaine_to_liste(From..To, Liste) :-
	!,
	numlist(From, To, Liste).

domaine_to_liste(Dom1 \/ Dom2, Liste) :-
    domaine_to_liste(Dom1, Liste1),
    domaine_to_liste(Dom2, Liste2),
    append(Liste1, Liste2, Liste).
    
% ----------
isole_domaines([], [], []) :-
    !.

isole_domaines([Groupe|Groupes], Domaines, [Groupe1|Groupes1]) :-
    isole_domaines_groupe(Groupe, Domaines1, Groupe1),
    isole_domaines(Groupes, Domaines2, Groupes1),
    append(Domaines1, Domaines2, Domaines).

% ----------
isole_domaines_groupe(co(Contraintes), Domaines, co(Contraintes1)) :-
    !,
    domaines_contraintes(Contraintes, Domaines, Contraintes1).

isole_domaines_groupe(co(Carte, Contraintes), Domaines, 
                      co(Carte, Contraintes1)) :-
    !,
    domaines_contraintes(Contraintes, Domaines, Contraintes1).

isole_domaines_groupe(co(Carte1, Carte2, Contraintes), Domaines, 
                      co(Carte1, Carte2, Contraintes1)) :-
    domaines_contraintes(Contraintes, Domaines, Contraintes1).

% ----------
domaines_contraintes([], [], []) :-
    !.

domaines_contraintes([A in Domaine|Contraintes], [A in Domaine|Domaines], 
                     Contraintes1) :-
    !,
    domaines_contraintes(Contraintes, Domaines, Contraintes1).

domaines_contraintes([Contrainte|Contraintes], Domaines, 
                     [Contrainte|Contraintes1]) :-
    domaines_contraintes(Contraintes, Domaines, Contraintes1).

% ---------
    % selectionne les couleurs de Domaine qui sont avant Couleur
    % dans l'ordre des couleurs
couleurs_avant_valeur(Domaine, Couleur, Domaine_out) :-
    running_game:ordre_couleurs(Ordre_couleurs),
    couleurs_avant_valeur2(Domaine, Ordre_couleurs, Couleur, Domaine_out).

% ---------
couleurs_avant_valeur2([], _Ordre_couleurs, _Valeur, []) :-
    !.

couleurs_avant_valeur2([Couleur1|Couleurs], Ordre_couleurs, Couleur, 
                       [Couleur1|Couleurs1]) :-
    select(avant(Couleur1, Couleur), Ordre_couleurs, Ordre_couleurs1),
    !,
    couleurs_avant_valeur2(Couleurs, Ordre_couleurs1, Couleur, Couleurs1).

couleurs_avant_valeur2([_Couleur1|Couleurs], Ordre_couleurs, Couleur, 
                       Couleurs1) :-
    couleurs_avant_valeur2(Couleurs, Ordre_couleurs, Couleur, Couleurs1).

% ---------
    % selectionne les couleurs de Domaine qui sont avant Couleur
    % dans l'ordre des couleurs
couleurs_avant_meme_rang_valeur(Domaine, Couleur, Domaine_out) :-
    kimind_run:ordre_couleurs(Ordre_couleurs),
    couleurs_avant_meme_rang_valeur2(Domaine, Ordre_couleurs, Couleur, 
                                     Domaine_out).
% ---------
couleurs_avant_meme_rang_valeur2([], _Ordre_couleurs, _Valeur, []) :-
    !.

couleurs_avant_meme_rang_valeur2([Couleur1|Couleurs], Ordre_couleurs, Couleur, 
                       			 [Couleur1|Couleurs1]) :-
    check_avant_meme_rang(Couleur1, Couleur, Ordre_couleurs, Ordre_couleurs1),
    !,
    couleurs_avant_meme_rang_valeur2(Couleurs, Ordre_couleurs1, Couleur, 
                                     Couleurs1).

couleurs_avant_meme_rang_valeur2([_Couleur1|Couleurs], Ordre_couleurs, Couleur, 
                                 Couleurs1) :-
    couleurs_avant_meme_rang_valeur2(Couleurs, Ordre_couleurs,  
                                     Couleur, Couleurs1).

% ----------
check_avant_meme_rang(Couleur1, Couleur, Ordre_couleurs, Ordre_couleurs1) :-
	select(avant(Couleur1, Couleur), Ordre_couleurs, Ordre_couleurs1),
	!.

check_avant_meme_rang(Couleur1, Couleur, Ordre_couleurs, Ordre_couleurs1) :-
	select(meme_rang(Couleur1, Couleur), Ordre_couleurs, Ordre_couleurs1),
	!.

check_avant_meme_rang(Couleur1, Couleur, Ordre_couleurs, Ordre_couleurs1) :-
	select(meme_rang(Couleur, Couleur1), Ordre_couleurs, Ordre_couleurs1).

% ----------
   % selectionne les couleurs de Domaine qui sont apres Couleur
   % dans l'ordre des couleurs
couleurs_apres_valeur(Domaine, Couleur, Domaine_out) :-
  couleurs_avant_meme_rang_valeur(Domaine, Couleur, Domaine1),
  subtract(Domaine, Domaine1, Domaine_out).

   % selectionne les couleurs de Domaine qui sont apres ou au meme 
   % rang que Couleur dans l'ordre des couleurs
couleurs_apres_meme_rang_valeur(Domaine, Couleur, Domaine_out) :-
  couleurs_avant_valeur(Domaine, Couleur, Domaine1),
  subtract(Domaine, Domaine1, Domaine_out).


% ---------
    % passe de co in [couleurs], v0 in [valeurs] a 
    % c(0, [couleurs], [valeurs])
retrouve_domaines([], []) :-
    !.
        % variable couleur, on recupere la variable valeur de meme numero
retrouve_domaines(
        [Var_couleur in Domaine_couleurs|Domaines], 
        [c(Position, Domaine_couleurs, Domaine_valeurs)|Domaines_out]
                 ) :-
    atom_concat(c, Position1, Var_couleur),
    atom_number(Position1, Position),
    !,      
    atom_concat(v, Position, Var_valeur),
    select(Var_valeur in Domaine_valeurs, Domaines, Domaines1),
    retrouve_domaines(Domaines1, Domaines_out).

    % variable valeur, on recupere la variable couleur de meme numero
retrouve_domaines(
        [Var_valeur in Domaine_valeurs|Domaines], 
        [c(Position, Domaine_couleurs, Domaine_valeurs)|Domaines_out]
                 ) :-
    atom_concat(v, Position1, Var_valeur),
    atom_number(Position1, Position),
    !,
    atom_concat(c, Position, Var_couleur),
    select(Var_couleur in Domaine_couleurs, Domaines, Domaines1),
    retrouve_domaines(Domaines1, Domaines_out).

% --------- 
transforme_domaines([], []) :-
	!.
	
transforme_domaines([Domaine|Domaines], 
                    [Domaine_couleur, Domaine_valeur|Domaines1]) :-
	transforme_domaine(Domaine, Domaine_couleur, Domaine_valeur),
	transforme_domaines(Domaines, Domaines1).
	
% ---------
transforme_domaine(c(Pos, Couleurs, Valeurs), 
                   Var_couleur in Couleurs, Var_valeur in Valeurs) :-
	atom_number(Pos_a, Pos),
	atom_concat(c, Pos_a, Var_couleur),
	atom_concat(v, Pos_a, Var_valeur). 
 
/* ====================== COMPARAISON DOMAINES VALEUR ======================= */

% ---------
compare_domaines_valeur(Domaine, Domaine1, Ordre) :-
    sort(Domaine,  DomaineA),
    sort(Domaine1, DomaineB),
    compare_deux_domaines_valeurs2(DomaineA, DomaineB, Ordre).

% ---------
    % Domaine et Domaine1 sont des listes ordonnees
compare_deux_domaines_valeurs2(Domaine, Domaine1, <) :-
    domaine_inferieur(Domaine, Domaine1),
    !.

compare_deux_domaines_valeurs2(Domaine, Domaine1, >) :-
    domaine_inferieur(Domaine1, Domaine),
    !.

compare_deux_domaines_valeurs2([Valeur], [Valeur], =) :-
	!.   
	
compare_deux_domaines_valeurs2(Domaine, Domaine1, =<) :-
    domaine_inferieur_egal(Domaine, Domaine1),
    !.    
    
compare_deux_domaines_valeurs2(Domaine, Domaine1, >=) :-
    domaine_inferieur_egal(Domaine1, Domaine),
    !.
    
compare_deux_domaines_valeurs2([Valeur1], [Valeur2], \=) :-
	Valeur1 \== Valeur2,
	!.
	
compare_deux_domaines_valeurs2(_Domaine, _Domaine1, aucun).
    
% --------
    % Domaine et Domaine1 sont des listes ordonnees
domaine_inferieur(Domaine, [V|_Domaine1]) :-
    dernier_element(Domaine, Max),
    Max < V,
    !.
    
domaine_inferieur_egal(Domaine, [V|_Domaine1]) :-
    dernier_element(Domaine, Max),
    Max =< V.

/* ==================== COMPARAISON DOMAINES COULEURS ======================= */
    
% ---------
compare_domaines_couleurs(Comp_couleurs, Domaines, Ordre_couleurs) :-                
    get_domaines_couleurs(Comp_couleurs, Domaines, Domaine, Domaine1),
    functor(Comp_couleurs, Comp, _Arity),
    run:ordre_couleurs(Ordre_couleurs),
    compare_deux_domaines_couleurs2(Domaine, Comp, Domaine1, Ordre_couleurs).
    
% ---------
    % verifie si Domaine est avant, apres ou meme_rang que Domaine1
compare_domaines_couleur(Domaine, Domaine1, Ordre_domaines) :-
    running_game:ordre_couleurs(Ordre_couleurs),
    sort(Domaine, DomaineA),
    sort(Domaine1, DomaineB),
    compare_deux_domaines_couleurs2(DomaineA, DomaineB, Ordre_couleurs,
                                    Ordre_domaines).    
% ---------
compare_deux_domaines_couleurs2(Domaine, Domaine1, Ordre_couleurs, avant) :-
    domaine_avant(Domaine, Domaine1, Ordre_couleurs),
    !.

compare_deux_domaines_couleurs2(Domaine, Domaine1, Ordre_couleurs, apres) :-
    domaine_avant(Domaine1, Domaine, Ordre_couleurs),
    !.

compare_deux_domaines_couleurs2(Domaine1, Domaine2, Ordre_couleurs, 
                                meme_rang) :-                          
    domaine_meme_rang(Domaine1, Domaine2, Ordre_couleurs),
    !.

compare_deux_domaines_couleurs2(Domaine, Domaine1, Ordre_couleurs, 
                                avant_meme_rang) :-
    domaine_avant_meme_rang(Domaine, Domaine1, Ordre_couleurs),
    !.
    
compare_deux_domaines_couleurs2(Domaine, Domaine1, Ordre_couleurs, 
                                apres_meme_rang) :-
    domaine_avant_meme_rang(Domaine1, Domaine, Ordre_couleurs),
    !.
      
compare_deux_domaines_couleurs2(Domaine1, Domaine2, Ordre_couleurs, 
                                pas_meme_rang) :-                            
    domaine_pas_meme_rang(Domaine1, Domaine2, Ordre_couleurs),
	domaine_pas_meme_rang(Domaine1, Domaine2, Ordre_couleurs),
    !.    
    
compare_deux_domaines_couleurs2(_Domaine, _Domaine1, _Ordre_couleurs, aucun).

% ---------
domaine_meme_rang([], _Domaine1, _Ordre_couleurs) :-
    !.
    
domaine_meme_rang([Valeur|Valeurs], Domaine, Ordre_couleurs) :-
    couleur_meme_rang_domaine(Domaine, Valeur, Ordre_couleurs),
    domaine_meme_rang(Valeurs, Domaine, Ordre_couleurs).

% ---------
domaine_pas_meme_rang([], _Domaine1, _Ordre_couleurs) :-
    !.
    
domaine_pas_meme_rang([Valeur|Valeurs], Domaine, Ordre_couleurs) :-
    couleur_pas_meme_rang_domaine(Domaine, Valeur, Ordre_couleurs),
    domaine_pas_meme_rang(Valeurs, Domaine, Ordre_couleurs).

% ---------
domaine_avant([], _Domaine1, _Ordre_couleurs) :-
    !.
    
    % verifie si Valeur est avant toutes les valeurs de Domaine
domaine_avant([Valeur|Valeurs], Domaine, Ordre_couleurs) :-
    couleur_avant_domaine(Domaine, Valeur, Ordre_couleurs),
    domaine_avant(Valeurs, Domaine, Ordre_couleurs).
        
% ---------
domaine_avant_meme_rang([], _Domaine1, _Ordre_couleurs) :-
    !.
    
    % verifie si Valeur est avant toutes les valeurs de Domaine1
domaine_avant_meme_rang([Valeur|Valeurs], Domaine, Ordre_couleurs) :-
    couleur_avant_meme_rang_domaine(Domaine, Valeur, Ordre_couleurs),
    domaine_avant_meme_rang(Valeurs, Domaine, Ordre_couleurs).
       
% ---------
couleur_meme_rang_domaine([], _Valeur, _Ordre_couleurs) :-
    !.
    
couleur_meme_rang_domaine([Valeur|Valeurs], V, Ordre_couleurs) :-
	ordre_couleurs:couleur_meme_rang(V, Valeur, Ordre_couleurs),
    couleur_meme_rang_domaine(Valeurs, V, Ordre_couleurs).
    
% ---------
couleur_avant_domaine([], _Valeur, _Ordre_couleurs) :-
    !.
    
couleur_avant_domaine([Valeur|Valeurs], V, Ordre_couleurs) :-
    ordre_couleurs:couleur_avant(V, Valeur, Ordre_couleurs),
    couleur_avant_domaine(Valeurs, V, Ordre_couleurs).

% ---------
couleur_avant_meme_rang_domaine([], _Valeur, _Ordre_couleurs) :-
    !.
    
couleur_avant_meme_rang_domaine([Valeur|Valeurs], V, Ordre_couleurs) :-
	ordre_couleurs:couleur_avant_meme_rang(V, Valeur, Ordre_couleurs),
	!,
    couleur_avant_meme_rang_domaine(Valeurs, V, Ordre_couleurs).

% ----------
couleur_pas_meme_rang_domaine([], _Valeur, _Ordre_couleurs) :-
    !.
    
couleur_pas_meme_rang_domaine([Valeur|Valeurs], V, Ordre_couleurs) :-
	\+ ordre_couleurs:couleur_meme_rang(V, Valeur, Ordre_couleurs),
	\+ ordre_couleurs:couleur_meme_rang(Valeur, V, Ordre_couleurs),
    couleur_pas_meme_rang_domaine(Valeurs, V, Ordre_couleurs).

% ---------
	% Var est une variable
domaine(Var, Domaines, Domaine) :-
    member(Var in Domaine, Domaines).
    
    % Const est une constante
domaine(Const, _Domaines, [Const]) :-
        donnees_contraintes:constante(Const).

/* =============================== FIN LISTING ============================== */
