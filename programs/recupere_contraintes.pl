:- module(
           recupere_contraintes,
            [
               recupere_contraintes/5
            ]
		 ).

:- use_module(donnees_contraintes).
		
 
/* ========== RECUPERE CONTRAINTES IMPLIQUANT CERTAINES VARIABLES =========== */

% ---------
    % recupere les contraintes impliquant les variables 
    % de couleur Vars_c et de valeur Vars_v
recupere_contraintes([],  _Vars_c,  _Vars_v, [], []) :-
    !.

recupere_contraintes([Contrainte|Contraintes], Vars_c, Vars_v, 
                     [Contrainte|Contraintes1], Contraintes_restantes1) :-
    variables_impliquees(Contrainte, Couleurs_impliquees, Valeurs_impliquees),
    (
        variables_communes(Vars_c, Couleurs_impliquees) ; 
        variables_communes(Vars_v, Valeurs_impliquees)
    ),
    !,
    recupere_contraintes(Contraintes, Vars_c, Vars_v, 
                         Contraintes1, Contraintes_restantes1).

recupere_contraintes([Contrainte|Contraintes], Vars_c, Vars_v, 
                     Contraintes1, [Contrainte|Contraintes_restantes1]) :-
        recupere_contraintes(Contraintes, Vars_c, Vars_v, 
                             Contraintes1, Contraintes_restantes1).

% ---------
variables_communes(Vars1, Vars2) :-
    intersection(Vars1, Vars2, Vars),
    Vars \= [].


% ---------
    % retourne les variables de couleur et de valeurs 
    % impliquees dans Contrainte
variables_impliquees(Contrainte, Vars_couleurs, Vars_valeurs) :-
    variables_couleurs(Couleurs),
    variables_valeurs(Valeurs),
    variables_impliquees2(Contrainte, Couleurs, Valeurs, 
                          Vars_couleurs1, Vars_valeurs1),
    sort(Vars_couleurs1, Vars_couleurs),
    sort(Vars_valeurs1, Vars_valeurs).
    
% ---------
variables_impliquees2(reduction(Var, _Type, _Domaine1, _Domaine2), 
                      Couleurs, _Valeurs, [Var], []) :-
    member(Var, Couleurs),
    !.

variables_impliquees2(reduction(Var, _Type, _Domaine1, _Domaine2), 
                      _Couleurs, Valeurs, [], [Var]) :-
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
    
  
/* =========================== FIN LISTING ================================= */
