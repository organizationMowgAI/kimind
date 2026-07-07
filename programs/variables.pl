
:- module(
          check_arguments, 
         [
            variables_impliquees/5,
            couleurs_impliquees/3
         ]
		 ).
		 
:-   
   use_module(library(clpfd)),
   use_module(library(lists)),
   use_module(liste),
   use_module(affichage_contraintes),
   use_module(bk).


% ------
    % retourne les variables de couleur et de valeurs impliquees dans
    % Contrainte
variables_impliquees(Contrainte, Couleurs, Valeurs, 
                     Vars_couleurs, Vars_valeurs) :-
    variables_impliquees2(Contrainte, Couleurs, Valeurs, 
                          Vars_couleurs1, Vars_valeurs1),
    sort(Vars_couleurs1, Vars_couleurs),
    sort(Vars_valeurs1, Vars_valeurs).
    
    
    % ---

variables_impliquees2(reduction(Var, _Domaine1, _Domaine2), Couleurs, _Valeurs,
                      [Var], []) :-
    member(Var, Couleurs),
    !.

variables_impliquees2(reduction(Var, _Domaine1, _Domaine2), _Couleurs, Valeurs,
                      [], [Var]) :-
    member(Var, Valeurs),
    !.


variables_impliquees2(Contrainte, Couleurs, Valeurs, 
                     Vars_couleurs, Vars_valeurs) :-
    Contrainte=..[_Op, Arg1, Arg2],
    !,
    variables_impliquees2(Arg1, Couleurs, Valeurs, 
                         Vars_couleurs1, Vars_valeurs1),
     variables_impliquees2(Arg2, Couleurs, Valeurs, 
                         Vars_couleurs2, Vars_valeurs2),
    append(Vars_couleurs1, Vars_couleurs2, Vars_couleurs),
    append(Vars_valeurs1, Vars_valeurs2, Vars_valeurs).
    


variables_impliquees2(Couleur, Couleurs, _Valeurs, [Couleur], []) :-
    member(Couleur, Couleurs),
    !.

variables_impliquees2(Valeur, _Couleurs, Valeurs, [], [Valeur]) :-
    member(Valeur, Valeurs),
    !.

variables_impliquees2(_A, _Couleurs, _Valeurs, [], []).


% ---------
    % retourne les couleurs impliquees dans Contrainte
couleurs_impliquees(Contrainte, Domaine_couleurs, Couleurs_out) :-
    Contrainte=..[_Op, Arg1, Arg2],
    !,
    couleurs_impliquees(Arg1, Domaine_couleurs, Couleurs1),
    couleurs_impliquees(Arg2, Domaine_couleurs, Couleurs2), 
    append(Couleurs1, Couleurs2, Couleurs),
    sort(Couleurs, Couleurs_out).

couleurs_impliquees(Couleur, Domaine_couleurs, [Couleur]) :-
    member(Couleur, Domaine_couleurs),
    !.

couleurs_impliquees(_A, _Domaine_couleurs, []).

% ---------
    % retourne les couleurs impliquees dans Contrainte
valeurs_impliquees(Contrainte, Domaine_valeurs, Valeurs_out) :-
    Contrainte=..[_Op, Arg1, Arg2],
    !,
    valeurs_impliquees(Arg1, Domaine_valeurs, Valeurs1),
    valeurs_impliquees(Arg2, Domaine_valeurs, Valeurs2), 
    append(Valeurs1, Valeurs2, Valeurs),
    sort(Valeurs, Valeurs_out).

valeurs_impliquees(Valeur, Domaine_valeurs, [Valeur]) :-
    member(Valeur, Domaine_valeurs),
    !.

valeurs_impliquees(_A, _Domaine_valeurs, []).
