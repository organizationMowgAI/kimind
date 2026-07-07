:- module(
			affichage_deductions2,
		    [
				affiche_simplification_equivalence/2,
				affiche_suppression_equivalence/2,
				affiche_instantiation_variable/2,
                affiche_contrainte_domaine_couleur/2, 
                affiche_contrainte_domaine_valeur/2,
				affiche_somme_trop_petite/2,
			    affiche_somme_trop_grande/2,
				affiche_reduction/2,

                ecrire_domaine/1,
				write_domaine/2,
				writeln_domaine/2,

				display_deductions/1,
                display_deduction/1,
				
				write_domaines_singletons/3,
				write_reduction_domaine/3,

				saut_contrainte/0,

				separateur_contrainte/0,

				implique/0,
				implique2/0,
				
				et/0,
                si_alors/2,

                antecedents_multiples/1,

				write_contrainte/1,
				writeln_contrainte/1
             ]
            ).

:-
	use_module(operateurs), 
	use_module(liste),
	use_module(affichage_contraintes),
    use_module(comparaisons),
	use_module(check_arguments),
    use_module(tabulation).

% ----------
display_deductions(Deductions) :-
	display_deductions(Deductions, 1).

% ----------
display_deductions([], _Nb_sauts_ligne) :-
	!.

display_deductions([_Deduction|Deductions], Nb_sauts_ligne) :-
	gtrace,							% normalement jamais appelé
    sauts_ligne(Nb_sauts_ligne),
	display_deductions(Deductions, Nb_sauts_ligne).


% ----------
display_deduction(e(_N, reponse, [], _Consequent)) :-
	!,
	writeln('answer of the system').

display_deduction(e(N, Type, Antecedents, [Consequent])) :-
	affiche_element2(Consequent),
	write(' : '),
	display_deduction2(e(N, Type, Antecedents, [Consequent])),
	nl,
	nl.

% ----------
display_deduction2(e(_N, si_alors, Antecedents, [Consequent])) :-
    !,
    affiche_si_alors(Antecedents, Consequent).

display_deduction2(e(_N, max, [Antecedent], [max(V, Max)])) :-
	!,
	affiche_max(Antecedent, V, Max).

display_deduction2(e(_N, min, [Antecedent], [min(V, Min)])) :-
	!,
	affiche_min(Antecedent, V, Min).

display_deduction2(e(_N, connu, _Ante, But)) :-
	!,
	affiche_but_connu(But).

display_deduction2(e(_N, somme, [], [Somme])) :-
    !,
    affiche_somme(Somme).

display_deduction2(e(_N, var_dans_domaine, [], [Var dans Domaine])) :-
    !,
    affiche_domaine(Var dans Domaine).

display_deduction2(e(_N, somme_trop_grande, Antecedents, [Consequent])) :-
	!,
	affiche_somme_trop_grande(Antecedents, Consequent).

display_deduction2(e(_N, somme_trop_petite, Antecedents, [Consequent])) :-
	!,
	affiche_somme_trop_petite(Antecedents, Consequent).
    
display_deduction2(e(_N, contrainte_initiale, [], [Contrainte])) :-
	!,
	affiche_contrainte_initiale(Contrainte).

display_deduction2(e(_N, domaine_initial, [], Consequents)) :-
	!,
	affiche_domaine_initial(Consequents).

display_deduction2(e(_N, reponse, [], Consequents)) :-
	!,
	affiche_reponse_systeme(Consequents).

display_deduction2(e(_N, simplification_equivalence, 
                      Antecedents, Consequents)) :-
	!,
	affiche_simplification_equivalence(Antecedents, Consequents).

display_deduction2(e(_N, suppression_equivalence, 
                      Antecedents, Consequents)) :-
	!,
	affiche_suppression_equivalence(Antecedents, Consequents).

display_deduction2(e(_N, instantiation_variable_valeur, 
                      Antecedents, Consequents)) :-
	!,
	affiche_instantiation_variable(Antecedents, Consequents).

display_deduction2(e(_N, instantiation_variable_couleur, 
                      Antecedents, Consequents)) :-
	!,
	affiche_instantiation_variable(Antecedents, Consequents).

display_deduction2(e(_N, reduction, Antecedents, Consequents)) :-
	!,
	affiche_reduction(Antecedents, Consequents).

display_deduction2(e(_N, contrainte_domaine_valeur, 
                        Antecedents, Consequents)) :-
	!,
	affiche_contrainte_domaine_valeur(Antecedents, Consequents).

display_deduction2(e(_N, contrainte_domaine_couleur, 
                        Antecedents, Consequents)) :-
	!,
	affiche_contrainte_domaine_couleur(Antecedents, Consequents).

/* =========================  AFFICHAGE DEDUCTIONS ========================== */

% ----------
affiche_si_alors(Antecedents, _Alors) :-
    nl,
    affiche_liste(Antecedents).
    
% ----------
affiche_max(Var dans Domaine, Var, _Max) :-
    nl,
    check_arguments:separer_arguments(Domaine, Domaine1),
    write_domaine(Var, Domaine1).

% ----------
affiche_min(Var dans Domaine, Var, _Min) :-
    nl,
    check_arguments:separer_arguments(Domaine, Domaine1),
    write_domaine(Var, Domaine1).

% ----------
affiche_but_connu([_But]) :-
    % nl,
    % check_arguments:separer_arguments(But, But1),
	format(' (seen)', []).

% ----------
affiche_contrainte_initiale(_Contrainte) :-
    !,
    % nl,
    % tab(Tab),
    % check_arguments:separer_arguments(Contrainte, Contrainte1),
    write(' initial constraint').

% ----------
affiche_domaine_initial([_]) :-
    % nl,
    % tab(Tab),
    % check_arguments:separer_arguments(Domaine, Domaine1),
	format(' known domain', []).

% ----------
affiche_domaine(Var dans Domaine) :-
    nl,
    check_arguments:separer_arguments(Domaine, Domaine1),
    format('~w in ~w', [Var, Domaine1]).
    
% ----------
affiche_reponse_systeme([_Reponse]) :-
	format(' answer of the system', []).

% ---------
affiche_reduction([], [dans(Var, Domaine_reduit)]) :-
    !,
    nl,
	format('the system answered ', []),
	write_domaine(Var, Domaine_reduit).

affiche_reduction(Antecedents, [dans(_Var, _Domaine_reduit)]) :-
    nl,
	affiche_liste(Antecedents).
 
% ----------
affiche_simplification_equivalence([Comparaison, Equivalence], 
								   [_ComparaisonA]) :-
    nl,
	check_arguments:separer_arguments(Comparaison, Comparaison1),
	format('~w ~n', [Comparaison1]),
	check_arguments:separer_arguments(Equivalence, Equivalence1),
	format('~w ', [Equivalence1]).

% ----------
affiche_suppression_equivalence([Comparaison, Equivalence], 
                                [ComparaisonA]) :-
    nl,
	check_arguments:separer_arguments(Comparaison, Comparaison1),
	check_arguments:separer_arguments(Equivalence, Equivalence1),
	check_arguments:separer_arguments(ComparaisonA, _ComparaisonB),
	format('~w ~n', [Comparaison1]),
	format('~w', [Equivalence1]).

% ----------
affiche_instantiation_variable(Antecedents, [Contrainte_modifiee]) :-
    nl,
	affiche_liste(Antecedents),
	check_arguments:separer_arguments(Contrainte_modifiee, _Contrainte_modifiee1).

% ----------
affiche_contrainte_domaine_couleur(Antecedents, [Contrainte]) :-
    nl,
  	check_arguments:separer_liste_arguments(Antecedents, Antecedents1),
	affiche_liste(Antecedents1),
	check_arguments:separer_arguments(Contrainte, _Contrainte1).

% ----------
affiche_contrainte_domaine_valeur(Antecedents, [Contrainte]) :-
    nl,
	affiche_liste(Antecedents),
	check_arguments:separer_arguments(Contrainte, _Contrainte1).

% ----------
affiche_somme(Somme = Valeur) :-
    nl,
    check_arguments:separer_arguments(Somme, Somme1),
    format('~w = ~w (initial constraint)', [Somme1, Valeur]).
    
% ----------
affiche_somme_trop_petite(Antecedents, _Var dans _Domaine_reduit) :-
    nl,
    affiche_liste(Antecedents).

% ----------
affiche_somme_trop_grande(Antecedents, _Var dans _Domaine_reduit) :-
    nl,
    affiche_liste(Antecedents).

/* ============================== DIVERS ==================================== */

% ----------
affiche_elements([]) :-
	!.

affiche_elements([E]) :-
	affiche_element(E),
	!.

affiche_elements([E|Es]) :-
	affiche_element(E),
	et,
	affiche_elements(Es).

% ----------
affiche_element(dans(Var, Domaine)) :-
	write_domaine(Var, Domaine),
	!.

affiche_element(Contrainte) :-
	writeln_contrainte(Contrainte).

% ----------
write_domaines_singletons([], [], _Tab) :-
	!.
	
write_domaines_singletons([Domaine_singleton|Domaines_singletons],
						  [Exp|Exps], Tab) :-
	tabulation:tab(Tab),
	write_domaine_singleton(Domaine_singleton, Exp),
	write_domaines_singletons(Domaines_singletons, Exps, Tab).
	
% ----------
write_domaine_singleton(s(Variable, Valeur), dans(Variable, [Valeur])) :-
	write(Variable),
	write(' = '),
	writeln(Valeur),
	et.

% ---------
write_reduction_domaine(_Var, Domaine, Domaine) :-
    !.

write_reduction_domaine(Var, Domaine, Domaine_reduit) :-
    write('the domaine of '),
    write(Var),
    write(' comes from '),
    write(Domaine),
    write(' to '),
    writeln(Domaine_reduit).
    
% ----------
writeln_contrainte(Contrainte) :-
    write_contrainte(Contrainte),
    nl.

% ----------   
write_contrainte(si_alors(Si, Alors)) :-
	!,
	write('if '),
	write_contrainte(Si),
	write(' then '),
	write_contrainte(Alors).
	
write_contrainte(Comp1 <=> Comp2) :-
	!,
	liste:write_infix(Comp1),
	write(' <=> '),
	liste:write_infix(Comp2).

write_contrainte(Contrainte) :-
	traduction:traduit(Contrainte, Contrainte1),
    liste:write_infix(Contrainte1).

% ---------
traduit_couleurs(Comp_couleurs, Comp_couleurs_out) :-
	Comp_couleurs=..[Op, C1, C2],
	traduit_op_couleur(Op, Op1),
	Comp_couleurs_out =..[Op1, C1, C2].

% ---------
write_quotes(Terme) :-
    write("'"),
    write(Terme),
    write("'").

% ------
write_quotes_contrainte(Contrainte) :-
    write("'"),
    write_contrainte(Contrainte),
    write("'").

% ----------
saut_contrainte :-
	nl.

% ----------
separateur_contrainte :-
	writeln('______').

% ---------
implique :-
        writeln('    ---->').

% ----------
implique2 :-
              write('    ----> ').

mais :-
	writeln('    but').

donc :-
	writeln('    then').
% ----------
et :-
	writeln('    and').
	
% -----
et_comme :-
	nl,
	writeln('    and because '),
	nl.

% ----------
write_tab(Message) :-
	write('   '),
	write(Message).

% ----------
writeln_tab(Message) :-
	write_tab(Message),
	nl.

% ----------
antecedents_multiples([]) :-
    !.

antecedents_multiples([A]) :-
    writeln(A), 
    !.

antecedents_multiples([A|L]) :-
    !,
    writeln(A),
    et,
    antecedents_multiples(L).

% ----------
si_alors(Si, Alors) :-
    write_contrainte(Si),
    write(' would imply '),
    writeln_contrainte(Alors).

/* ===============================  DIVERS ================================= */

% ----------
write_numero_deduction(_Tab, K) :-
	%tabulation:tab(Tab),
	write('   ('),
	write(K),
	write(') ').

% ----------
affiche_exp(expl(Deduction, Antecedents), Tab) :-
	affiche_tab_point(Deduction, Tab),
	tabule(tabulation:tab(Tab), Tab1),
	affiche_exp_antecedents(Antecedents, Tab1).

% ----------
affiche_exp_antecedents([], _Tab) :-
	!.

affiche_exp_antecedents([Antecedent|Antecedents], Tab) :-
	affiche_exp(Antecedent, Tab),
	affiche_exp_antecedents(Antecedents, Tab).

% ----------
affiche_tab_point(Element, Tab) :-
	write(Tab),
	write('. '),
	writeln(Element).

% ----------
affiche_tab(Element, Tab) :-
	write(Tab),
	writeln(Element).

% ----------
implique_exp(Tab):-
	nl,
	tabulation:tab(Tab),
	write('             => ').

% ----------
impliquerait :-
   format(' would imply', []).

% ----------
retour_ligne :-
	format('~n~n', []).

% ----------
writeln_domaine(Var, Domaine) :-
	write_domaine(Var, Domaine),
	nl.

% ----------
/*
write_domaine(Var, [Valeur]) :-
	!,
	format('~w = ~w', [Var, Valeur]).
*/

write_domaine(Var, Domaine) :-
	format('~w in ~w', [Var, Domaine]).

% ----------

ecrire_domaine([Valeur]) :-
	!,
    write(Valeur).

ecrire_domaine(Domaine) :-
	write('in '),
    write(Domaine).

% ----------
affiche_liste([], _Tab, _K) :-
	!.

affiche_liste([E], Tab, K) :-
    tab(Tab),
	affiche_element2(E),
    	write_numero_deduction(Tab, K).

affiche_liste([E|Es], Tab, K) :-
    tab(Tab),
	affiche_element2(E),
    	write_numero_deduction(Tab, K),
    nl,
	K1 is K+1,
	affiche_liste(Es, Tab, K1).

% ----------

affiche_element2(Var dans Domaine) :-
	!,
	format('~w in ~w', [Var, Domaine]).

affiche_element2(si_alors(Condition, Alors)) :-
    !,
    check_arguments:separer_arguments(Condition, Condition1),
    check_arguments:separer_arguments(Alors, Alors1),
    format('if ~w then ~w', [Condition1, Alors1]).

affiche_element2(E) :-
	check_arguments:separer_arguments(E, E1),
	format('~w', [E1]).

% ----------
sauts_ligne(0) :-
    !.

sauts_ligne(N) :-
    nl,
    N1 is N-1,
    sauts_ligne(N1).

% ----------
    % convertit la liste en atome avec arguments separes
convertit_ordre_couleurs([E], E) :-
    !.

convertit_ordre_couleurs([E|L], B) :-
    !,
    atom_concat(E, ' ', E1),
    atom_concat(E1, ' ', E2),
    convertit_ordre_couleurs(L, A),
	atom_concat(E2, A, B).

/* ================================ FIN LISTING ============================= */
