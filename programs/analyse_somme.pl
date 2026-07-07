/* ========================================================================== */
/*                  			   ANALYSE LA SOMME             			  */
/* ========================================================================== */

:- module(
         analyse_somme, 
         [
            analyse_somme/5
         ]
		 ).

:- 
	use_module(library(clpfd)),
	use_module(check_arguments),
    use_module(ajout_suppression_contraintes).
		 
% ----------
analyse_somme(no_somme, Domaines, Domaines, [], []) :-
	!.

analyse_somme(Somme, Domaines, Domaines_out, Reductions, Explications) :-
	check_somme(Somme, Domaines, Domaines_out, Reductions, Explications).

% ----------
check_somme(Somme = Valeur, Domaines, Domaines_out, Reductions, Explications) :-

	check_arguments:variables_impliquees(Somme, Vars_valeur),
    recupere_variables_couleur(Vars_valeur, Vars_couleur),

	recupere_domaines(Vars_valeur, Domaines, Domaines_restant, 
                      Dom_vars_valeur),
    recupere_domaines(Vars_couleur, Domaines_restant, Domaines_restant1,
                      Dom_vars_couleur),

    check_valeurs_max(Dom_vars_valeur, Valeur, Dom_vars_valeur1,
                      Reductions1, Explications1),

	check_valeurs_min(Dom_vars_valeur1, Valeur, Dom_vars_valeur2,
                      Reductions2, Explications2),

	append(Domaines_restant1, Dom_vars_valeur2, Domaines1),
    append(Domaines1, Dom_vars_couleur, Domaines_out),
    append(Reductions1, Reductions2, Reductions),
    append(Explications1, Explications2, Explications).

/* ================================= VALEUR MAX ============================= */

% ----------
	% verifie si on peut diminuer les valeurs max de certains domaines
	% en fonction de la valeur de la somme

check_valeurs_max(Domaines, Valeur, Domaines_out, Reductions, Explications) :-
	length(Domaines, N),
    recupere_variables(Domaines, Vars),
	check_valeurs_max2(Domaines, Vars, N, Valeur, Domaines_out,
                       Reductions, Explications).
% ----------	
	% la somme du Max de Domaine et des Mins des autres variables est 
	% superieure a Valeur, Max est donc une valeur impossible.
check_valeurs_max2(Domaines, _Vars, 0, _Valeur, Domaines, [], []) :-
	!.

check_valeurs_max2([Domaine|Domaines], [Var|Vars], N, Valeur, 
                   Domaines_out, Reductions_out, Explications_out) :-
    get_mins(Domaines, Mins),
    get_valeurs_mins(Mins, VMins),
	sum_list(VMins, Somme_mins),
	check_valeur_max(Somme_mins, Domaine, Domaines, Vars, 
                     Valeur, Domaine1, Reduction, Explication),
	N1 is N-1,
	append(Domaines, [Domaine1], Domaines1),
    append(Vars, [Var], Vars1),
	check_valeurs_max2(Domaines1, Vars1, N1, Valeur, Domaines_out,
                       Reductions, Explications),
    append(Reduction, Reductions, Reductions_out),
    append(Explication, Explications, Explications_out).

% ----------
	% si Max + Somme_mins > Valeur, Max trop grand, on le retire de Domaine
check_valeur_max(Somme_mins, Var in Domaine, Domaines, Vars, Valeur, 
                 Var in Domaine_reduit, [Reduction], Explication) :-
    max_member(Max_domaine, Domaine),
    check_max_value(Domaine, Somme_mins, Valeur, Domaine_reduit, Max),
    Max < Max_domaine,
	!, 
    Reduction = reduction(Var, valeur, Domaine, Domaine_reduit),
    constitue_somme([Var|Vars], Somme),
    ajout_suppression_contraintes:
    ajout_reduction_max_trop_grand(Somme, Somme_mins, Domaines, 
                                   Max, Valeur, Reduction, Explication).

check_valeur_max(_Somme_mins, Domaine, _Domaines,
                _Vars, _Valeur, Domaine, [], []).

% ----------
    % recherche la plus grand valeur de Domaine telle que
    % Somme_mins + Max = Valeur 

check_max_value(Domaine, Somme_mins, Valeur, Domaine_out, Max) :-
    sort(Domaine, Sorted_domaine),
    reverse(Sorted_domaine, Rsorted_domaine),
    check_max_value2(Rsorted_domaine, Somme_mins, Valeur, Rdomaine_out, Max),
	reverse(Rdomaine_out, Domaine_out).

% ----------
    % Max impossible (toutes les valeurs de Domaine sont trop petites
check_max_value2([Val|_Domaine], Somme_mins, Valeur, _Domaine_out, _No_max) :-
    Val_somme is Somme_mins + Val,
    Val_somme < Valeur,
    !,
    fail.

    % Max est trop grand
check_max_value2([Val|Domaine], Somme_mins, Valeur, Domaine_out, Max) :-
    Val_somme is Somme_mins + Val,
    Val_somme > Valeur,
    !,
    check_max_value2(Domaine, Somme_mins, Valeur, Domaine_out, Max).
    
    % Max trouve
check_max_value2([Max|Domaine], Somme_mins, Valeur, [Max|Domaine], Max) :-
    Val_somme is Somme_mins + Max,
    Val_somme == Valeur.

% ----------
check_valeurs_min(Domaines, Valeur, 
                  Domaines_out, Reductions, Explications) :-
	length(Domaines, N),
    recupere_variables(Domaines, Vars),
	check_valeurs_min2(Domaines, Vars, N, Valeur, 
                       Domaines_out, Reductions, Explications).

% ----------	
	% la somme du Min de Domaine et des Maxs des autres variables est 
	% inferieure a Valeur, Min est supprimee
check_valeurs_min2(Domaines, _Vars, 0, _Valeur, Domaines, [], []) :-
	!.

check_valeurs_min2([Domaine|Domaines], [Var|Vars], N, 
				   Valeur, Domaines_out, Reductions_out, Explications_out) :-
    get_maxs(Domaines, Maxs),
    get_valeurs_maxs(Maxs, VMaxs),
	sum_list(VMaxs, Somme_maxs),
    check_valeur_min(Somme_maxs, Domaine, Domaines, Vars, Valeur, 
                     Domaine1, Reduction, Explication),
	N1 is N-1,
	append(Domaines, [Domaine1], Domaines1),
    append(Vars, [Var], Vars1),
	check_valeurs_min2(Domaines1, Vars1, N1, Valeur, Domaines_out,
                       Reductions, Explications),
    append(Reduction, Reductions, Reductions_out),
    append(Explication, Explications, Explications_out).

/* ============================= VALEUR MIN ================================= */

% ----------
check_valeur_min(Somme_maxs, Var in Domaine, Domaines, Vars, Valeur, 
                 Var in Domaine_reduit, [Reduction], Explication) :-
    min_member(Min_domaine, Domaine),
	check_min_value(Domaine, Somme_maxs, Valeur, Domaine_reduit, Min),
    Min > Min_domaine,
	!,
	constitue_somme([Var|Vars], Somme),
    Reduction = reduction(Var, valeur, Domaine, Domaine_reduit),
    ajout_suppression_contraintes:
    ajout_reduction_min_trop_petit(Somme, Somme_maxs, Domaines, Min, 
                                   Valeur, Reduction, Explication).

check_valeur_min(_Somme_max, Domaine, _Domaines, _Vars, _Valeur, 
                 Domaine, [], []).

% ----------
    % recherche la plus petite valeur de Domaine telle que
    % Somme_mmaxs + Min = Valeur 

check_min_value(Domaine, Somme_maxs, Valeur, Domaine_out, Min) :-
    sort(Domaine, Sorted_domaine),
    check_min_value2(Sorted_domaine, Somme_maxs, Valeur, Domaine_out, Min).

% ----------
    % Min impossible (toutes les valeurs de Domaine sont trop grandes
check_min_value2([Val|_Domaine], Somme_maxs, Valeur, _Domaine_out, _No_max) :-
    Val_somme is Somme_maxs + Val,
    Val_somme > Valeur,
    !,
    fail.

    % Min est trop petit
check_min_value2([Val|Domaine], Somme_maxs, Valeur, Domaine_out, Min) :-
    Val_somme is Somme_maxs + Val,
    Val_somme < Valeur,
    !,
    check_min_value2(Domaine, Somme_maxs, Valeur, Domaine_out, Min).
    
    % Min trouve
check_min_value2([Min|Domaine], Somme_maxs, Valeur, [Min|Domaine], Min) :-
    Val_somme is Somme_maxs + Min,
    Val_somme == Valeur.

/* ================================= DIVERS ================================= */

% ----------
constitue_somme([Var], Var) :-
    !.

constitue_somme([Var|Vars], Var + Somme) :-
    constitue_somme(Vars, Somme).

% ----------
recupere_variables([], []) :-
    !.

recupere_variables([Var in _Domaine|Domaines], [Var|Vars]) :-
    recupere_variables(Domaines, Vars).

% ----------
	% retourne les valeurs maximales de chaque Domaine 
get_maxs(Domaines,  Maxs) :-
	get_valeurs_maximales(Domaines, Maxs).

% ----------
get_valeurs_maximales([], []) :-
	!.

get_valeurs_maximales([Var in Domaine|Domaines], [max(Var,Max)|Maxs]) :-
	max_list(Domaine, Max),
	get_valeurs_maximales(Domaines, Maxs).

% ----------
get_valeurs_maxs([],[]) :-
    !.

get_valeurs_maxs([max(_Var, Valeur)|Maxs], [Valeur|Valeurs]) :-
    get_valeurs_maxs(Maxs, Valeurs).

% ----------
	% retourne les valeurs minimales de chaque Domaine 
get_mins(Domaines, Mins) :-
	get_valeurs_minimales(Domaines, Mins).

% ----------
get_valeurs_minimales([], []) :-
	!.

get_valeurs_minimales([Var in Domaine|Domaines], [min(Var,Min)|Mins]) :-
	min_member(Min, Domaine),
	get_valeurs_minimales(Domaines, Mins).

% ----------
get_valeurs_mins([],[]) :-
    !.

get_valeurs_mins([min(_Var, Valeur)|Mins], [Valeur|Valeurs]) :-
    get_valeurs_mins(Mins, Valeurs).

% ----------
get_constantes(Domaines, Constantes_restantes) :-
    recupere_constantes(Domaines, Constantes),
    sort(Constantes, Constantes_restantes).

% ----------
recupere_constantes([], []) :-
    !.

recupere_constantes([_Var in Constantes|Domaines], Constantes_out) :-
    recupere_constantes(Domaines, Constantes1),
    append(Constantes, Constantes1, Constantes_out).

% ----------
recupere_variables_couleur([], []) :-
    !.

recupere_variables_couleur([Var_valeur|Vars_valeur], 
                           [Var_couleur|Vars_couleur]) :-
    atom_concat(v, N, Var_valeur),
    atom_concat(c, N, Var_couleur),
    recupere_variables_couleur(Vars_valeur, Vars_couleur).

% ----------
    % distribue les couleurs par groupes de couleur de meme range
groupes_couleurs_meme_rang(Vars_couleurs, Groupes_couleurs) :-
	running_game:ordre_couleurs(Ordre_couleurs),
	% findall(meme_rang(X,X), select(meme_rang(X,Y), Ordre_couleurs, _), 
	%		Meme_rangs),
	%subtract(Ordre_couleurs, Meme_rangs, Ordre_couleurs1),
	groupes_couleurs(Vars_couleurs, Ordre_couleurs, Groupes_couleurs).

% ----------
groupes_couleurs([], _Ordre_couleurs, []) :-
    !.

groupes_couleurs([Couleur|Couleurs], Ordre_couleurs, [Groupe|Groupes]) :-
	groupe_couleur(Ordre_couleurs, Couleur, Groupe),
    subtract(Couleurs, Groupe, Couleurs1),
	groupes_couleurs(Couleurs1, Ordre_couleurs, Groupes).

% ----------
    % constitue le groupe des couleurs de meme rang que Couleur
groupe_couleur(Ordre_couleurs, Couleur, Groupe) :-
    findall(Couleur1,
            (member(meme_rang(Couleur, Couleur1), Ordre_couleurs) ; 
             member(meme_rang(Couleur1, Couleur), Ordre_couleurs)),
            Groupe1),
    sort(Groupe1, Groupe). 
	
% ----------
recupere_domaines([], Domaines_restant, Domaines_restant, []) :-
	!.

recupere_domaines([Var|Variables], Domaines, Domaines_restant, 
                  [Var in Domaine_var|Domaines_vars]) :-
	select(Var in Domaine_var, Domaines, Domaines1),
	recupere_domaines(Variables, Domaines1, Domaines_restant, Domaines_vars).
	 
/* ============================== FIN LISTING =============================== */
