/* ============================= GERE UNE DEDUCTION ========================= */

:- module(deduction,
          [
			set_type_deduction/3,

            get_numero_deduction/2,
            get_type_deduction/2,
            get_antecedents_deduction/2,
            get_consequents_deduction/2,
			get_but_deduction/2,
			get_nb_antecedents_deduction/2,

			memes_deductions/2,
            check_comparaisons_deduction/2,

            ordonner_sommes_deduction/2,
            ordonner_somme/2,
			ordonne_deduction/2
          ]
          ).

:- 
    use_module(operateurs),
    use_module(check_arguments),
    use_module(comparaisons).

/* ========================= COMPARE DEUX DEDUCTIONS ======================== */

% ----------
memes_deductions(e(_N1, Type, Ante, Conse), e(_N2, Type, Ante, Conse)).

/* ========================= REORDONNE UNE DEDUCTION SOMME ================== */

% ----------
    % les sommes v2+ v1 + v3 + ... sont reecrites v1 + v2 + v3 + ...
ordonner_sommes_deduction(
							e(N, Type, Antecedents, Consequents),
                            e(N, Type, Antecedents1, Consequents1)
                          ) :-
	% writeln(N),
	% (N == 60 -> gtrace ;  true),
    ordonner_sommes_liste(Antecedents, Antecedents1),
    ordonner_sommes_liste(Consequents, Consequents1).

% ----------
ordonner_sommes_liste([], []) :-
    !.

ordonner_sommes_liste([E|Es], [E1|E1s]) :-
    ordonner_somme(E, E1),
    ordonner_sommes_liste(Es, E1s).

% -----------
ordonner_somme(si_alors(Si, Alors), si_alors(Si1, Alors1)) :-
    !,
    ordonner_somme(Si, Si1),
    ordonner_somme(Alors, Alors1).

ordonner_somme(Somme, Somme1) :-
    est_somme(Somme),
    !,
    ordonner_somme2(Somme, Somme1).

ordonner_somme(Expression, Expression).

% ----------
ordonner_somme2(Somme, Somme_out) :-
    Somme=..[Operateur, Arg1, Arg2],
    args_somme(Arg1, Arg2, SommeA, Valeur),
    check_arguments:variables_impliquees(SommeA, Vars),
    sort(Vars, Vars1),
    creer_somme(Vars1, SommeB),
    Somme1 =..[Operateur, SommeB, Valeur],
    comparaisons:ordonne_comparaison_lexico(Somme1, Somme_out).
    
% ----------
    % verifie si le premier ou le deuxieme argument est une somme
    % l'autre argument est une valeur
args_somme(Somme, Valeur, Somme, Valeur) :-
    est_somme2(Somme),
    !.

args_somme(Valeur, Somme, Somme, Valeur).
    
% ----------
est_somme(Somme) :-
    Somme =..[Operateur, Arg1, Arg2],
    member(Operateur, [=, <, =<]),
    (est_somme2(Arg1) ; est_somme2(Arg2)),
    !.                                      % evite backtrack inutile

% ----------
    % verifie qu'Expression ne contient que des operateurs +
est_somme2(A + B) :-
    (
        compound(A)
            -> est_somme2(A)
            ;  true
    ),
    (
        compound(B)
            -> est_somme2(B)
            ;  true
    ).

% ----------
creer_somme([Var], Var) :-
    !.

creer_somme([Var|Vars], Var + Somme) :-
    creer_somme(Vars, Somme).

/* ============================ ORDONNE DEDUCTION =========================== */

% ----------
ordonne_deduction(e(N, Type, Ante, Conse), e(N, Type, Ante2, Conse2)) :-
    ordonne_elements(Ante, Ante1),
    sort(Ante1, Ante2),
    ordonne_elements(Conse, Conse1),
    sort(Conse1, Conse2).

% ----------
    % reordonne chaque comparaison de Liste
ordonne_elements([], []) :-
    !.

ordonne_elements([dans(V, Domaine)|Liste], [dans(V, Domaine1)|Liste1]) :-
    !,
	sort(Domaine, Domaine1),
    ordonne_elements(Liste, Liste1).

ordonne_elements([meme_rang(A,B)|Liste], [Egalite|Liste1]) :-
	is_list(A),
	is_list(B),
    !,
	ordonne_element(A, A1),
	ordonne_element(B, B1),
	(
		A1 @< B1
		->	Egalite = meme_rang(A1, B1)
		;	Egalite = meme_rang(B1, A1)
	),
    ordonne_elements(Liste, Liste1).

ordonne_elements([Comp_couleurs|Liste], [Comp_couleurs1|Liste1]) :-
	Comp_couleurs =..[Fonction, Arg1, Arg2],
	member(Fonction, [<=>, avant,avant_meme_rang, apres, apres_meme_rang]),
    !,
	ordonne_element(Arg1, ArgA),
	ordonne_element(Arg2, ArgB),
	Comp_couleurs1 =..[Fonction, ArgA, ArgB],
    ordonne_elements(Liste, Liste1).

ordonne_elements([Comp|Liste], [Comp1|Liste1]) :-
    comparaisons:est_comparaison(Comp),
    !,
    comparaisons:ordonne_comparaison_lexico(Comp, Comp1),
    ordonne_elements(Liste, Liste1).

ordonne_elements([E|Liste], [E|Liste1]) :-
    ordonne_elements(Liste, Liste1).

% -----------
ordonne_element(L, L1) :-
	is_list(L),
	!,
	sort(L, L1).

ordonne_element(Comp, Comp1) :-
	comparaisons:est_comparaison(Comp),
	!,
	comparaisons:ordonne_comparaison_lexico(Comp, Comp1).
	
ordonne_element(E, E).

% ----------
check_comparaisons_deduction(e(N, Type, Antecedents, Consequents),
                             e(N, Type, Antecedents1, Consequents1)) :-
    check_comparaisons_liste(Antecedents, Antecedents1),
    check_comparaisons_liste(Consequents, Consequents1).

% ----------
check_comparaisons_liste([], []) :-
    !.

check_comparaisons_liste([Comp|Elements], [Comp1|Elements1]) :-
    comparaisons:est_comparaison(Comp),
    !,
    comparaisons:ordonne_comparaison_lexico(Comp, Comp1),
    check_comparaisons_liste(Elements, Elements1).
    

check_comparaisons_liste([A <=> B|Elements], [A2 <=> B2|Elements1]) :-
    !,
    check_couleurs_avant_valeurs(A, B, A1, B1),
    comparaisons:ordonne_comparaison_lexico(A1, A2),
    comparaisons:ordonne_comparaison_lexico(B1, B2),
    check_comparaisons_liste(Elements, Elements1).

check_comparaisons_liste([Element|Elements], [Element|Elements1]) :-
    check_comparaisons_liste(Elements, Elements1).

% ----------
check_couleurs_avant_valeurs(Couleurs, Valeurs, Couleurs, Valeurs) :-
    comparaisons:comp_couleurs(Couleurs),
    !.

check_couleurs_avant_valeurs(Valeurs, Couleurs, Couleurs, Valeurs).
    
/* ====================== GET ELEMENTS DES DEDUCTIONS ======================= */

% ----------
get_numero_deduction(e(rep(N), _Type, _Antecedents, _Consequents), N) :-
    !.

get_numero_deduction(e(N, _Type, _Antecedents, _Consequents), N).

% ----------
get_type_deduction(e(_N, Type, _Antecedents, _Consequents), Type).

% ----------
get_antecedents_deduction(e(_N, _Type, Antecedents, _Consequents), Antecedents).

% ----------
	% synonyme de get_consequents_deduction
get_but_deduction(e(_N, _Type, _Antecedent, But), But).

% ----------
get_consequents_deduction(e(_N, _Type, _Antecedents, Consequents), Consequents).

% ----------
get_nb_antecedents_deduction(Deduction, Nb) :-
	get_antecedents_deduction(Deduction, Antecedents),
	length(Antecedents, Nb).

/* ======================= SET ELEMENT DEDUCTION ============================ */

set_type_deduction(Nouveau_type, e(N, _Type, Antecedents, Consequents), 
				   e(N, Nouveau_type, Antecedents, Consequents)).

/* ============================== FIN LISTING =============================== */
