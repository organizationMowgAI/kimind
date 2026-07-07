/* ========================================================================== */
/*                           GESTION DES DEDUCTIONS                           */
/* ========================================================================== */

:- module(
          gere_deductions,
		  [
			analyse_deductions/2,			
			supprime_deduction/3,
            tri_croissant_deductions/2,
            tri_decroissant_deductions/2,
            couleurs_avant_valeurs/2
		  ]
         ). 
 
:-
	use_module(operateurs),
	use_module(liste),
	use_module(affichage_deductions),
    use_module(deduction),
    use_module(comparaisons),
    use_module(graphe).

% ----------    	
analyse_deductions(Deductions, Deductions_out) :-
    %length(Deductions, N),
    % write(N),
    % writeln(' Deductions initiales'),
	% liste:display_liste('deductions initiales', Deductions),
    couleurs_avant_valeurs(Deductions, Deductions1),
    ordonner_sommes(Deductions1, Deductions2),
	liste:display_liste('Deductions2', Deductions2),
    ordonne_deductions(Deductions2, Deductions3),
	liste:display_liste(Deductions3),
    % supprime_deductions_inutiles(Deductions3, Deductions4),
	Deductions4 = Deductions3,
    %length(Deductions4, N1),
    % write(N1),
    % writeln(' Deductions finales'),
    renumerote_deductions(Deductions4, Deductions_out).
    % liste:display_liste(Deductions_out).
	% liste:display_liste('deductions_out :', Deductions_out).

/* ======================== GRAPHE DES DEDUCTIONS ============================ */
 
% ----------
    % Les deductions sont classees par ordre de numeros croissants
cherche_deductions_filles([], []) :-
    !.

cherche_deductions_filles([Deduction|Deductions], 
                           [d(N,But)-Deductions_filles|Arretes]):-
    deduction:get_numero_deduction(Deduction, N),
    deduction:get_consequents_deduction(Deduction, [But]),
    deductions_filles(Deductions, N, But, Deductions_filles),
    cherche_deductions_filles(Deductions, Arretes).

% ----------
    % Deductions est classe par ordre de numeros croissants
    % les numeros etant superieurs a N
deductions_filles(Deductions, N, But, Deductions_filles) :-
    findall(d(N1, But1), 
            (
              member(Deduction_fille, Deductions),
              deduction:get_numero_deduction(Deduction_fille, N1),
              N1 > N, 
              deduction:get_antecedents_deduction(Deduction_fille, Ante),
              deduction:get_consequents_deduction(Deduction_fille, [But1]),
              member(But, Ante)
            ), 
            Deductions_filles).
  
/* =================== SUPPRESSION DEDUCTIONS INUTILES ====================== */

% ----------
supprime_deductions_inutiles(Deductions, Deductions_out) :-
    supprime_deductions_sans_variable(Deductions, Deductions1),
                        % pour conserver ordre des atoms dans les 
                        % antecedents et consequents
    duplicate_term(Deductions1, DeductionsA),
    ordonne_antecedents_consequents(DeductionsA, DeductionsB),
    supprime_deductions_redondantes(DeductionsB, DeductionsC),
    retire_deductions_superflues(DeductionsC, DeductionsD),
    filtre_deductions(Deductions1, DeductionsD, Deductions_out).
    
% ----------
    % retire les deductions au dela de la derniere reduction de domaine
    % Consequent = [dans(...)]
retire_deductions_superflues(Deductions, Deductions_out) :-
    reverse(Deductions, Deductions1),
    retire_deductions_superflues2(Deductions1, Deductions2),
    reverse(Deductions2, Deductions_out).

% ----------
retire_deductions_superflues2([], []) :-
    !.

retire_deductions_superflues2([e(N, Type, Ante, Conse)|Deductions], 
                              [e(N, Type, Ante, Conse)|Deductions]) 
                              :-
    member(_Var dans _Domaine, Conse),	% conserve deduction dont le Consequent 
										% contient var dans Domaine
    !.

retire_deductions_superflues2([_Deduction|Deductions], Deductions1) :-
    retire_deductions_superflues2(Deductions, Deductions1).

% ----------
    % ne conserve que les Deductions dont les numeros sont 
    % dans Deductions_temoins
filtre_deductions(Deductions, Deductions_temoins, Deductions_out) :-
    get_numeros_deductions(Deductions_temoins, Numeros),
    conserve_deductions(Deductions, Numeros, Deductions_out).

% ----------
get_numeros_deductions(Deductions, Numeros) :-
    findall(N, member(e(N, _Type, _Ante, _Conse), Deductions), Numeros).

% ----------
conserve_deductions(_Explis, [], []) :-
    !.

conserve_deductions([Expli|Explis], Numeros, [Expli|Explis1]) :-
    get_num_expli(Expli, N),
    select(N, Numeros, Numeros1),
    !,
    conserve_deductions(Explis, Numeros1, Explis1).

conserve_deductions([_Expli|Explis], Numeros, Explis1) :-
    conserve_deductions(Explis, Numeros, Explis1).

% ----------
get_num_expli(e(N, _Type, _Ante, _Conse), N).

/* ===================== REFORMULATION DES DEDUCTIONS ======================= */

% ----------
    % les antecedents et consequents des deductions sont
    % reordonnes :
	%   - toutes les comparaisons sont reformulees de façon a n'avoir
    %     que les operateurs < et =<, avant et avant_meme_rang
	%   - les comparaisons sont reeordonnees 
	%   - les listes sont reeordonnes par ordre lexicographie
ordonne_antecedents_consequents([], []) :-
    !.

ordonne_antecedents_consequents([Deduction|Deductions], 
                     [Deduction1|Deductions1]) :-
    deduction:ordonne_deduction(Deduction, Deduction1),
    ordonne_antecedents_consequents(Deductions, Deductions1).    

% ----------
    % idem que reformule deduction mais ne fait pas sort
ordonne_deductions([], []) :-
    !.

ordonne_deductions([Deduction|Deductions], [Deduction1|Deductions1]) :-
    deduction:ordonne_deduction(Deduction, Deduction1),
    ordonne_deductions(Deductions, Deductions1).    

/* ======================== SUPPRESSION DES DEDUCTIONS ====================== */

% ----------
    % supprime les Deductions identiques
supprime_deductions_redondantes([], []) :-
    !.

supprime_deductions_redondantes([Expli|Explis], 
                                [Expli|Explis_out]) :-
    supprime_deductions_redondantes2(Explis, Expli, Reste),
    supprime_deductions_redondantes(Reste, Explis_out).

% ----------
    % supprime les Deductions redondantes avec Deduction
supprime_deductions_redondantes2([], _Expli, []) :-
    !.

supprime_deductions_redondantes2([Expli1|Deductions], Expli,
                                  Deductions_out) :-
    deductions_identiques(Expli1, Expli),
    !,
    supprime_deductions_redondantes2(Deductions, Expli, Deductions_out).

supprime_deductions_redondantes2([Expli1|Deductions], Expli,
                                 [Expli1|Deductions_out]) :-
    supprime_deductions_redondantes2(Deductions, Expli, Deductions_out).

% ----------
deductions_identiques(Deduction1, Deduction2) :-
	deduction:ordonne_deduction(Deduction1, DeductionA),
	deduction:ordonne_deduction(Deduction2, DeductionB),
	deduction:memes_deductions(DeductionA, DeductionB).

% ----------
supprime_deductions_sans_variable([], []) :-
    !.

supprime_deductions_sans_variable([Deduction|Deductions], Deductions1) :-
    deduction_sans_variable(Deduction),
    !,
    supprime_deductions_sans_variable(Deductions, Deductions1).

supprime_deductions_sans_variable([Deduction|Deductions], 
                                     [Deduction|Deductions1]) :-
    !,
    supprime_deductions_sans_variable(Deductions, Deductions1).

% ----------
    % le consequence de l'Deductions est sans variable
deduction_sans_variable(e(_N, _Type, _Antecedents, Consequents)):-
    check_arguments:variables_impliquees(Consequents, []).    

% ----------
	% supprime d'Deductions l'Deduction relative au Motif
supprime_deduction(Deductions, Motif, Deductions_out) :-
	select_deductions(Deductions, Motif, Deductions_out).

% ----------
select_deductions([], _Motif, []) :-
	!.

select_deductions([Deduction|Deductions], Motif, Deductions) :-
	dans_deduction(Motif, Deduction),
	!.

select_deductions([Deduction|Deductions], Motif, 
					[Deduction|Deductions1]) :-
	select_deductions(Deductions, Motif, Deductions1).

/* ============================== DIVERS ==================================== */

% ----------
  % les sommes v3 + v2 + v1 = valeur sont mises dans l'ordre
    % v1 + v2 + v3 = valeur 
ordonner_sommes([], []) :-
    !.

ordonner_sommes([Deduction|Deductions], [Deduction1|Deductions1]) :-
    deduction:ordonner_sommes_deduction(Deduction, Deduction1),
    ordonner_sommes(Deductions, Deductions1).

% ----------
    % les equivalences valeurs <=> couleurs sont reformulees
    % couleurs <=> valeurs
couleurs_avant_valeurs([], []) :-
    !.

couleurs_avant_valeurs([Deduction|Deductions], [Deduction1|Deductions1]) :-
    deduction:check_comparaisons_deduction(Deduction, Deduction1),
    couleurs_avant_valeurs(Deductions, Deductions1).

% ----------
tri_croissant_deductions(Deductions, Deductions_out) :-
    sort(1, @=<, Deductions, Deductions_out).

% ----------
tri_decroissant_deductions(Deductions, Deductions_out) :-
    sort(1, @>=, Deductions, Deductions_out).

% ----------
dans_deduction(Motif, e(_N, _Antecedents, [Motif])).

% ----------
renumerote_deductions(Deductions, Deductions_out) :-
    renumerote_deductions2(Deductions, 0, Deductions_out).

% ----------
renumerote_deductions2([], _Num_dispo, []) :-
    !.

renumerote_deductions2([Deduction|Deductions], Num_dispo,
                         [Deduction1|Deductions1]) :-
    numerote_deduction(Deduction, Num_dispo, Deduction1),
    Num_dispo1 is Num_dispo+1,
    renumerote_deductions2(Deductions, Num_dispo1, Deductions1).

% ---------
numerote_deduction(e(rep(_N), Type, Ante, Conse), Num_dispo,
                     e(rep(Num_dispo), Type, Ante, Conse)) :-
    !.

numerote_deduction(e(_N, Type, Ante, Conse), Num_dispo,
                     e(Num_dispo, Type, Ante, Conse)).

%----------
	% groupe les Deductions par position

groupe_deductions_position(Deductions, Deductions_position) :-
	groupe_deductions_position2(Deductions, 0, Deductions_position).

% ----------
groupe_deductions_position2([], _Position, []) :-
	!.

groupe_deductions_position2(Deductions, Position, 
							  [ex(Position, Exp_pos)| Exp_pos1]) :-
	get_deductions_position(Deductions, Position, Exp_pos, Reste),
	Position1 is Position+1,
	groupe_deductions_position2(Reste, Position1, Exp_pos1).

% ----------
get_deductions_position([], _Position, [], []) :-
	!.

get_deductions_position([Deduction|Deductions], Position,
						 [Deduction|Deductions_pos], Reste) :-
	get_vars_antecedents(Deduction, Vars),
	all_vars_meme_position(Vars, Position),
	!,
	get_deductions_position(Deductions, Position, Deductions_pos, Reste).

get_deductions_position([Deduction|Deductions], Position,
						  Deductions_pos, [Deduction|Reste]) :-
	get_deductions_position(Deductions, Position, Deductions_pos, Reste).

% ----------
all_vars_meme_position([], _Position) :-
	!.

all_vars_meme_position([Var|Vars], Position) :-
	atom_concat(_Var1, Position, Var),
	all_vars_meme_position(Vars, Position).


% ----------
get_vars_antecedents(e(_N, _Type, Antecedents, _Consequences), Vars) :-
	check_arguments:variables_impliquees(Antecedents, Vars).

% ----------
	% recupere les Deductions correspondant aux reponses du systeme
get_reponses(Deductions, Deductions_reponse, Reste) :-
	findall(e(rep(N), Type, Antecedents, Consequents), 
			member(e(rep(N), Type, Antecedents, Consequents), Deductions),
			Deductions_reponse),
	subtract(Deductions, Deductions_reponse, Reste).

/* ============================== FIN LISTING ================================ */
