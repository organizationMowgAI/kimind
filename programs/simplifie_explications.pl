/* ========================================================================== */
/*                        SIMPLIFIE LES EXPLICATIONS                   		  */	
/* ========================================================================== */

:- module(
          simplifie_explications, 
          [
			simplifie_reductions_domaines/2
          ]
		 ).

:- 
	use_module(affiche_explications2),
	use_module(operateurs),
	use_module(comparaisons),
	use_module(check_arguments),
    use_module(explication).

% ----------
simplifie_reductions_domaines([], []) :-
	!.

simplifie_reductions_domaines([Reduction|Reductions], 
                              [Reduction1|Reductions1]) :-
	simplifie_reduction_domaine(Reduction, Reduction1),
	
	% affiche_explications2:
	% display_raisonnement_inverse(Reduction1),

    % affiche_explications2:
    % affiche_explication_reduction(Reduction1),

	% affiche_explications:
	% affiche_explication_reduction(Reduction1),
	simplifie_reductions_domaines(Reductions, Reductions1).

% ----------
simplifie_reduction_domaine(
                            reduction(Var, Domaine, Explication), 
					        reduction(Var, Domaine, Explication_out)
                           ) :-
    simplifie_explication(Explication, Explication_out).

    % infos_initiales_expli(Explication1, Explication2),
	% retire_doublons_expli(Explication2, Explication3),
	% ordonner_explication(Explication3, Explication_out).

% ----------
simplifie_explications([], []) :-
	!.

simplifie_explications([Explication|Explications], 
                       [Explication1|Explications1]) :-
	simplifie_explication(Explication, Explication1),
	simplifie_explications(Explications, Explications1).

% ----------
simplifie_explication(
					  expl(
						   e(N, reduction, [Var = Val], [dans(Var, [Val])]),
						   [expl(e(_N1,reponse,[],[Var = Val]),[])]
		                   ),
					   expl(e(N, reduction_reponse, [], [dans(Var,[Val])]), [])
					  ) :-
	!.

simplifie_explication(
					  expl(
						   e(N, reduction, [Val = Var], [dans(Var, [Val])]),
						   [expl(e(_N1,reponse,[],[Val = Var]),[])]
		                   ),
					   expl(e(N, reduction_reponse, [], [dans(Var, [Val])]), [])
					  ) :-
	!.

simplifie_explication(expl(Deduction, Explications), Explication1) :-
	simplifie_explications(Explications, Explications1),
	simplifie_explication2(expl(Deduction, Explications1), Explication1).

% ----------
simplifie_explication2(expl(Deduction, []),  expl(Deduction, [])) :-
	!.

	% reduction de domaine du a une reponse du systeme
simplifie_explication2(
	expl(
		  e(N, reduction, [Comparaison, Var dans Domaine_initial], 
						  [Var dans [_Const]]), 
		   [ 
			 expl(e(-1, reponse, [], [Comparaison]), []),
			 expl(e(-1, domaine_initial, [], [Var dans Domaine_initial]),[]) 
           ]
         ),
		expl(e(N, reponse, [], [Comparaison1]), [])
				     ) :-
	comparaisons:est_comparaison(Comparaison),
	!,
	comparaisons:ordonne_comp_var_const(Comparaison, Comparaison1).
	 
simplifie_explication2(Explication,  Explication).

% ----------
	% retire de Explis les explications qui doublonnent avec Expli
retire_doublons_niveau1([], _Expli, []) :-
	!.

retire_doublons_niveau1([Expli0|Explis], Expli, Explis_out) :-
	explication:doublon(Expli0, Expli),
	retire_doublons_niveau1(Explis, Expli, Explis_out).

retire_doublons_niveau1([Expli0|Explis], Expli, [Expli0|Explis_out]) :-
	retire_doublons_niveau1(Explis, Expli, Explis_out).

% ----------
ordonner_explications([], []) :-
    !.

ordonner_explications([Expli|Explis], [Expli1|Explis1]) :-
    ordonner_explication(Expli, Expli1),
    ordonner_explications(Explis, Explis1).

% ----------
ordonner_explication(expl(Deduction, Explications),
                     expl(Deduction, Explications_out)) :-
   ordonner_explications(Explications, Explications2),
   ordonner(Explications2, Explications_out).

% ----------
ordonner([], []) :-
    !.

ordonner(Explis, Explis_out) :-
    recupere_explis(Explis, domaine_initial, Explis1, Reste1),
    recupere_explis(Reste1, reponse, Explis2, Reste2),
    recupere_explis(Reste2, connu, Explis3, Reste3),
	recupere_explis(Reste3, contrainte_initiale, Explis4, Reste4),
    append([Explis1, Explis2, Explis3, Explis4, Reste4], Explis_out).


% ----------
recupere_explis([], _Type, [], []) :-
    !.

recupere_explis([Expli|Explis], Type, [Expli|Explis1], Reste) :-
    get_type_explication(Expli, Type),
    !,
    recupere_explis(Explis, Type, Explis1, Reste).

recupere_explis([Expli|Explis], Type, Explis1, [Expli|Reste]) :-
    recupere_explis(Explis, Type, Explis1, Reste).

% ----------
    % ramene toutes les infos initiales :
	% reponse, domaine_initial, contrainte_initiale, connu
    % des explications meres vers l'explication courante

infos_initiales_explis([], []) :-
    !.

infos_initiales_explis([Expli|Explis], [Expli1|Explis1]) :-
    infos_initiales_expli(Expli, Expli1),
    infos_initiales_explis(Explis, Explis1).

% ----------
infos_initiales_expli(expl(Deduction, []), expl(Deduction, [])) :-
    !.

	% Explis contient les explications meres (antecedentS) 
	% de l'explication courante 
infos_initiales_expli(expl(Deduction, Explis), expl(Deduction, Explis_out)) :-
		% Explis = explications anteced    
    infos_initiales_explis(Explis, Explis1),			    % traite les antecedents
    recupere_explis_meres(Explis1, Explis2,				% recupere infos initiales 
						  Explis_recuperees),			%  des explis meres
	check_explis_recuperees(Explis_recuperees, Explis2, Explis_out).
 
% ----------
	% verifier si les explications recuperees ne sont pas definies au niveau de 
	% dans explis, auquel cas on ne le ajoute pas
check_explis_recuperees([], Explis, Explis) :-
	!.

	% Exp_recup est definie dans Explis
check_explis_recuperees([Exp_recup|Exps_recup], Explis, Explis_out) :-
	explication:get_but_explication(Exp_recup, But),
	expli_definie(Explis, But),
	!,
	check_explis_recuperees(Exps_recup, Explis, Explis_out).

check_explis_recuperees([Exp_recup|Exps_recup], Explis, 
						[Exp_recup|Explis_out]) :-
	check_explis_recuperees(Exps_recup, Explis, Explis_out).

% ----------
expli_definie([], _But) :-
	!,
	fail.

expli_definie([Expli|_Explis], But) :-
	explication:get_but_explication(Expli, But),
	!.

expli_definie([_Expli|Explis], But) :-
	expli_definie(Explis, But).


% ----------
recupere_explis_meres([], [], []) :-
    !.

recupere_explis_meres([Expli|Explis], Explis2, Explis_recuperees) :-
    recupere_explis_mere(Expli, Expli1, Explis_recuperees1),
    recupere_explis_meres(Explis, Explis1, Explis_recuperees2),
    append(Expli1, Explis1, Explis2),
    append(Explis_recuperees1, Explis_recuperees2, Explis_recuperees).

% ----------
    % retire et recupere toutes les explications reponse, initial, etc...
recupere_explis_mere(expl(Deduction, []), [expl(Deduction, [])], []) :-
    !.

recupere_explis_mere(expl(Deduction, Explications), 
					 Expli1, Explis_recuperees) :-
    retire_explications_initiales(Explications, Explis_recuperees, Reste),
	Expli1 = [expl(Deduction, Reste)].
/*
	(
		Reste == []
			-> Expli1 = []
		    ;  Expli1 = [expl(Deduction, Reste)]
	).
*/


% ----------
retire_explications_initiales([], [], []) :-
    !.

retire_explications_initiales([Expli|Explis], [Expli|Explis1], Reste) :-
    explication:get_type_explication(Expli, Type),
    member(Type, [reponse, contrainte_initiale, domaine_initial, connu]),
    !,
    retire_explications_initiales(Explis, Explis1, Reste).

retire_explications_initiales([Expli|Explis], Explis1, [Expli|Reste]) :-
    retire_explications_initiales(Explis, Explis1, Reste).

% ----------
retire_doublons_explis([], []) :-
	!.

retire_doublons_explis([Expli|Explis], [Expli1|Explis1]) :-
	retire_doublons_expli(Expli, Expli1),
	retire_doublons_explis(Explis, Explis1).

% ----------
	% retire les doublons dans les explications de Explication
retire_doublons_expli(expl(Deduction, []), expl(Deduction, [])) :-
	!.

retire_doublons_expli(
						expl(Deduction, Explications), 
					  	expl(Deduction, Explications_out)
					  ) :-
	retire_doublons_explis(Explications, Explications1),
	retire_doublons(Explications1, Explications_out).

% ----------
	% retire les doublons des explications de premier niveau
retire_doublons([], []) :-
	!.

retire_doublons([Expli|Explis], [Expli|Explis_out]) :-
	retire_doublons_niveau1(Explis, Expli, Explis1),
	retire_doublons(Explis1, Explis_out).
	

/* ============================== FIN LISTING =============================== */
