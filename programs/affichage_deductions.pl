:- module(
			affichage_deductions,
		    [
				affiche_simplification_equivalence/4,
				affiche_suppression_equivalence/4,
				affiche_instantiation_variable/4,
                affiche_contrainte_domaine_couleur/4, 
                affiche_contrainte_domaine_valeur/4,
				affiche_somme_trop_petite/4,
			    affiche_somme_trop_grande/4,
				affiche_reduction/4,

                ecrire_domaine/1,
				write_domaine/2,
				writeln_domaine/2,

				display_deductions/1,
				display_deductions/2,
                display_deduction/4,
				
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
display_deduction(e(_N, reponse, [], _Consequent), _Tab, 
				  _Num_deduction, _Num_antecedent) :-
	!,
	writeln('réponse du système').

display_deduction(e(N, Type, Antecedents, [Consequent]), Tab, 
				  Num_deduction, Num_antecedent) :-
	tabulation:tab(Tab),
	write('('),
	write(Num_deduction),
	writeln(')'),
	tabulation:tab(Tab),
	affiche_element2(Consequent),
	write(' : '),
	tabulation:tab_plus(Tab, Tab1),
	display_deduction2(e(N, Type, Antecedents, [Consequent]), Tab1, 
						Num_antecedent),
	nl,
	nl.

% ----------
display_deduction2(e(_N, si_alors, Antecedents, [Consequent]), Tab, K) :-
    !,
    affiche_si_alors(Antecedents, Consequent, Tab, K).

display_deduction2(e(_N, max, [Antecedent], [max(V, Max)]), Tab, K) :-
	!,
	affiche_max(Antecedent, V, Max, Tab, K).

display_deduction2(e(_N, min, [Antecedent], [min(V, Min)]), Tab, K) :-
	!,
	affiche_min(Antecedent, V, Min, Tab, K).

display_deduction2(e(_N, connu, _Ante, But), Tab, K) :-
	!,
	affiche_but_connu(But, Tab, K).

display_deduction2(e(_N, somme, [], [Somme]), Tab, K) :-
    !,
    affiche_somme(Somme, Tab, K).

display_deduction2(e(_N, var_dans_domaine, [], [Var dans Domaine]), Tab, K) :-
    !,
    affiche_domaine(Var dans Domaine, Tab, K).

display_deduction2(e(_N, somme_trop_grande, Antecedents, [Consequent]), 
                   Tab, K) :-
	!,
	affiche_somme_trop_grande(Antecedents, Consequent, Tab, K).

display_deduction2(e(_N, somme_trop_petite, Antecedents, [Consequent]), 
				   Tab, K) :-
	!,
	affiche_somme_trop_petite(Antecedents, Consequent, Tab, K).
    
display_deduction2(e(_N, contrainte_initiale, [], [Contrainte]), Tab, K) :-
	!,
	affiche_contrainte_initiale(Contrainte, Tab, K).

display_deduction2(e(_N, domaine_initial, [], Consequents), Tab, K) :-
	!,
	affiche_domaine_initial(Consequents, Tab, K).

display_deduction2(e(_N, reponse, [], Consequents), Tab, K) :-
	!,
	affiche_reponse_systeme(Consequents, Tab, K).

display_deduction2(e(_N, simplification_equivalence, 
                      Antecedents, Consequents), Tab, K) :-
	!,
	affiche_simplification_equivalence(Antecedents, Consequents, Tab, K).

display_deduction2(e(_N, suppression_equivalence, 
                      Antecedents, Consequents), Tab, K) :-
	!,
	affiche_suppression_equivalence(Antecedents, Consequents, Tab, K).

display_deduction2(e(_N, instantiation_variable_valeur, 
                      Antecedents, Consequents), Tab, K) :-
	!,
	affiche_instantiation_variable(Antecedents, Consequents, Tab, K).

display_deduction2(e(_N, instantiation_variable_couleur, 
                      Antecedents, Consequents), Tab, K) :-
	!,
	affiche_instantiation_variable(Antecedents, Consequents, Tab, K).

display_deduction2(e(_N, reduction, Antecedents, Consequents), Tab, K) :-
	!,
	affiche_reduction(Antecedents, Consequents, Tab, K).

display_deduction2(e(_N, contrainte_domaine_valeur, 
                        Antecedents, Consequents), Tab, K) :-
	!,
	affiche_contrainte_domaine_valeur(Antecedents, Consequents, Tab, K).

display_deduction2(e(_N, contrainte_domaine_couleur, 
                        Antecedents, Consequents), Tab, K) :-
	!,
	affiche_contrainte_domaine_couleur(Antecedents, Consequents, Tab, K).

/* =========================  AFFICHAGE DEDUCTIONS ========================== */

% ----------
affiche_si_alors(Antecedents, _Alors, Tab, K) :-
    nl,
    affiche_liste(Antecedents, Tab, K).

    % implique_exp(Tab),
    % affiche_element2(Alors).
    
% ----------
affiche_max(Var dans Domaine, Var, _Max, Tab, K) :-
    nl,
    check_arguments:separer_arguments(Domaine, Domaine1),
    tab(Tab),
    write_domaine(Var, Domaine1),
    write_numero_deduction(Tab, K).

    % implique_exp(Tab),
    % format('la valeur max de ~w est ~w', [Var, Max]).

% ----------
affiche_min(Var dans Domaine, Var, _Min, Tab, K) :-
    nl,
    check_arguments:separer_arguments(Domaine, Domaine1),
    tab(Tab),
    write_domaine(Var, Domaine1),
    write_numero_deduction(Tab, K).

    % implique_exp(Tab),
    % format('la valeur min de ~w est ~w', [Var, Min]).

% ----------
affiche_but_connu([_But], Tab, K) :-
    % nl,
    % check_arguments:separer_arguments(But, But1),
	format(' (deja vu)', []),
    	write_numero_deduction(Tab, K).

% ----------
/*
affiche_contrainte_initiale(_Contrainte, _Tab, _K) :-
	write(' (contrainte initiale)').
*/

affiche_contrainte_initiale(_Contrainte, _Tab, _K) :-
    !,
    % nl,
    % tab(Tab),
    % check_arguments:separer_arguments(Contrainte, Contrainte1),
    write(' contrainte initiale').
	% format('~w (contrainte initiale)', [Contrainte1]),
    	% write_numero_deduction(Tab, K).

% ----------

affiche_domaine_initial([_], _Tab, _K) :-
    % nl,
    % tab(Tab),
    % check_arguments:separer_arguments(Domaine, Domaine1),
	format(' domaine connu', []).
	% write_domaine(Var, Domaine1),
    % 	write_numero_deduction(Tab, K).

affiche_domaine(Var dans Domaine, Tab, K) :-
    nl,
    tab(Tab),
    check_arguments:separer_arguments(Domaine, Domaine1),
    format('~w dans ~w', [Var, Domaine1]),
    	write_numero_deduction(Tab, K).
    
% ----------
affiche_reponse_systeme([_Reponse], _Tab, _K) :-
    % nl,
    % tab(Tab),
    % check_arguments:separer_arguments(Reponse, Reponse1),
	format(' reponse du systeme', []).
    	% write_numero_deduction(Tab, K).

% ---------
	% reduction du a une reponse du system
% affiche_reduction([], [_], _Tab, _K) :-
%     !,

affiche_reduction([], [dans(Var, Domaine_reduit)], Tab, K) :-
    !,
    nl,
    tab(Tab),
	format('le syteme a repondu ', []),
	write_domaine(Var, Domaine_reduit),
    	write_numero_deduction(Tab, K).

affiche_reduction(Antecedents, [dans(_Var, _Domaine_reduit)], Tab, K) :-
    nl,
	affiche_liste(Antecedents, Tab, K).
	% implique_exp(Tab),
	% write_domaine(Var, Domaine_reduit).
 
% ----------
affiche_simplification_equivalence([Comparaison, Equivalence], 
								   [_ComparaisonA], Tab, K) :-
    nl,
    tab(Tab),
	check_arguments:separer_arguments(Comparaison, Comparaison1),
	format('~w ~n', [Comparaison1]),
    write_numero_deduction(Tab, K),
	K1 is K+1,
	check_arguments:separer_arguments(Equivalence, Equivalence1),
    tab(Tab),
	format('~w ', [Equivalence1]),
    write_numero_deduction(Tab, K1).

	% implique_exp(Tab),
	% check_arguments:separer_arguments(ComparaisonA, ComparaisonB),
	% format('~w', [ComparaisonB]).

% ----------
affiche_suppression_equivalence([Comparaison, Equivalence], 
                                [ComparaisonA], Tab, K) :-
    nl,
	check_arguments:separer_arguments(Comparaison, Comparaison1),
	check_arguments:separer_arguments(Equivalence, Equivalence1),
	check_arguments:separer_arguments(ComparaisonA, _ComparaisonB),
    tab(Tab),
	format('~w ~n', [Comparaison1]),
    write_numero_deduction(Tab, K),
	tabulation:tab(Tab), 
	format('~w', [Equivalence1]).
	% implique_exp(Tab),
	% format('~w', [ComparaisonB]).
	
% ----------
affiche_instantiation_variable(Antecedents, [Contrainte_modifiee], Tab, K) :-
    nl,
	affiche_liste(Antecedents, Tab, K),
	check_arguments:separer_arguments(Contrainte_modifiee, _Contrainte_modifiee1).
	% implique_exp(Tab),
    % format('~w', [Contrainte_modifiee1]).

% ----------
affiche_contrainte_domaine_couleur(Antecedents, [Contrainte], Tab, K) :-
    nl,
  	check_arguments:separer_liste_arguments(Antecedents, Antecedents1),
	affiche_liste(Antecedents1, Tab, K),
	check_arguments:separer_arguments(Contrainte, _Contrainte1).
	% implique_exp(Tab),
	% format('~w', [Contrainte1]).

% ----------
affiche_contrainte_domaine_valeur(Antecedents, [Contrainte], Tab, K) :-
    nl,
	affiche_liste(Antecedents, Tab, K),
	check_arguments:separer_arguments(Contrainte, _Contrainte1).
	% implique_exp(Tab),
	% format('~w', [Contrainte1]).

% ----------
affiche_somme(Somme = Valeur, Tab, K) :-
    nl,
    check_arguments:separer_arguments(Somme, Somme1),
	tabulation:tab(Tab),
    format('~w = ~w (contrainte initiale)', [Somme1, Valeur]),
    write_numero_deduction(Tab, K).
    
% ----------
affiche_somme_trop_petite(Antecedents, _Var dans _Domaine_reduit, Tab, K) :-
    nl,
    affiche_liste(Antecedents, Tab, K).
	% implique_exp(Tab),
	% write_domaine(Var, Domaine_reduit).
    
% ----------
affiche_somme_trop_grande(Antecedents, _Var dans _Domaine_reduit, Tab, K) :-
    nl,
    affiche_liste(Antecedents, Tab, K).
	% implique_exp(Tab),
	% write_domaine(Var, Domaine_reduit).


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
    write('le domaine de '),
    write(Var),
    write(' passe de '),
    write(Domaine),
    write(' a '),
    writeln(Domaine_reduit).
    
% ----------
writeln_contrainte(Contrainte) :-
    write_contrainte(Contrainte),
    nl.

% ----------   
write_contrainte(Comp1 <=> Comp2) :-
	!,
	liste:write_infix(Comp1),
	write(' <=> '),
	liste:write_infix(Comp2).

write_contrainte(Contrainte) :-
    liste:write_infix(Contrainte).

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
	writeln('    mais').

donc :-
	writeln('    donc').
% ----------
et :-
	writeln('    et').
	
% -----
et_comme :-
	nl,
	writeln('    et comme '),
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
    write(' impliquerait '),
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
   format(' impliquerait', []).

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
	format('~w dans ~w', [Var, Domaine]).

% ----------
/*
ecrire_domaine([Valeur]) :-
    write(Valeur), 
	!.
*/

ecrire_domaine(Domaine) :-
	write('dans '),
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
/*
affiche_element2(Var dans [Valeur]) :-
	!,
	format('~w = ~w', [Var, Valeur]).
*/

affiche_element2(Var dans Domaine) :-
	!,
	format('~w dans ~w', [Var, Domaine]).

affiche_element2(si_alors(Condition, Alors)) :-
    !,
    check_arguments:separer_arguments(Condition, Condition1),
    check_arguments:separer_arguments(Alors, Alors1),
    format('si ~w alors ~w', [Condition1, Alors1]).

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
