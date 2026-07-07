/* =========================== GESTION D'UNE CARTE ========================== */

:- module(carte,
          [
            get_position_carte/2,
            get_type_carte/2,
            cree_variable_couleur/2,
            cree_variable_valeur/2,
            get_nom_variable/3
          ]
         ).

% ----------
get_nom_variable(couleur, Position, Nom) :-
    !,
    atom_concat('c', Position, Nom).

get_nom_variable(valeur, Position, Nom) :-
    atom_concat('v', Position, Nom).

% ----------
    % cree la variable couleur associee a Position
cree_variable_couleur(Position, Var) :-
    atom_concat(c, Position, Var).

% ----------
    % cree la variable valeur associee a Position
cree_variable_valeur(Position, Var) :-
    atom_concat(v, Position, Var).

% ----------
get_position_carte(Var, Position) :-
    atom_concat(c, Position, Var),
    !.

get_position_carte(Var, Position) :-
    atom_concat(v, Position, Var).

% ----------
get_type_carte(Var, couleur) :-
    atom_concat(c, _Position, Var),
    !.

get_type_carte(Var, valeur) :-
    atom_concat(v, _Position, Var).

/* =============================== FIN LISTING ============================== */
