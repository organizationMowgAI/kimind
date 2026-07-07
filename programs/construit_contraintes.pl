/* ========================================================================== */
/*                    CONSTRUIT LES CONTRAINTES DU CSP KIMIND                 */
/* ========================================================================== */

:- module(
         construit_contraintes, 
         [
            construit_contraintes/6
         ]
		 ).

:- use_module(library(clpfd)),
   use_module(bk),
   use_module(bk_contraintes).

% ----------
construit_contraintes(Nb_cartes, Domaine_couleurs, Domaine_valeurs, 
                      Positions, Valeur_somme, Cartes) :-
    
    length(Couleurs, Nb_cartes),    % Couleurs non instancie (pour les vars) 
	length(Valeurs, Nb_cartes),     % Valeurs non instancie (pour les vars)
    construit_cartes2(Positions, Couleurs, Valeurs, Cartes),
    
	contraintes_couleurs(Domaine_couleurs, Couleurs),  
	contraintes_valeurs(Domaine_valeurs, Valeurs, Valeur_somme),
    contraintes_couleurs_valeurs(Cartes).

% ----------
contraintes_couleurs(Domaine_couleurs, Couleurs) :-
    bk_contraintes:integers_dom(Domaine_couleurs, Domaine),
    Couleurs ins Domaine,
    all_distinct(Couleurs).
    
    % ---
contraintes_valeurs(Domaine_valeurs, Valeurs, Valeur_somme) :-
    bk_contraintes:integers_dom(Domaine_valeurs, Domaine),
    Valeurs ins Domaine,
    sum(Valeurs, #=, Valeur_somme).
    
    % ---
construit_cartes2([], [], [], []) :-
	!.

construit_cartes2([Position|Positions], [Couleur|Couleurs], [Valeur|Valeurs], 
                  [c(Position, Couleur, Valeur)|Cartes]) :-           
    assert_carte(Position),         
	construit_cartes2(Positions, Couleurs, Valeurs, Cartes).
	 
    % memorise les noms des variables associees a cette position
assert_carte(Position) :-
    % atom_concat(carte_, Position, Cle),
    atom_concat(c, Position, Nom_couleur),
    atom_concat(v, Position, Nom_valeur),
	running_game:assert(carte(Position, nom(Nom_couleur, Nom_valeur))).

% ------- CONTRAINTES SUR LES VALEURS-COULEURS DES CARTES -------------

    % ---
contraintes_couleurs_valeurs(Cartes) :-
    running_game:nb_egals(Nb_egals),
    contraintes_cartes(Cartes, Nb_egals).
      
    % ---   
contraintes_cartes([_Carte], _Nb_egals) :-
    !.
    
contraintes_cartes([Carte|Cartes], Nb_egals) :-
    contraintes_une_carte(Cartes, Carte, Nb_egals),
    contraintes_cartes(Cartes, Nb_egals).
    
    % ---
contraintes_une_carte([], _Carte, _Nb_egals) :-
    !.
    
contraintes_une_carte([c(_Pos1, Couleur1, Valeur1)|Cartes],
                       c(Pos, Couleur, Valeur), Nb_egals) :-   
    Couleur1 - Couleur #> Nb_egals  #<==> Valeur1 #> Valeur, 
                      
    Couleur  - Couleur1 #> Nb_egals #<==> Valeur #> Valeur1,
    ((Couleur1 - Couleur #=< Nb_egals)  #/\ (Couleur - Couleur1 #=< Nb_egals))
       #<==> Valeur #= Valeur1,
    contraintes_une_carte(Cartes, c(Pos, Couleur, Valeur), Nb_egals).

/* ================================== FIN LISTING =========================== */
