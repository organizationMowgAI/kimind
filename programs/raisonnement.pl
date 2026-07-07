/* ============= GERE LES RAISONNEMENTS A PARTIR DES DEDUCTIONS ============= */

:- module(
          raisonnement, 
          [      
            explique_deductions/5
          ]
		 ).

:- 
	use_module(liste),
    use_module(operateurs),
    use_module(gere_deductions),
    use_module(affichage_deductions),
    use_module(deduction),
    use_module(carte),
    use_module(affiche_explications2),
    use_module(utilitaires),
	use_module(check_arguments).

:- dynamic
	expli:domaine_initial/2,
	expli:domaine_final/2,
	expli:connu/4,
	expli:e/4,
	expli:dernier_numero_deduction/1.

/* =============================== EXPLICATIONS ============================= */ 

% ----------
    % explique les reductions de Domaines_initiaux a Domaines_finaux

explique_deductions(
                    [], 
                    _Domaines_initiaux, 
                    _Domaines_finaux, 
                    _Contraintes_initiales,
					[]
                    ) :-
	!.

explique_deductions(
                    Deductions, 
                    Domaines_initiaux, 
                    Domaines_finaux, 
                    Contraintes_initiales,
					Explications
                    ) :-

	initialise_dynamic,
	liste:display_liste(Deductions),
    utilitaires:degroupe(Contraintes_initiales, Contraintes_initiales1),
	determine_domaines(Contraintes_initiales1, Domaines_initiaux, 
					   Domaines_finaux,
					   Domaines_initiaux1, Domaines_finaux1),    
	
    assert_donnees(Deductions, Domaines_initiaux1, Domaines_finaux1, 
                   Contraintes_initiales1),

    affiche_connus,
    affiche_deductions,
    
    ordonne_domaines(Domaines_finaux2),
    explique_domaines_finaux2(Domaines_finaux2, Explications),
	efface_donnees.

% ----------
initialise_dynamic :-
	dynamic expli:domaine_initial/2,
			expli:domaine_final/2,
			expli:connu/4,
			expli:e/4,
			expli:dernier_numero_deduction/1.
	
% ----------
explique_domaines_finaux2([], []) :-
    !.

explique_domaines_finaux2([domaine_final(V,Domaine)|Domaines], 
                          [Reduction|Reductions]) :- 
	nl,
	nl,
	write('***** explication '),
	write(V),
	write(' dans '),
	write(Domaine),
	writeln(' *****'),
    explique_domaine_final2(domaine_final(V,Domaine), Explication),
    construit_reduction(Explication, V, Domaine, Reduction),
    explique_domaines_finaux2(Domaines, Reductions).

% ----------
construit_reduction(Explication, V, Domaine,
                    reduction(V, Domaine, Explication)).

% --------
construit_reductions([], _V, _Domaine, []) :-
    !. 

construit_reductions([Expli|Explis], V, Domaine, 
                      [reduction(V, Domaine, Expli)|Reductions]) :-
    construit_reductions(Explis, V, Domaine, Reductions).

% ----------
explique_domaines_finaux([], []) :-
    !.

explique_domaines_finaux(
			[domaine_final(V,Domaine)|Domaines], 
  		    [reduction(V, Domaine, Explication)|Explications]
						) :-
    explique_domaine_final(domaine_final(V,Domaine), Explication),
    explique_domaines_finaux(Domaines, Explications).
 
% ----------
    % retourne les plus petites explications du domaine_finale
explique_domaine_final2(domaine_final(V, Domaine), Explications) :-
    expli:dernier_numero_deduction(N),
    N1 is N+1,
    explique_but2(V dans Domaine, N1, Explications).

% ----------
explique_domaine_final(domaine_final(V, Domaine), Explication) :-
    expli:dernier_numero_deduction(N),
    N1 is N+1,
    explique_but(V dans Domaine, N1, Explication).

% ----------
    % retourne les plus petites explications de But
explique_but2(But, N, Explication) :-
	nl,
	write('but2 : '),
	writeln(But),
	writeln(N),
    (
		plus_petites_deductions(But, N, Deductions)
		-> true
		;  
			gtrace,
			writeln('echec 2')
    ),
    (
        Deductions == []
        ->    
            gtrace,
			writeln('!!! pas de plus petite deduction !!!'),
            writeln(N), 
            writeln(But)
        ;        
            writeln('plus petites deductions :'),
            writeln(Deductions),
            nl,            
			(
            	explique_deductions(Deductions, Explications)
				-> true
				;  
					gtrace,
					writeln('echec 3')
			),
            select_explication_minimale(Explications, Explication1),
			nl,
			writeln('explication minimale '),
			writeln(Explication1),
			(
				assert_connu(But, N, Explication1, Explication)
					-> true
					;  
						gtrace,
						writeln('oula')
			)            
    ).

% ----------
explique_but(But, N, Explication) :-
    (
        plus_petite_deduction(But, N, Deduction)
        ->     
            % writeln('plus petite deduction :'),
            % writeln(Deduction),
            % writeln(N),
            % nl,            
            explique_deduction(Deduction, ExplicationA),
	        simplifie_explication(ExplicationA, Explication1),
	        assert_connu(But, N, Explication1, Explication)
        ;
            gtrace,
			writeln('!!! pas de plus petite deduction !!!'),
            writeln(N),
            writeln(But)
    ).

% ----------
explique_deductions([], []) :-
    !.

explique_deductions([Deduction|Deductions], [Explication|Explications]) :-
    explique_deduction(Deduction, Explication),
    explique_deductions(Deductions, Explications).
 
% ----------
    % explique le chemin pour arrive au But de la deduction 
    % la deduction e(...) a deja ete rencontree, ou il s'agit d'un fait initial
explique_deduction(
				   e(N, Type, Antecedents, [But]), 
                   expl(e(N, Type1, Antecedents, [But]), [])
				   ) :-
    expli:connu(But, _N1, Type2, _Explication),
    writeln(Type2),
    check_type(Type, Type1),
    !.

explique_deduction(e(N, Type, Antecedents, Consequents), 
				   expl(e(N, Type, Antecedents, Consequents), Explications)) :-
    explique_antecedents(Antecedents, N , Explications).

% ----------
    % Consequent doit etre explique, ce qui revient a expliquer
    % chaque antecedent
explique_antecedents([], _N, []) :-
    !.
  
explique_antecedents([Antecedent|Antecedents], N, 
                     Explications_out) :-
    explique_but2(Antecedent, N, Explication),
	explique_antecedents(Antecedents, N, Explications),
	(
		Explication == []
		->
			Explications_out  = Explications
		;	
            Explications_out  = [Explication|Explications]	
	).
		
% ----------
select_explication_minimale([], []) :-
    !.

select_explication_minimale([Explication|Explications], Explication_out) :-
    taille_explication(Explication, Min),
    get_taille_explication_minimale([Explication|Explications], Min, 
                                     Explications1, Min_out),
    select_explications_taille_min(Explications1, Min_out, 
									 [Explication_out|_Explications_min]).

% ----------
get_taille_explication_minimale([], Min, [], Min) :-
    !.

get_taille_explication_minimale([Explication|Explications], Min, 
                                [t(Explication, N)|Explications1],
                                Min_out) :-
    taille_explication(Explication, N),
    (
        N < Min 
        -> Min1 is N
        ;  Min1 is Min
    ),
    get_taille_explication_minimale(Explications, Min1, Explications1, Min_out).

% ----------
select_explications_taille_min([], _Min, []) :-
    !.

    % explication minimale
select_explications_taille_min([t(Explication, Min)|Explications], Min,
                                [Explication|Explications1]) :-
    !,
    select_explications_taille_min(Explications, Min, Explications1).

    % explication non minimale
select_explications_taille_min([t(Explication, _Taille)|Explications], Min,
                                [Explication|Explications1]) :-
    Explication = expl(e(N1, Type, Ante, [But]), Explis),
	(
		expli:connu(But, _N, Type, expl(e(N1, Type, Ante, [But]), Explis))
		->
			expli:
    		retract(connu(But, _Na, Type, expl(e(N1, Type, Ante, [But]), Explis)))
		;
			true
	),
    select_explications_taille_min(Explications, Min, Explications1).

% ----------
taille_explication(expl(_Deduction, Explis_antecedentes), N) :-
    tailles_explications(Explis_antecedentes, Tailles),
    sum_list(Tailles, N1),
    N is N1 + 1.

% ----------
tailles_explications([], []) :-
    !.

tailles_explications([Explication|Explications], [Taille|Tailles]) :-
    taille_explication(Explication, Taille),
    tailles_explications(Explications, Tailles).

% ----------
simplifie_explications([], []) :-
    !.

simplifie_explications([Explication|Explications], 
                       [Explication1|Explications1]) :-
    simplifie_explication(Explication, Explication1),
    simplifie_explications(Explications, Explications1).
    
simplifie_explication(Explication, Explication).

/* ========================= ORDONNE EXPLICATIONS =========================== */

% ----------
ordonne_antecedents_explication(expl(Deduction, Antecedents), 
								expl(Deduction, Antecedents1)) :-
	ordonne_antecedents(Antecedents, Antecedents1).

% ----------
ordonne_antecedents_explications([], []) :-
	!.

ordonne_antecedents_explications([Explication|Explications],
								 [Explication1|Explications1]) :-
	ordonne_antecedents_explication(Explication, Explication1),
	ordonne_antecedents_explications(Explications, Explications1).
	
% ----------
ordonne_antecedents(Antecedents, Antecedents_out) :-
	ordonne_antecedents_explications(Antecedents, Antecedents1),
	ordonne_antecedents2(Antecedents1, Antecedents_out).
	 
% ----------
	% ordonne les explications appartements a la même liste d'antecedents
ordonne_antecedents2([], []) :-
	!.

ordonne_antecedents2([Explication|Explications], Explications_out) :-
	ordonne_antecedents2(Explications, Explications1),
	get_vars_explication(Explication, Vars),
	(
	  place_explication(Explications1, Explication, Vars, Explications_out)
	  -> true
	  ;	Explications_out = [Explication|Explications]
	).
	
% ----------
	% place Explication a cote de la premiere explications de Explications
	% avec laquelle elle partage une variable
place_explication([], _Explication, _Vars, []) :-
	!,
	fail.

place_explication([Explication1|Explications], Explication, Vars,
					            [Explication1|Explications_out]) :-
	get_vars_explication(Explication1, Vars1),
	intersection(Vars, Vars1, []),			% pas de variable commune
	!,
	place_explication(Explications, Explication, Vars, Explications_out).

place_explication([Explication1|Explications], Explication, _Vars,
				  [Explication, Explication1|Explications]).

% ----------
get_vars_explication(
					 expl(
						  e(_N, _Type, Ante, Conse), 
						  _Liste_expli
                         ), 
				     Vars
					) :-
	check_arguments:variables_impliquees(Ante, Vars1),
	check_arguments:variables_impliquees(Conse, Vars2),
	append(Vars1, Vars2, Vars3),
	sort(Vars3, Vars).

/* ========================== PLUS PETITE DEDUCTION ======================== */

% ----------
    % on cherche la deduction avec le plus petit nombre d'antecedents
    % ayant But dans ses consequents
    % en cas d'egalite de taille d'Antecedents, on prend la deduction
    % ayant le plus petit nombre de consequents
plus_petite_deduction(But, N, Deduction) :-
    Deduction1 =..[e, _N1, _Type, _Ante, _Conse],
    findall(Deduction1, 
            (
              expli:Deduction1,
              deduction:get_numero_deduction(Deduction1, N2),
              N2 < N, 
              deduction:get_consequents_deduction(Deduction1, Consequents),
              member(But, Consequents)), 
            Deductions),
	plus_petit_numero(Deductions, Deduction).
	% plus_petits_antecedents(Deductions, [Deduction|Deductions2]),
    % plus_grand_numero(Deductions, Deduction).
    %plus_petits_consequents(Deductions1, [Deduction|_Deductions2]).

% ----------
    % retourne toutes les deductions ayant But dans ses consequents
plus_petites_deductions(But, N, Deductions) :-
    Deduction1 =..[e, _N1, _Type, _Ante, _Conse],
    findall(
             Deduction1, 
             (
               expli:Deduction1,
               deduction:get_numero_deduction(Deduction1, N2),
               N2 < N, 
               deduction:get_consequents_deduction(Deduction1, Consequents),
               member(But, Consequents)), 
             Deductions
            ).

% ----------
    % selectionne la Deduction ayant le plus petit numero
	% celle qui necessite le moins de justifications (sans demontration)
plus_petit_numero([Deduction|Deductions], Deduction_out) :-
    deduction:get_numero_deduction(Deduction, N),
    plus_petit_numero2(Deductions, Deduction, N, Deduction_out).

% ----------
plus_petit_numero2([], Deduction, _N, Deduction) :-
    !.

plus_petit_numero2([Deduction|Deductions], _Deduction_choisie, N, 
                    Deduction_out) :-
    deduction:get_numero_deduction(Deduction, N1),
    N1 < N,
    !,
    plus_petit_numero2(Deductions, Deduction, N1, Deduction_out).

plus_petit_numero2([_Deduction|Deductions], Deduction_choisie, N, 
                    Deduction_out) :-
    plus_petit_numero2(Deductions, Deduction_choisie, N, Deduction_out).

% ----------
    % selectionne la Deduction ayant le plus grand numero
    % donc la plus proche parmi les deductions possibles
    % (donc celle qui beneficie du plus grand nombre d'informations)
plus_grand_numero([Deduction|Deductions], Deduction_out) :-
    deduction:get_numero_deduction(Deduction, N),
    plus_grand_numero2(Deductions, Deduction, N, Deduction_out).

% ----------
plus_grand_numero2([], Deduction, _N, Deduction) :-
    !.

plus_grand_numero2([Deduction|Deductions], _Deduction_choisie, N, 
                    Deduction_out) :-
    deduction:get_numero_deduction(Deduction, N1),
    N1 > N,
    !,
    plus_grand_numero2(Deductions, Deduction, N1, Deduction_out).

plus_grand_numero2([_Deduction|Deductions], Deduction_choisie, N, 
                    Deduction_out) :-
    plus_grand_numero2(Deductions, Deduction_choisie, N, Deduction_out).
    
% ----------
    % selectionne les deductions ayant le plus petit nombre d'antecedents

plus_petits_antecedents([e(N, Type, Ante, Conse)|Deductions], 
                        Deductions_out) :-
    length(Ante, L),
    taille_min_antecedents(Deductions, L, Min),
    select_min_antecedents([e(N, Type, Ante, Conse)|Deductions], 
                           Min, Deductions_out).

% ----------
taille_min_antecedents([], Min, Min) :-
    !.

taille_min_antecedents([Deduction|Deductions], Min, Min_out) :-
    deduction:get_antecedents_deduction(Deduction, Ante),
    length(Ante, L),
    L < Min,
    !,
    taille_min_antecedents(Deductions, L, Min_out).

taille_min_antecedents([_Deduction|Deductions], Min, Min_out) :-
    taille_min_antecedents(Deductions, Min, Min_out).
% ----------
select_min_antecedents([], _Min, []) :-
    !.

select_min_antecedents([Deduction|Deductions], Min, 
                       [Deduction|Deductions1]) :-
    deduction:get_antecedents_deduction(Deduction, Ante),
    length(Ante, Min),
    !,
    select_min_antecedents(Deductions, Min, Deductions1).

select_min_antecedents([_Deduction|Deductions], Min, Deductions1) :-
    select_min_antecedents(Deductions, Min, Deductions1).

% ----------
   % selectionne les deductions ayant le plus petit nombre de consequents

plus_petits_consequents([e(N, Type, Ante, Conse)|Deductions], Deductions_out) :-
    length(Conse, L),
    taille_min_consequents(Deductions, L, Min),
    select_min_consequents([e(N, Type, Ante, Conse)|Deductions], 
                           Min, Deductions_out).
% ----------
taille_min_consequents([], Min, Min) :-
    !.

taille_min_consequents([Deduction|Deductions], Min, Min_out) :-
    deduction:get_consequents_deduction(Deduction, Conse),
    length(Conse, L),
    L < Min,
    tailles_consequents(Deductions, L, Min_out).

% ----------
tailles_consequents([], Min, Min) :-
    !.

tailles_consequents([Deduction|Deductions], Min, Min_out) :-
    deduction:get_consequents_deduction(Deduction, Conse),
    length(Conse, L),
    L < Min,
    tailles_consequents(Deductions, L, Min_out).
    
% ----------
select_min_consequents([], _Min, []) :-
    !.

select_min_consequents([Deduction|Deductions], Min, 
                       [Deduction|Deductions1]) :-
    deduction:get_consequents_deduction(Deduction, Conse),
    length(Conse, Min),
    !,
    select_min_consequents(Deductions, Min, Deductions1).

select_min_consequents([_Deduction|Deductions], Min, Deductions1) :-
    select_min_antecedents(Deductions, Min, Deductions1).

/* =========================== TRI DES DOMAINES ============================= */

% ----------
ordonne_domaines([]) :-
	\+ expli:domaine_final(_V, _Domaine),
	!.

ordonne_domaines(Domaines_out):-
    findall(domaine_final(V, Domaine), expli:domaine_final(V, Domaine), Domaines1),
    domaines_par_numero(Domaines1, 0, Domaines_out).

% ----------
domaines_par_numero([], _N, []) :-
    !.

domaines_par_numero(Domaines, N, Domaines_out) :-
    select_domaines(Domaines, N, Domaines_couleur_valeur, Domaines1),
    N1 is N+1,
    domaines_par_numero(Domaines1, N1, Domaines2),
    append(Domaines_couleur_valeur, Domaines2, Domaines_out).

% ----------
select_domaines(Domaines, N, Domaines_couleur_valeur, Domaines_out) :-
    select_domaine(Domaines, c, N, Domaine_couleur, Domaines1),
    select_domaine(Domaines1, v, N, Domaine_valeur, Domaines_out),
    append(Domaine_couleur, Domaine_valeur, Domaines_couleur_valeur).

% ----------
select_domaine(Domaines, Type, N, [domaine_final(Var,Domaine)], Domaines1) :-
    atom_concat(Type, N, Var),
    select(domaine_final(Var, Domaine), Domaines, Domaines1),
    !.

select_domaine(Domaines, _Type, _N, [], Domaines).

% ----------
get_domaines_couleurs([], []) :-
    !.

get_domaines_couleurs([Domaine|Domaines], [Domaine|Domaines1]) :-
    domaine_couleur(Domaine),
    !,
    get_domaines_couleurs(Domaines, Domaines1).

get_domaines_couleurs([_Domaine|Domaines], Domaines1) :-
    get_domaines_couleurs(Domaines, Domaines1).

% ----------
domaine_couleur(domaine_final(Var, _Domaine)) :-
    atom_concat(c, _Num, Var).
    
% ----------
get_domaines_valeurs([], []) :-
    !.

get_domaines_valeurs([Domaine|Domaines], [Domaine|Domaines1]) :-
    domaine_valeur(Domaine),
    !,
    get_domaines_valeurs(Domaines, Domaines1).

get_domaines_valeurs([_Domaine|Domaines], Domaines1) :-
    get_domaines_valeurs(Domaines, Domaines1).

% ----------
domaine_valeur(domaine_final(Var, _Domaine)) :-
    atom_concat(v, _Num, Var).

% ----------
ordonne_domaines_par_numero(Domaines, Domaines_out) :-
    sort(1, @<, Domaines, Domaines_out).

% ----------
reunit_domaines([], [], []) :-
    !. 

/* ======================== CREATION BASE DE DONNEES ======================== */

% ----------
assert_donnees([], _Domaines_initiaux, _Domaines_finaux, []) :-
	!. 

assert_donnees(Deductions, Domaines_initiaux, Domaines_finaux, 
               Contraintes_initiales) :-
    reverse(Deductions, [Deduction|Deductions1]),
    deduction:get_numero_deduction(Deduction, N),
    expli:assert(dernier_numero_deduction(N)),
    assert_reponses([Deduction|Deductions1]),
    retire_rep([Deduction|Deductions1], Deductions2),
    assert_deductions(Deductions2),
    assert_domaines(Domaines_initiaux, initial),
    assert_domaines(Domaines_finaux, final),
    assert_contraintes_initiales(Contraintes_initiales),
    assert_ordre_couleurs.
 
/* ========================= STOCKAGE DES CONTRAINTES ======================= */

% ----------
assert_ordre_couleurs :-
    running_game:ordre_couleurs(Ordre_couleurs),
    assert_contraintes_initiales(Ordre_couleurs).
    
% ----------
assert_contraintes_initiales([]) :-
    !.

assert_contraintes_initiales([Contrainte|Contraintes]) :-
    deduction:ordonner_somme(Contrainte, Contrainte1),
    assert_contrainte(Contrainte1),
    assert_contraintes_initiales(Contraintes).

assert_contrainte(Comparaison) :-
    comparaisons:est_comparaison(Comparaison),
    !,
    comparaisons:ordonne_comparaison_lexico(Comparaison, Comparaison1),
    assert_deduction(e(-1, contrainte_initiale, [], [Comparaison1])),
    assert(connu(Comparaison1, -1, contrainte_initiale, [])).

assert_contrainte(Contrainte) :-
    Deduction = e(-1, contrainte_initiale, [], [Contrainte]), 
    deduction:check_comparaisons_deduction(Deduction, Deduction1),
    assert_deduction(Deduction1),
    deduction:get_consequents_deduction(Deduction1, [Consequent]),
    assert(connu(Consequent, -1, contrainte_initiale, [])).

/* =========================== STOCKAGE DES REPONSES ======================== */

% ----------
assert_reponses([]) :-
    !.

assert_reponses([e(rep(_N), _Type, Ante, _Conse)|Deductions]) :-

    identifie_domaine_reponse(Ante, Domaine, Reponse),
    expli:assert(e(-1, reponse, [], [Reponse])), 
    expli:assert(connu(Reponse, -1, reponse, [])),
		
	expli:assert(e(-1, domaine_initial, [], [Domaine])), 
    expli:assert(connu(Domaine, -1, domaine_initial, [])),
    !,
    assert_reponses(Deductions).

assert_reponses([_Deduction|Deductions]) :-
    assert_reponses(Deductions).

% ----------
identifie_domaine_reponse([dans(Var, D),Reponse], dans(Var,D), Reponse) :-
    !. 

identifie_domaine_reponse([Reponse, Domaine], Domaine, Reponse) :-
    !. 

/* ========================== STOCKAGE DES DOMAINES ========================= */ 

% ----------
assert_domaines([], _Type) :-
    !.

assert_domaines([Domaine|Domaines], Type) :-
    assert_domaine(Domaine, Type),
    assert_domaines(Domaines, Type).

% ----------
assert_domaine(c(N, Couleurs, Valeurs),Type) :-
    atom_concat(c, N, Cn),
    atom_concat(v, N, Vn),
    atom_concat(domaine, '_', Domaine1),
    atom_concat(Domaine1, Type, Domaine2),
    sort(Couleurs, Couleurs1),
    sort(Valeurs, Valeurs1),
    Domaine_couleurs =..[Domaine2, Cn, Couleurs1],
    Domaine_valeurs =..[Domaine2, Vn, Valeurs1],
    expli:asserta(Domaine_couleurs), 
    expli:asserta(Domaine_valeurs),
	(
		Type == initial
		-> 
		   assert_connu_domaine_initial(Domaine_couleurs), 
		   assert_connu_domaine_initial(Domaine_valeurs),
		   assert_deduction_domaine_initial(Domaine_couleurs), 
		   assert_deduction_domaine_initial(Domaine_valeurs)
		;  true
	).

/* =================== STOCKAGE DES EXPLICATIONS CONNUES ==================== */   

% ----------
assert_connu_domaine_initial(domaine_initial(Var, Domaine)) :-
	    expli:connu(Var dans Domaine, -1, domaine_initial, []),
		!.

assert_connu_domaine_initial(domaine_initial(Var, Domaine)) :-
	expli:assert(connu(Var dans Domaine, -1, domaine_initial, [])).

% ----------
assert_deduction_domaine_initial(domaine_initial(Var, Domaine)) :-
	    expli:e(-1, domaine_initial, [], [Var dans Domaine]),
		!.

assert_deduction_domaine_initial(domaine_initial(Var, Domaine)) :-
	    expli:assert(e(-1, domaine_initial, [], [Var dans Domaine])).

% ----------
construit_assert_connus([]) :- 
    !.

construit_assert_connus([e(N, Type, Antecedents, [Consequent])|Deductions]) :-
    Explication = expl(e(N, Type, Antecedents, [Consequent]), [Consequent]),
    assert_connu(Consequent, N, Explication),
    construit_assert_connus(Deductions).

% ----------
    % But deja vu comme une reponse du systeme
assert_connu(But, _N, Explication, Explication) :-
	expli:connu(But, _N1, reponse, _Explication1).

    % But deja vu comme un domaine initial
assert_connu(But, _N, Explication, Explication) :-
	expli:connu(But, _N1, domaine_initial, _Explication1).

    % Reduction du domaine de Var deja vu
    % mais on modifie car la reduction actuelle est plus forte
assert_connu(
				dans(Var, Domaine), 
				_N, 
				expl(e(N2, Type, Antecedents, [Var dans Domaine]), []),
				expl(e(N2, Type, Antecedents, [Var dans Domaine]), [])
			) :-
	expli:connu(dans(Var, Domaine1), N1, Type1, Explication1),
	liste:strictement_inclus(Domaine, Domaine1),
	!,
	expli:retract(connu(Var dans Domaine1, N1, Type1, Explication1)),
	expli:assert(connu(
                       dans(Var, Domaine), N1, connu,
				       expl(e(N1, Type, Antecedents, [dans(Var,Domaine)]), [])
                      )
				).

	% But est un atom, jamais vu
assert_connu(
			 But, 
			 N, 
             expl(e(N1, Type, Antecedents, Goals), Explications),
			 expl(e(N1, Type, Antecedents, Goals), Explications)
			) :-
	\+ is_list(But),
	nl,
	writeln('pas une liste'),
	writeln(But),
	writeln(N),
	member(But, Goals),
	!,
	expli:assert(connu(But, N, Type, 
		               expl(e(N1, Type, Antecedents, [But]), Explications))).

	% But est une liste de buts, jamais vue
/*
assert_connu(
			 But, 
			 N, 
             expl(e(N1, Type, Antecedents, But), Explications),
			 expl(e(N1, Type, Antecedents, But), Explications)
			) :-
	is_list(But),
	nl,
	writeln('liste'),
	writeln(But),
	writeln(N),
	expli:assert(connu(But, N, Type, 
		               expl(e(N1, Type, Antecedents, But), Explications))).
*/



/*
assert_connu(
				Var dans Domaine, _N, 
				expl(e(N2, Type, Antecedents, [Var dans Domaine]), []),
				expl(e(N2, Type, Antecedents, [Var dans Domaine]), [])
			) :-
	expli:connu(Var dans Domaine1, N1, Type1, Explication1),
	liste:strictement_inclus(Domaine, Domaine1),
	!,
	expli:retract(connu(Var dans Domaine1, N1, Type1, Explication1)),
	expli:assert(connu(
                       Var dans Domaine, N2, connu,
				       expl(e(N2, Type, Antecedents, [Var dans Domaine]), [])
                      )
                 ).
*/

/* ========================= STOCKAGE  DES DEDUCTIONS ======================= */ 

% ----------
assert_deductions([]) :-
    !.

assert_deductions([Deduction|Deductions]) :-
    assert_deduction(Deduction),
    !,
    assert_deductions(Deductions).

% ----------
    % deduction déja memorisé on ne fait rien
assert_deduction(e(N, Type, Antecedents, Consequents)) :-
    expli:e(N1, Type, Antecedents, Consequents),
    (
        N1 =< N              
        ->  true
        ; 
            expli:retract(e(N1, Type, Antecedents, Consequents)),
            expli:asserta(e(N, Type, Antecedents, Consequents))
    ),
    !.

assert_deduction(Deduction) :-
    expli:assert(Deduction).

% ----------
    % evite appel recursif (cf somme_trop_petite, etc...)  
    % deduction déja memorisé on ne fait rien
assert_deduction2(e(N, Type, Antecedents, Consequents)) :-
    e(N1, Type, Antecedents, Consequents),
    (
        N1 =< N              
        ->  true
        ; 
            expli:retract(e(N1, Type, Antecedents, Consequents)),
            expli:asserta(e(N, Type, Antecedents, Consequents))
    ),
    !.

assert_deduction2(Deduction) :-
    expli:asserta(Deduction).

% ----------
affiche_donnees(Deductions, Domaines_initiaux, Domaines_finaux) :-
    sort(Domaines_initiaux, Domaines_initiaux1),
    sort(Domaines_finaux, Domaines_finaux1),
    liste:display_liste(Domaines_initiaux1),
    liste:display_liste(Domaines_finaux1),
    gere_deductions:tri_croissant_deductions(Deductions, Deductions1),
    affichage_deductions:display_deductions(Deductions1, 2).

/* ================================= DIVERS ================================= */

% ----------

check_type(Type, Type) :-
    member(Type, [reponse, domaine_initial, contrainte_intiale]),
    !.

check_type(Type, Type_connu) :-
    atom_concat('connu_', Type, Type_connu).

% ----------
determine_domaines(Contraintes_initiales, Domaines_initiaux, Domaines_finaux,
				   Domaines_initiaux1, Domaines_finaux1) :-
	check_arguments:variables_impliquees_liste(Contraintes_initiales, Vars),
	selectionne_domaines(Domaines_initiaux, Vars, Domaines_initiaux1),
	selectionne_domaines(Domaines_finaux, Vars, Domaines_finaux1).

% ----------
	% selectionne les domaines qui concerne une variable de Vars
selectionne_domaines([], _Vars, []) :-
	!.

selectionne_domaines([c(N, Couleurs, Valeurs)|Domaines], Vars, 
					 [c(N, Couleurs, Valeurs)|Domaines1]) :-
	atom_concat(c, N, Cn),
	atom_concat(v, N, Vn),
	(member(Cn, Vars) ; member(Vn, Vars)),
	!,
	selectionne_domaines(Domaines, Vars, Domaines1).

selectionne_domaines([_Domaine |Domaines], Vars, Domaines1) :-
	selectionne_domaines(Domaines, Vars, Domaines1).
	
% ----------
affiche_connus :-
	findall(connu(But, N, Type, R), (expli:connu(But, N, Type, R)), Connus),
	liste:display_liste(Connus).
        
% ----------
affiche_deductions_initiales :-
    findall(e(-1, Type, Ante, Conse), expli:e(-1, Type, Ante, Conse), Deductions),
    liste:display_liste('deductions initiales :', Deductions).

% ----------
affiche_deductions :-
    findall(e(N, Type, Ante, Conse),expli: e(N, Type, Ante, Conse), Deductions),
    liste:display_liste(Deductions).

% ----------
retire_rep([], []) :-
    !.

retire_rep([e(rep(N), Type, Ante, Conse)|Deductions],
           [e(N, Type, Ante, Conse)|Deductions1]) :-
    !,
    retire_rep(Deductions, Deductions1).

retire_rep([Deduction|Deductions], [Deduction|Deductions1]) :-
    retire_rep(Deductions, Deductions1).

% ----------
efface_donnees :-
	expli:abolish(domaine_initial/2),
	expli:abolish(domaine_final/2),
	expli:abolish(e/4),
	expli:abolish(connu/4),
	expli:abolish(dernier_numero_deduction/1).

/* =============================== FIN LISTING ============================= */
