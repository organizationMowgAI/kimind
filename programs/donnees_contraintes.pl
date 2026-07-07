
:- module(
          donnees_contraintes, 
         [
            variable/1,
            type_variable/2,
     
            variables_couleurs_valeurs/1,
            
            variables_couleurs/1,
            variable_couleur/1,
            var_couleur/2,
            
            variables_valeurs/1,
            variable_valeur/1,
            var_valeur/2,
            valeur_from_couleur/3,
         
            constante/1,
            constante_valeur/1,
            constante_couleur/1,

            type_valeur/1,
            type_couleur/1
         ]
		 ).

:- use_module(library(clpfd)).

/* ========================= COULEURS VALEURS =============================== */  

% --------- 
domaine_couleurs([blue, yellow, red, green]).

% ---------
domaine_valeurs([1, 2, 3, 4, 5, 6, 7, 8, 9 , 10]).

% ------
variables_couleurs([c0, c1, c2, c3]).

% ------
variables_valeurs([v0, v1, v2, v3]).

/* =============================== VARIABLES ================================ */

    % constantes representant les variables de couleur et valeur
variables_couleurs_valeurs(Couleurs_valeurs) :-
    variables_couleurs(Couleurs),
    variables_valeurs(Valeurs),
    append(Couleurs, Valeurs, Couleurs_valeurs).

    % ---
    % retourne la constante representant la variable couleur en position Position
var_couleur(Position, Var) :-
    variables_couleurs(Vars_couleurs),
    nth0(Position, Vars_couleurs, Var).

    % ---
    % retourne la constante representant la variable valeur en position Position
var_valeur(Position, Var) :-
    variables_valeurs(Vars_valeurs),
    nth0(Position, Vars_valeurs, Var).

% ------
variable(Var) :-
    type_variable(Var, _Type).

% ---------
variable_valeur(Var) :-
	type_variable(Var, valeur).

% ---------
variable_couleur(Var) :-
	type_variable(Var, couleur).

% --------	
        % retourne le type d'une variable
type_variable(Var, couleur) :-
    variables_couleurs(Vars),
    member(Var, Vars).

type_variable(Var, valeur) :-
    variables_valeurs(Vars),
    member(Var, Vars).  

/* =============================== CONSTANTES =============================== */
 
% ------
constante(Const) :-
    constante_valeur(Const),
    !.
    
constante(Const) :-
    constante_couleur(Const),
    !.
    
constante(Const) :-
	number(Const).
    
% ---------	
constante_valeur(Const) :-
	domaine_valeurs(Domaine_valeurs),
	member(Const, Domaine_valeurs).
	
% ---------	
constante_couleur(Const) :-
	domaine_couleurs(Domaine_couleurs),
	member(Const, Domaine_couleurs).

% --------	
        % retourne le type d'une constante
type_constante(Const, couleur) :-
    domaine_couleurs(Consts),
    member(Const, Consts).
    
type_constante(Const, valeur) :-
    domaine_valeurs(Consts),
    member(Const, Consts).

/* ================================= TYPES ================================== */

% ---------
type_valeur(Var) :-
    type_variable(Var, valeur),
    !.

type_valeur(Const) :-
    type_constante(Const, valeur).

% ---------
type_couleur(Var) :-
    type_variable(Var, couleur),
    !.

type_couleur(Const) :-
    type_constante(Const, couleur).

/* ================================== DIVERS ================================ */

% ---------
	% retourne la Valeur à partir de la couleur
	
	% Couleur est une variable
valeur_from_couleur(Var_couleur, _Domaines, Var_valeur) :-
	variable_couleur(Var_couleur),
	!,
    variables_couleurs(Couleurs),
    variables_valeurs(Valeurs),
    nth1(Pos, Couleurs, Var_couleur),
    nth1(Pos, Valeurs, Var_valeur).
    
	% Couleur est une constante (ex : red)
	% on doit recuperer le nom de la variable ayant cette constante
	% comme valeur
valeur_from_couleur(Const_couleur, Domaines, Var_valeur) :-
	member(Var_couleur in [Const_couleur], Domaines),
	valeur_from_couleur(Var_couleur, Domaines, Var_valeur).
	
/* ================================ FIN LISTING ============================= */
