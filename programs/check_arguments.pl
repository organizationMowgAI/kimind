/* ================ DETECTION DES ARGUMENTS DANS UNE CONTRAINTE ============= */

:- module(
          check_arguments, 
          [
			separer_liste_arguments/2,
			separer_arguments/2,
			separer_arguments_liste/2,

          	arguments_impliques/2,
          	
			variables_impliquees_liste/2,
            variables_impliquees/2,
            variables_impliquees/3,
            vars_couleurs_impliquees/2,
            vars_valeurs_impliquees/2,

			constantes_impliquees/2,
            constantes_impliquees/3,
            constantes_couleurs_impliquees/2,
            constantes_valeurs_impliquees/2,

            consts_vars_couleurs_impliquees/2,
            consts_vars_valeurs_impliquees/2
          ]
		 ).
		 
:- 
	use_module(donnees_contraintes),
	use_module(operateurs),
	use_module(liste).

% ----------
separer_liste_arguments([], []) :-
	!.

separer_liste_arguments([Arg|Args], [Arg1|Args1]) :-
	separer_arguments(Arg, Arg1),
	separer_liste_arguments(Args, Args1).

% ----------
	% espace les arguments d'une liste avec un blanc
	% retourne un unique atome representant la liste
separer_arguments_liste(Liste, Liste_out) :-
		separer_arguments_liste2(Liste, Liste1),
		liste:convertit_liste_atome(Liste1, Liste_out).

% ----------
separer_arguments_liste2([], []) :-
	!.

separer_arguments_liste2([Arg|Args], [Arg1|Args1]) :-
	separer_arguments(Arg, Arg1),
	separer_arguments_liste2(Args, Args1).

% ----------
	% separe tous les arguments de l'expression par un espace
	% retourne un atome
separer_arguments(Number, Number) :-
	number(Number),
	!.

separer_arguments(Atom, Atom) :-
	atom(Atom),
	!.

separer_arguments(Liste, Liste1) :-
	is_list(Liste),
	!,
	separer_arguments_liste(Liste, Liste1).

separer_arguments(Expression, Expression_out) :-
	Expression =..[Op|Args],
	separer_liste_arguments(Args, LArgs),
	traite_liste_arguments(Op, LArgs, Expression_out).
	
% ----------
traite_liste_arguments(Op, [X,Y], Atom) :-
	!,
	espaces_operateur(Op, Op1),
	atom_concat(X, Op1, E1),
	atom_concat(E1, Y, Atom).

traite_liste_arguments(Op, LArgs, Atom) :-
	Atom=..[Op|LArgs].

% ----------
espaces_operateur(Op, Op_out) :-
	atom_concat(' ', Op, Op1),
	atom_concat(Op1, ' ', Op_out).
	
% ----------
arguments_impliques(Contrainte, Arguments) :-
	variables_impliquees(Contrainte, Variables),
	constantes_impliquees(Contrainte, Constantes),
	append(Variables, Constantes, Arguments).
	

% ----------
	% retourne toutes les variables impliquees dans la liste de Contraintes

variables_impliquees_liste(Contraintes, Variables) :-
	variables_impliquees_liste2(Contraintes, Variables1),
	sort(Variables1, Variables).

% ----------
variables_impliquees_liste2([], []) :-
	!.

variables_impliquees_liste2([Contrainte|Contraintes], Variables) :-
	variables_impliquees(Contrainte, Vars1),
	variables_impliquees_liste2(Contraintes, Vars2),
	append(Vars1, Vars2, Variables).

% ----------
variables_impliquees(Contrainte, Variables) :-
	variables_impliquees(Contrainte, Vars_couleurs, Vars_valeurs),
	append(Vars_couleurs, Vars_valeurs, Variables).
	
% ---------- 
variables_impliquees(Contrainte, Vars_couleurs, Vars_valeurs) :-
    donnees_contraintes:variables_couleurs(Couleurs),
    donnees_contraintes:variables_valeurs(Valeurs),
    args_impliques(Contrainte, Couleurs, Valeurs, 
                   Vars_couleurs, Vars_valeurs).

% ---------- 
constantes_impliquees(Contrainte, Constantes) :-
	constantes_impliquees(Contrainte, Constantes_couleurs, Constantes_valeurs),
	append(Constantes_couleurs, Constantes_valeurs, Constantes).

% ----------
constantes_impliquees(Contrainte, Const_couleurs, Const_valeurs) :-
    donnees_contraintes:domaine_couleurs(Couleurs),
    donnees_contraintes:domaine_valeurs(Valeurs),
    args_impliques(Contrainte, Couleurs, Valeurs, 
                   Const_couleurs, Const_valeurs).

% -----------
    % retourne les variables de couleur et de valeurs impliquees dans
    % Contrainte
args_impliques(Contrainte, Couleurs, Valeurs, 
               Vars_couleurs, Vars_valeurs) :-
    args_impliques2(Contrainte, Couleurs, Valeurs, 
                    Vars_couleurs1, Vars_valeurs1),
    sort(Vars_couleurs1, Vars_couleurs),
    sort(Vars_valeurs1, Vars_valeurs).
     
% ----------
args_impliques2(reduction(Var, couleur, _Domaine1, _Domaine2), 
                Couleurs, _Valeurs, [Var], []) :-
    member(Var, Couleurs),
    !.

args_impliques2(reduction(Var, valeur, _Domaine1, _Domaine2), 
                _Couleurs, Valeurs, [], [Var]) :-
    member(Var, Valeurs),
    !.

    % une couleur (Var ou Const)
args_impliques2(Couleur, Couleurs, _Valeurs, Couleur_out, []) :-
    donnees_contraintes:type_couleur(Couleur),
    (
        member(Couleur, Couleurs)
        -> Couleur_out = [Couleur]
        ; Couleur_out = []
    ),
    !.

args_impliques2(Valeur, _Couleurs, Valeurs, [], Valeur_out) :-
    (atom(Valeur) ; number(Valeur)),
    (
        member(Valeur, Valeurs)
        -> Valeur_out = [Valeur]
        ; Valeur_out = []
    ),
    !.

args_impliques2([], _Couleurs, _Valeurs, [], []) :-
    !.

args_impliques2(Contrainte, Couleurs, Valeurs, 
                Vars_couleurs, Vars_valeurs) :-
    Contrainte=..[_Op, Arg1, Arg2],
    !,
    args_impliques2(Arg1, Couleurs, Valeurs, 
                    Vars_couleurs1, Vars_valeurs1),
    args_impliques2(Arg2, Couleurs, Valeurs, 
                    Vars_couleurs2, Vars_valeurs2),
    append(Vars_couleurs1, Vars_couleurs2, Vars_couleurs),
    append(Vars_valeurs1, Vars_valeurs2, Vars_valeurs).
    
% ----------
vars_couleurs_impliquees(Contrainte, Vars_couleurs) :-
    donnees_contraintes:variables_couleurs(Couleurs),
    arguments_impliques(Contrainte, Couleurs, Vars_couleurs).

% ----------
vars_valeurs_impliquees(Contrainte, Vars_valeurs) :-
    donnees_contraintes:variables_valeurs(Valeurs),
    arguments_impliques(Contrainte, Valeurs, Vars_valeurs).  

% ---------
constantes_valeurs_impliquees(Contrainte, Valeurs) :-
    donnees_contraintes:domaine_valeurs(Domaine_valeurs),
    arguments_impliques(Contrainte, Domaine_valeurs, Valeurs).
    
% ---------
constantes_couleurs_impliquees(Contrainte, Couleurs) :-
    donnees_contraintes:domaine_couleurs(Domaine_couleurs),
    arguments_impliques(Contrainte, Domaine_couleurs, Couleurs).

% ----------
consts_vars_couleurs_impliquees(Contrainte, Couleurs) :-
    donnees_contraintes:variables_couleurs(Vars_couleurs),
    donnees_contraintes:domaine_couleurs(Domaine_couleurs),
    append(Vars_couleurs, Domaine_couleurs, Les_couleurs),
    arguments_impliques(Contrainte, Les_couleurs, Couleurs).

% ----------
consts_vars_valeurs_impliquees(Contrainte, Valeurs) :-
    donnees_contraintes:variables_valeurs(Vars_valeurs),
    donnees_contraintes:domaine_valeurs(Domaine_valeurs),
    append(Vars_valeurs, Domaine_valeurs, Les_valeurs),
    arguments_impliques(Contrainte, Les_valeurs, Valeurs).
    
% ----------
arguments_impliques(Argument, Arguments, Arg_out) :-
    (atom(Argument) ; number(Argument)),
    (
      member(Argument, Arguments)
        -> Arg_out  = [Argument]
         ;  Arg_out = []
    ),
    !.

arguments_impliques([], _Arguments, []) :-
    !.
 
arguments_impliques(Contrainte, Arguments, Arguments_out) :-
    Contrainte=..[_Op, Arg1, Arg2],
    !,
    arguments_impliques(Arg1, Arguments, Arguments1),
    arguments_impliques(Arg2, Arguments, Arguments2), 
    append(Arguments1, Arguments2, Arguments3),
    sort(Arguments3, Arguments_out).

/* ============================ FIN LISTING ================================= */
