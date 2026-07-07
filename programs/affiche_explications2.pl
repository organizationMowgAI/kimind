/* ========================================================================== */
/*            AFFICHE LES  EXPLICATIONS DES REDUCTIONS DES DOMAINES           */
/* ========================================================================== */

:- module(affiche_explications2,     
          [
            affiche_explications_reductions/1,
            affiche_explication_reduction/1,

			display_raisonnements_profondeur/1,
            display_raisonnement_inverse/1,
			affiche_explication_inverse/4,
			affiche_explications_inverse/4
          ]
          ).

:- 
	use_module(affichage_deductions2),
	use_module(explication),
    use_module(tabulation),
	use_module(operateurs),
	use_module(options),
	use_module(traduction).

:- 
	options:affiche_types_deductions.

/* ========================== AFFICHE EXPLICATIONS ========================== */

% ----------
affiche_explications_reductions([]) :-
    !.	

affiche_explications_reductions([Reduction|Reductions]) :-
    affiche_explication_reduction(Reduction),
    affiche_explications_reductions(Reductions).
    
% ----------
affiche_explication_reduction(reduction(Var, Domaine, Explication)) :-
	nl,
	writeln('------------------------------------------------------------'),
    presentation(Var, Domaine),
    affiche_une_explication2(Explication).

% ----------
affiche_explications2([]) :-
	!.

affiche_explications2([Explication|Explications]) :-
	affiche_explication(Explication),
	affiche_explications2(Explications).

% ----------
affiche_explications_simples([]) :-
	!.

affiche_explications_simples([Expli|Explis]) :-
	affiche_explication_simple(Expli),
	affiche_explications_simples(Explis).

% ----------
    % un explication est la racine d'un arbre
    % l'affichage correspond a un parcours infixe 

affiche_une_explication2(Explication) :-
	explication:get_type_explication(Explication, reduction_reponse),
	!,
	affiche_explication_simple(Explication).

    % explication simple (correspond a une feuille)
affiche_une_explication2(Explication) :-
	explication:get_explications_explication(Explication, []),
	!,
	affiche_explication_simple(Explication),
    nl.

affiche_une_explication2(expl(e(N, _Type, _Ante, Buts1), Explications)) :-
	explis_composees_simples(Explications, Explis_composees, Explis_simples),
	recupere_buts(Explis_composees, Buts),
	affiche_les_explications(Explis_composees),
    affiche_explications_simples(Explis_simples),
	affiche_buts(Buts),
    affiche_numero(N),
	format('~|~` t~5|=> ', []),
	affiche_buts(Buts1),
	nl,
    nl.

% ----------
affiche_explication_simple(expl(e(N, Type, _Antecedents, Buts), [])) :-
	!,
    affiche_numero(N),
    affiche_buts(Buts),
	affiche_type(Type).

% ----------
affiche_les_explications([]) :-
	!.

affiche_les_explications([Explication|Explications]) :-
	affiche_une_explication2(Explication),
	affiche_les_explications(Explications).

% ----------
	% partitionne les explications en explications 
    % simples (ne sont pas expliquees par d'autres explications)
	% et les explications composees (non simples)
explis_composees_simples([], [], []) :-
	!.

	% explication simple
explis_composees_simples([expl(Deduction, [])|Explis], Explis_composees, 
                         [expl(Deduction, [])|Explis_simples]) :-
	!,
	explis_composees_simples(Explis, Explis_composees, Explis_simples).

explis_composees_simples([Expli|Explis], [Expli|Explis_composees], 
                         Explis_simples) :-
	explis_composees_simples(Explis, Explis_composees, Explis_simples).

% ----------
affiche_explication(e(_N, Antecedents, Consequents)) :-
	separateur_contrainte,
	affiche_elements(Antecedents),
	implique,
	affiche_elements(Consequents),
	separateur_contrainte,
	saut_contrainte.

/* ======= AFFICHE EXPLICATIONS EN PARTANT DE LA REDUCTION INITIALE ========= */

% ----------
	% affiche les raisonnements faits pour chaque 
	% reduction de domaine d'une variable
display_raisonnements_profondeur([]) :-
	!.

display_raisonnements_profondeur([Reduction|Reductions]) :-
	display_raisonnement_inverse(Reduction),
	display_raisonnements_profondeur(Reductions).
	 
% ----------
display_raisonnement_inverse(reduction(Variable, Domaine, Explication)) :-
	presentation(Variable, Domaine),
	affiche_explication_inverse(Explication, '', 1, 2).

% ---------- 
presentation(V, Domaine_final) :-
	carte:get_position_carte(V, Pos),
    carte:get_type_carte(V, Type),
    carte:get_nom_variable(Type, Pos, Nom_var),
    nl,
    write('the '),
    traduction:write_traduction(Type),
    write( ' ('),
    write(Nom_var),
    write(') of the card in position '),
    write(Pos),
	write(' is '),
	ecrire_domaine(Domaine_final),
	writeln(' : '),
    nl.

% ----------
	% affiche une explication
	% et lance l'affichage des explications dont elle depend

	% Buts est une liste de Buts (eventuellement un singleton)
	
% ----------
affiche_explication_inverse(expl(e(N, Type, _Antecedents, Buts), []), 
                            Tab, Num_deduction, _Num_antecedent) :-
    type_connu(Type, Type1),
    !,
    affiche_en_tete(N, Buts, Tab, Num_deduction),
	affiche_type(Type1).

affiche_explication_inverse(expl(e(N, Type, [], Buts), []), 
                            Tab, Num_deduction, _Num_antecedent) :-
    member(Type, [reduction_reponse, reponse, contrainte_initiale,
                  domaine_initial]),
	!,
    affiche_en_tete(N, Buts, Tab, Num_deduction),
	affiche_type(reponse).

affiche_explication_inverse(expl(e(N, _Type, _Antecedents, Buts), 
                                 Explications), 
                            Tab, Num_deduction, Num_antecedent) :-
    affiche_en_tete(N, Buts, Tab, Num_deduction),
    tabulation:tab_plus(Tab, Tab1),
    writeln(' : '),
    affiche_explications_inverse(Explications, Tab1, Num_deduction, 
                                 Num_antecedent).

% ----------
affiche_explications_inverse([], _Tab, _Num_deduction, _Num_antecedent) :-
    !.

affiche_explications_inverse([Explication|Explications], 
                              Tab, Num_deduction, Num_antecedent) :-
    affiche_explication_inverse(Explication, Tab, Num_deduction, Num_antecedent),
    affiche_explications_inverse(Explications, Tab, 
                                 Num_deduction, Num_antecedent).

% ----------
	% affiche les explications qui sont sur le meme plan (Tab)
display_explications_inverse([], _Tab, _Num_deduction, _Num_antecedent) :-
	!.

display_explications_inverse([Explication|Explications], Tab, 
							  Num_deduction, Num_antecedent) :-
	affiche_explication_inverse(Explication, Tab, 
								Num_deduction, Num_antecedent),
	explication:get_deduction_explication(Explication, Deduction),
	deduction:get_nb_antecedents_deduction(Deduction, Nb_antecedents),
	Num_deduction1 is Num_deduction + 1,
    (
        Nb_antecedents == 0
        -> Num_antecedent1 is Num_antecedent + 1 
	    ;  Num_antecedent1 is Num_antecedent + Nb_antecedents
    ),
    tabulation:tab_plus(Tab, Tab1),
	display_explications_inverse(Explications, Tab1, 
								 Num_deduction1, Num_antecedent1).

/* =================================== DIVERS =============================== */

% ----------
	% recupere les buts des explications
recupere_buts([], []) :-
	!.

recupere_buts([Explication|Explications], [But|Buts]) :-
	explication:get_but_explication(Explication, But),
	recupere_buts(Explications, Buts).
	
% ----------	
affiche_numero(N) :-
	kimind_run:affiche_numeros_deductions,
	!,
    write('('),
    write(N),
    write(') ').

affiche_numero(_N).

% ----------
affiche_buts([]) :-
	!.

	% evite saut de ligne
affiche_buts([But]) :-
	!,
	affiche_but(But).

affiche_buts([But|Buts]) :-
	affiche_but(But),
	nl,
	affiche_buts(Buts).

% ----------
affiche_but(But) :-
	affichage_deductions2:write_contrainte(But).

% ----------
affiche_type(Type) :-
	kimind_run:affiche_types_deductions,
	!,
	affiche_type2(Type).

affiche_type(_Type) :-
    nl.

% ----------
type_connu(connu, connu) :-
    !.

type_connu(Connu_type, Type) :-
    atom_concat('known_', Type, Connu_type).

% ----------
affiche_type2(reponse) :-
    !,
	format('~|~` t~40|: answer of the system ~n', []).

affiche_type2(reduction_reponse) :-
    !,
	format('~|~` t~40|: answer of the system ~n', []).

affiche_type2(domaine_initial) :-
    !,
	format('~|~` t~40|: known domain ~n', []).

affiche_type2(contrainte_initiale) :-
    !,
	format('~|~` t~40|: intial constraint ~n', []).

affiche_type2(connu) :-
    !,
	format('~|~` t~40|: seen ~n', []).

affiche_type2(connu_reduction) :-
    !,
	format('~|~` t~40|: seen ~n', []).

affiche_type2(connu_somme_trop_petite) :-
    !,
	format('~|~` t~40|: seen ~n', []).

affiche_type2(connu_somme_trop_petite) :-
    !,
	format('~|~` t~40|: seen ~n', []).

affiche_type2(connu_contrainte_initiale) :-
    !,
	format('~|~` t~40|: seen ~n', []).

affiche_type2(connu_max) :-
    !,
	format('~|~` t~40|: seen ~n', []).

affiche_type2(Type) :-
	format('~|~` t~40|: ~w ~n', [Type]).

% ----------
affiche_explications(Explications, Numero_coup, Coup) :-
	nl,
	write('-------------- '),
	write('Deductions faites à partir des informations du coup '),
	write(Numero_coup),
	writeln(' ----------'),
	affichage_contraintes:affiche_coup(Coup),
	nl,
	affiche_explications2(Explications),
	nl.

% ----------
	% un seul but
affiche_en_tete(N, [But], Tab, _Num_deduction) :-
	!,
    tabulation:tab(Tab),
	affiche_numero(N),
	affichage_deductions2:affiche_element2(But).

	% plusieurs buts
affiche_en_tete(N, Buts, Tab, _Num_deduction) :-
	!,
    tabulation:tab(Tab),
	affiche_numero(N),
	affichage_deductions2:affiche_element2(Buts).

% ----------
affiche_en_tete2(_N, [], _Tab, _Num_deduction) :-
	!.

affiche_en_tete2(N, [But|Buts], Tab, _) :-
	affiche_en_tet(N, But, Tab, _),
	affiche_en_tete2(N, Buts, Tab, _). 
	
% ----------
g(Var dans Domaine) :-
	!,
	affichage_deductions:write_domaine(Var, Domaine).

/* ============================== FIN LISTING =============================== */
