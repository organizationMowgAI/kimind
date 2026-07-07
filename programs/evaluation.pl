/* ==================== CALCUL DES EXPRESSSIONS NUMERIQUES ================== */

:- module(
          evaluation,
          [
           evalue/2,
           evalue_comp/2,
           evalue_comp_droite/2,
           evalue_comp_gauche/2,
           comp_valeurs_fausse/1,
           comp_valeurs_satisfaite/1,
           comp_couleurs_satisfaite/1,
           comp_valeurs_fausse/1
          ]
		 ).
		
:- 
    use_module(check_arguments),
    use_module(operateurs),
    use_module(donnees_contraintes).
    
% ----------
	% Comp contient au moins une variable
comp_valeurs_fausse(Comp) :-
	(Comp =..[_Op, Const, _Variable] ; Comp =..[_Op, _Variable, Const]),
	check_arguments:variables_impliquees(Const, [], []),
	!,
	donnees_contraintes:domaine_valeurs(Domaine),
	min_list(Domaine, Min),
	max_list(Domaine, Max),
	comp_fausse(Comp, Min, Max).
	
	% pas de constante
comp_valeurs_fausse(_Comp) :-
	fail.
	
% ----------
comp_fausse(_V < Min, Min, _Max) :-
	!.
	
comp_fausse(_V > Max, _Min, Max) :-
	!.

comp_fausse(Min > _V, Min, _Max) :-
	!.
	
comp_fausse(Max < _V, _Min, Max).
	
% ----------
comp_valeurs_satisfaite(Comp) :-
	Comp.

% ----------
	% verifie si l'expression donnee en argument est vraie
comp_couleurs_satisfaite(Comp) :-
	kimind_run:ordre_couleurs(Ordre_couleurs),
	comp_couleurs_satisfaite2(Comp, Ordre_couleurs).
	
% ----------	
comp_couleurs_satisfaite2(Arg1 meme_rang Arg2, Ordre_couleurs) :-
	(
		member(Arg1 meme_rang Arg2, Ordre_couleurs) ; 
		member(Arg2 meme_rang Arg1, Ordre_couleurs)
	),
	!.				% enleve backtrack de la disjonction

comp_couleurs_satisfaite2(Comp, Ordre_couleurs) :-
	member(Comp, Ordre_couleurs).
	
% ----------
	% regroupe les constantes numeriques d'une meme cote
	
	% pas de variable dans Exp1, 
	% on place les constantes de Exp2 dans Exp1
evalue_comp(Comp, Comp_out) :-
	Comp =..[_Op, Exp1, _Exp2],
	check_arguments:
		variables_impliquees(Exp1, []),
	!,										% reunit les constantes dans Exp1
	evalue_comp_gauche(Comp, Comp_out).
	
	% pas de variable dans Exp2
	% on place les constantes dans Exp2
evalue_comp(Comp, Comp_out) :-
	Comp =..[_Op, _Exp1, Exp2],
	check_arguments:
		variables_impliquees(Exp2, []),
	!,										% reunit les constantes dans Exp1
	evalue_comp_droite(Comp, Comp_out).
	
	% variables dans Exp1 et Exp2 ou aucune variable
	% on place les constantes dans Exp2
evalue_comp(Comp, Comp_out) :-
	evalue_comp_droite(Comp, Comp_out).
	
% ----------
    % evaluation d'une expression contenant des nombres et des atomes
    
    % evalution d'une comparaison, les constantes sont places a droite
evalue_comp_droite(Exp, Exp_out) :-
	Exp=..[Op, Exp1, Exp2],
	get_constantes_exp(Exp1, ExpA, Constantes),  % retire les constantes de Exp1
	sum_list(Constantes, Somme),                 % somme les constantes
	evalue(Exp2-Somme, ExpB),					 % place les constantes dans Exp1
	Exp_out =..[Op, ExpA, ExpB].
	
evalue_comp_droite(Exp, Exp_out) :-
	evalue(Exp, Exp_out).

% ----------
    % evalution d'une comparaison, les constantes sont places a gauche
evalue_comp_gauche(Exp, Exp_out) :-
	Exp=..[Op, Exp1, Exp2],
	get_constantes_exp(Exp2, ExpB, Constantes),  % retire les constantes de Exp2
	sum_list(Constantes, Somme),                 % somme les constantes
	evalue(Exp1-Somme, ExpA),
	Exp_out =..[Op, ExpA, ExpB].
	
evalue_comp_gauche(Exp, Exp_out) :-
	evalue(Exp, Exp_out).
	
% ----------
	% evalue ce qui est numeriquement evaluable dans Exp
evalue(N, N) :-
	number(N),
	!.
	
evalue(A, A) :-
	atom(A),
	!.
	
evalue([], []) :-
	!.
	
evalue([X|L], [X1|L1]) :-
	!,
	evalue(X, X1),
	evalue(L, L1).

evalue(Exp, Arg2) :-
	Exp=..[_Op, 0, Arg2],
	!.
	
evalue(Exp, Arg1) :-
	Exp=..[_Op, Arg1, 0],
	!.
	
evalue(Exp, Exp_out) :-
	Exp=..[Op, Arg1, Arg2],
	evalue(Arg1, Exp1),
	evalue(Arg2, Exp2),
	evalue_operation(Op, Exp1, Exp2, Exp_out).
	
% ----------
evalue_operation(Op, Arg1, Arg2, Exp) :-
	member(Op, [+, -, *, /]),
	number(Arg1),
	number(Arg2),
	!,
	evalue_expression_arithmetique(Op, Arg1, Arg2, Exp).
	
evalue_operation(Op, Arg1, Arg2, Exp) :-
	Exp =..[Op, Arg1, Arg2].
	
% ----------
evalue_expression_arithmetique(+, Arg1, Arg2, Exp) :-
	!,
	Exp is Arg1 + Arg2.
	
evalue_expression_arithmetique(-, Arg1, Arg2, Exp) :-
	!,
	Exp is Arg1 - Arg2.
	
evalue_expression_arithmetique(*, Arg1, Arg2, Exp) :-
	!,
	Exp is Arg1 * Arg2.
	
evalue_expression_arithmetique(/, _Arg1, 0, _Exp) :-
	!,
	writlen('!!!! DIVISION PAR ZERO !!!!').
	
evalue_expression_arithmetique(/, Arg1, Arg2, Exp) :-
	!,
	Exp is Arg1 / Arg2.
	

% ----------
	% toutes les constantes de Exp sont retirees et placees dans Constantes
get_constantes_exp(N, 0, [N]) :-
	number(N),
	!.
	
get_constantes_exp(A, A, []) :-
	atom(A),
	!.
	
get_constantes_exp(Exp, Exp_out, Constantes) :-
	Exp =.. [Op, Exp1, Exp2],
	get_constantes_exp(Exp1, ExpA, Constantes1),
	get_constantes_exp(Exp2, ExpB, Constantes2),
	ExpC =..[Op, ExpA, ExpB],
	retire_zeros(ExpC, Exp_out),
	append(Constantes1, Constantes2, Constantes).
	
% ----------
retire_zeros(N, N) :-
    number(N),
    !.
    
retire_zeros(A, A) :-
    atom(A),
    !.
    
retire_zeros(Exp, 0) :-
    Exp =..[_Op, 0, 0],
    !.
    
retire_zeros(Exp, Exp_out) :-
    Exp =..[_Op, 0, Exp2],
    !,
    retire_zeros(Exp2, Exp_out).
    
retire_zeros(Exp, Exp_out) :-
    Exp =..[_Op, Exp1, 0],
    !,
    retire_zeros(Exp1, Exp_out).
    
retire_zeros(Exp, Exp_out) :-
    Exp=..[Op, Exp1, Exp2],
    !,
    retire_zeros(Exp1, ExpA),
    retire_zeros(Exp2, ExpB),
    Exp_out=..[Op, ExpA, ExpB].
    
/* ============================== FIN LISTING =============================== */
