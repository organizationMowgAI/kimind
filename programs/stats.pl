/* ========================================================================== */
/*                          FONCTIONS STATISTIQUES                            */
/* ========================================================================== */

:- module(stats,
    [

		recupere_distributions/2,

        effectifs/2,
        nb_effectifs/2,
 
        effectif_cumule/3,
        effectifs_cumules/2,

        fonction_repartition/3,
        fonctions_repartitions/2,

        quantile/3,
        quantiles/3,

        partie/3,
        parties/3,

        mean/2,
        variance/2,
        standard_deviation/2,

        frequence/3,
        frequences/2
    ]
    ).

/* ======================== DISTRIBUTION DES EFFECTIFS ====================== */

% ----------
recupere_distributions([], []) :-
    !.

% ----------
recupere_distributions([e(_Somme, Nb)|Effectifs], [Nb|Distributions]) :-
    recupere_distributions(Effectifs, Distributions).

/* ============================== EFFECTIFS ================================= */

 % retourne les effectifs des Valeurs
    % ex) effectifs([5,5,7,7,7,8], [e(5,2), e(7,3), e(8,1)])
effectifs([], []) :-
    !.

effectifs([V], [e(V,1)]) :-
	!.

effectifs([V|Valeurs],Effectifs) :-
    effectifs2(Valeurs, V, 1, Effectifs).
    
% ----------
    % derniere valeur
effectifs2([V], V, Nb, [e(V, Nb1)]) :-
    !,
    Nb1 is Nb + 1.

    % derniere valeur avec changement de valeur
effectifs2([V1], V, Nb, [e(V, Nb), e(V1,1)]) :-
    !.

    % une valeur de plus de V 
effectifs2([V|Valeurs], V, Nb, Effectifs) :-
    !,
    Nb1 is Nb + 1,
    effectifs2(Valeurs, V, Nb1, Effectifs).

    % rencontre d'une nouvelle valeur
effectifs2([V1|Valeurs], V, Nb, [e(V, Nb)|Effectifs]) :-
    effectifs2(Valeurs, V1, 1, Effectifs).

% --------------------------------
nb_effectifs([], 0) :-
    !.

nb_effectifs([e(_V, E)|L], N) :-
    nb_effectifs(L, N1),
    N is N1 + E.

/* ============================= EFFECTIFS CUMULES ========================== */

% --------------------------------
effectif_cumule([], _V, 0) :-
    !.

effectif_cumule([e(Vi, _E)|_S], V, 0) :-
    Vi > V,
    !.

% Ici Vi est forcément inférieur ou égal à V
effectif_cumule([e(_Vi, E)|L], V, Effectif_cumule) :-
    effectif_cumule(L, V, E1),
    Effectif_cumule is E1 + E.

% --------------------------------
effectifs_cumules(S, EC) :-
	effectifs_cumules2(S, [], EC1),
	reverse(EC1, EC).
 
%--------
	% calcule et retourne les effectifs cumules
effectifs_cumules2([], EC, EC) :-
	!.
 
	% 1er element traite
effectifs_cumules2([e(V,N)|S], [], EC) :-
	!,
	effectifs_cumules2(S, [ec(V,N)], EC).
 
	% au moins 1 element deja traite
effectifs_cumules2([e(V,N)|S], [ec(V1, N1)|EC1], EC) :-
	N2 is N1 + N,
	effectifs_cumules2(S, [ec(V,N2), ec(V1, N1)|EC1], EC).

/* ======================== FONCTION DE REPARTITION ========================= */

% --------------------------------
    %  prend en entrée S une serie d'effectifs
fonction_repartition(S, V, f(V, F)) :-
    effectif_cumule(S, V, EC),
    nb_effectifs(S, N),
    F is EC/N.

% --------------------------------
    % retourne la fonction de repartition pour chaque valeur de S
fonctions_repartitions(S, Fs) :-
    nb_effectifs(S, N),
    effectifs_cumules(S, ECs),
    fonctions_repartitions2(ECs, N, Fs).

% -----------------------------------
    % prend en entree les effectifs cumules ECs
fonctions_repartitions2([], _N, []) :-
    !.

fonctions_repartitions2([ec(V,EC)|ECs], N, [f(V,F)|Fs]) :-
    F is EC/N,
    fonctions_repartitions2(ECs, N, Fs).

/* ================================= QUANTILES ============================== */

    % separe la serie d'effectifs S en K parties d'effectifs equivalent
    % en fonction des quantiles
parties(S, K, Parties) :-
    quantiles(S, K, Quantiles),
    parties2(S, Quantiles, Parties).

% ----------
parties2(S, [], [S]) :-
    !.

    % separe S en fonction des quantiles
parties2(S, [Quantile|Quantiles], [Partie|Parties]) :-
    partie(S, Quantile, Partie),
    subtract(S, Partie, S1),
    parties2(S1, Quantiles, Parties).
    
% ----------
    % recupere dans S tous les elements e(Vi, _N) dont V_i est inferieure ou
    % ou egale a V
partie([], _V, []) :-
    !.

partie([e(V1, _N)|_S], V, []) :-
    V1 > V,
    !.

partie([e(V1, N1)|S], V, [e(V1,N1)|Partie]) :-
    partie(S, V, Partie).

% ----------
    % retourne la plus petite valeur Q de S telle que
    % au moins une proportion P (0 <= P <= 1) des valeurs de S
    % sont inférieures ou égales à Q
quantile(S, P, Q) :-
    fonctions_repartitions(S, Fs),
    min_valeur(Fs, P, Q).

% ----------
    % retourne les K-1 quantiles separant les valeurs de S
    % en K parties de même effectifs
    % ex) pour K = 4 les proportions sont [0.25, 0.5, 0.75]
quantiles(S, K, Quantiles) :-
    proportions(K, Proportions),
    quantiles2(S, Proportions, Quantiles).

% ----------
    % calcule les quantiles d'ordre P1, P2, etc...
quantiles2(_S, [], []) :-
    !.

quantiles2(S, [P|Ps], [Q|Qs]) :-
    quantile(S, P, Q),
    quantiles2(S, Ps, Qs).
    

% ----------
    % retourne la valeur minimale dont la fonction de repartition
    % est superieure ou egale a P
min_valeur([f(V, F)|_Fs], P, V) :-
    F >= P,
    !.

min_valeur([_|Fs], P, V) :-
    min_valeur(Fs, P, V).

% ----------
    % retourne les frontieres d'un intervalle [0,1] divise en K intervalles
    % de taille Taille
proportions(K, Proportions) :-
    Taille is 1 / K,
    frontieres(1, K, Taille, Proportions).

% ----------
frontieres(K, K, _Taille, []) :-
    !.

frontieres(N, K, Taille, [Proportion|Proportions]) :-
    Proportion is N * Taille,
    N1 is N+1,
    frontieres(N1, K, Taille, Proportions).


/* ========================= STATISTIQUES DE BASE ========================= */

% ----------
somme([], 0) :-
    !.

somme([e(V,E)|S], Somme) :-
    somme(S, Somme1),
    Somme is Somme1 + E * V.

% ----------
mean(S, Mean) :-
    nb_effectifs(S, N),
    somme(S, Somme),
    Mean is Somme/N.

% ----------
effectifs_inv([], []).

effectifs_inv([e(V,E)|R], L) :-
    traiter_valeur(V, E, L1),
    effectifs_inv(R, L2),
    append(L1, L2, L).

% ----------
traiter_valeur(_, 0, []).

traiter_valeur(V, N, [V|R]) :-
    N1 is N - 1,
    traiter_valeur(V, N1, R).

% ----------
carres_des_ecarts_a_la_moyenne([], _Mean, []) :-
    !.

carres_des_ecarts_a_la_moyenne([E|R], Mean, [X|L]) :-
    carres_des_ecarts_a_la_moyenne(R, Mean, L),
    X is (E - Mean) ^ 2.

% ----------
variance(S, Variance) :-
    mean(S, Mean),
    effectifs_inv(S, Effectifs),
    length(Effectifs, N),
    carres_des_ecarts_a_la_moyenne(Effectifs, Mean, L),
    sum_list(L, Somme),
    Variance is Somme / N.
    
% ----------
standard_deviation(S, Standard_deviation) :-
    variance(S, Variance),
    Standard_deviation is Variance ^ (1/2).

% ----------
% frequence(Serie, Valeur, Frequence) retourne la fréquence de la valeur 
% Effectif de la valeur / nombre de valeurs
frequence1([], _Valeur, _N, 0) :-
    !.

frequence1([e(Valeur, E)|_S], Valeur, N, Frequence) :-
    !,
    Frequence is E/N.

frequence1([e(Valeur, E)], Valeur, N, Frequence) :-
    !,
    Frequence is E/N.

frequence1([e(_V, _E)|S], Valeur, N, Frequence) :-
    frequence1(S, Valeur, N, Frequence).

frequence(S, Valeur, Frequence) :-
    nb_effectifs(S, N),
    frequence1(S, Valeur, N, Frequence).

% ----------
% frequences(Serie, Frequences) retourne la liste des frequences des valeurs
frequences1([], _N, []) :-
    !.

frequences1([e(V,E)|S], N, [f(V,F)|Fs]) :-
    F is E/N,
    frequences1(S, N, Fs).

frequences(S, Fs) :-
    nb_effectifs(S, N),
    frequences1(S, N, Fs).

/* ================================ FIN LISTING ============================= */
