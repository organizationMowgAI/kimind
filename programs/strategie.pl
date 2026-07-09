/* ========================================================================== */
/*                             STRATEGIE DU ROBOT                             */
/*                             POUR JOUER UN COUP                             */
/* ========================================================================== */

:- module(
             strategie, 
             [
             	get_coups_analyse/2,
                get_coup_robot/4,
                get_domaines_couleurs/2,

				distances_solution_milieux/3,
                get_distances_milieux/3,

				plus_petites_distances_limites/3,

				somme_distances_milieux/3,
				sommes_distances_milieux/3,

				somme_distances_limites/3,
                sommes_distances_limites/3,

                solutions_plus_petites_distances/4
             ]      
		  ).
		 
:- 
   use_module(affichage),
   use_module(bk),
   use_module(bk_contraintes),
   use_module(divers),
   use_module(liste),
   use_module(messages),
   use_module(kimind_prolog).
 
% ---------- 
    % joue la solution dont les valeurs des couleurs,
    % s'approchent le plus du domaine de valeurs   
get_coup_robot(Solutions, Cartes, Extrema_couleurs, Coup1) :-
                   % recupere les plus petites distances par rapport 
				   % des domaines des valeurs aux milieurs      
    get_distances_milieux(Solutions, Extrema_couleurs, Distances),
				   % selectionne les plus petites distances
	get_plus_petites_distancesA(Distances, Distances1),
				   % recupere les solutions ayant les plus petites distances
    solutions_plus_petites_distances(Solutions, 1, Distances1, Solutions2),
    solutions_meilleures_positions(Solutions2, Cartes, Coup),
	ordonne_cartes(Coup, Coup1),
	nl,
	write('coup jouee : '),
	writeln(Coup1),
	nl.

% ----------
	% recupere les plus petites distances de Distances.
	% Distances est ordonne par distances croissantes
get_plus_petites_distancesA([d(N,Distance)|Distances], 
						   [d(N,Distance)|Distances1]) :-
	get_plus_petites_distancesA2(Distances, Distance, Distances1).

% ----------
get_plus_petites_distancesA2([], _Distance, []) :-
	!.

get_plus_petites_distancesA2([d(N,Distance)|Distances], Distance, 
							[d(N,Distance)|Distances1]) :-
	!,
	get_plus_petites_distancesA2(Distances, Distance, Distances1).	

get_plus_petites_distancesA2(_Distances, _Distance, []).

% ----------
	% retourne tous les coups possibles,
	% un coup est une solution
 get_coups_analyse(Solutions, Coups) :-
 	findall(Coup1, member(Coup1, Solutions), Coups). 
        	
% ----------
	% retourne les valeurs par couleur de l'ensemble des solutions
get_domaines_couleurs(Solutions, Valeurs_par_couleur) :-
    nth1(1, Solutions, Solution),
    get_couleurs_solution(Solution, Couleurs),
    get_domaines_couleurs2(Couleurs, Solutions, Valeurs_par_couleur).
    
% ---------
get_domaines_couleurs2([], _Solutions, []) :-
	!.
	
    % Id_couleur apparait dans les Solutions
get_domaines_couleurs2([Couleur|Couleurs], Solutions, 
                       [Tcouleur|Tcouleurs]) :-
	% get_couleur(Id_couleur, Couleur),
	!,
	get_domaines_couleur(Solutions, Couleur, Valeurs_couleur),
    sort(Valeurs_couleur, Valeurs_couleur1),
	max_member(Max, Valeurs_couleur1),
	min_member(Min, Valeurs_couleur1),
    Milieu is (Min+Max)/2,
	Tcouleur =..[Couleur, Min, Max, Milieu],
	get_domaines_couleurs2(Couleurs, Solutions,Tcouleurs).
	
% -------------
get_domaines_couleur([], _Couleur, []) :-
	!.

get_domaines_couleur([Solution|Solutions], Couleur, [Valeur|Valeurs]) :-
	domaines_couleur_solution(Solution, Couleur, Valeur),
	get_domaines_couleur(Solutions, Couleur, Valeurs).

% ----------
	% carte bonne couleur trouvee
domaines_couleur_solution([Carte|_Cartes], Couleur, Valeur) :-
	Carte =..[_Pred, _Position, Couleur,Valeur],
	!.

	% carte bonne couleur pas trouve
domaines_couleur_solution([_Carte|Cartes], Couleur, Valeur) :-
	domaines_couleur_solution(Cartes, Couleur, Valeur).
          
% ----------          	
get_couleurs_solution([], []) :-
    !.
         
get_couleurs_solution([c(_Position, Couleur, _Valeur)|Cartes], 
                       [Couleur|Couleurs]) :-
    get_couleurs_solution(Cartes, Couleurs).

    
% ----------
    % retourne la solution qui a le plus de contraintes sur le domaine
    % des positions
solutions_meilleures_positions([Solution|Solutions], Cartes, Coup) :-
    somme_domaines_valeurs_solution(Solution, Cartes, Somme),
    solutions_meilleures_positions2([Solution|Solutions], 1, Cartes,
                                    d(1,Somme), d(Num_best, _Somme_best)),
    nth1(Num_best, [Solution|Solutions], Coup).                             
    
% ----------    
solutions_meilleures_positions2([], _N, _Cartes, Best, Best) :-    
    !.
    
solutions_meilleures_positions2([Solution|Solutions], N, Cartes, 
                                d(Na, Sa), Best) :-
    somme_domaines_valeurs_solution(Solution, Cartes, S),
    check_somme(N,S, Na, Sa, N2, S2),
    N1 is N+1,
    solutions_meilleures_positions2(Solutions, N1, Cartes, d(N2,S2), Best).
      
% ----------  
check_somme(N, Somme, _N1, Somme1, N, Somme) :-
    Somme < Somme1,
    !.
    
check_somme(_N, _Somme, N1, Somme1, N1, Somme1).
         
% ---------- 
somme_domaines_valeurs_solution([], _Cartes, 0) :- 
    !.
        
somme_domaines_valeurs_solution([c(Position, _Couleur, _Valeur)|Cartes_solutions], 
                                Cartes, Somme) :-
    member(c(Position, _Couleur_p, Valeur_p), Cartes),                            
    fd_inf(Valeur_p, Inf),
    fd_sup(Valeur_p, Sup),
    Distance is Sup-Inf,
    somme_domaines_valeurs_solution(Cartes_solutions, Cartes, Somme1),
    Somme is Somme1 + Distance.
    
% ---------- 
    % retourne les solutions ayant la plus petite distance 
solutions_plus_petites_distances([], _N, _Distances, []) :-
    !.
        
solutions_plus_petites_distances([Solution|Solutions], N, Distances,
                                 [Solution|Solutions1]) :-
    member(d(N, _D), Distances),
    !,
    N1 is N+1,
    solutions_plus_petites_distances(Solutions, N1, Distances, Solutions1).
    
solutions_plus_petites_distances([_Solution|Solutions], N, Distances, 
                                 Solutions1) :-
    N1 is N+1,
    solutions_plus_petites_distances(Solutions, N1, Distances, Solutions1).
    
% ----------
    % recupere les numeros de toutes les solutions de plus petite distance
    % par rapport aux milieux	
get_plus_petites_distances(Distances, Plus_petites_distances) :-  
    sort(2, @=<, Distances, Distances1),  
    nth1(1, Distances1, d(_N, D)),
    get_plus_petites_distances2(Distances1, D, Plus_petites_distances).
    
% ------------   
get_plus_petites_distances2([d(N,D)|Distances], D, [d(N,D)|Distances1]) :-
    !,
    get_plus_petites_distances2(Distances, D, Distances1).
    
get_plus_petites_distances2(_Distances, _D, []).
    
/* ================== DISTANCES AUX LIMITES DU DOMAINE ====================== */

% ---------- 
plus_petites_distances_limites(Solutions, Extrema_couleurs, Distances) :-
	sommes_distances_limites(Solutions, Extrema_couleurs, Distances1),
	get_plus_petites_distances(Distances1, Distances).    

% ----------
sommes_distances_limites(Solutions, Extrema_couleurs, Distances) :-
    sommes_distances_limites2(Solutions, Extrema_couleurs, 1, Distances).
    
% ----------    
	% Pour chaque solution calcule la distance de ses valeurs 
	% aux limites du domaine
sommes_distances_limites2([], _Limites, _N, []) :-
	!.

sommes_distances_limites2([Solution|Solutions], Milieux, N, 
						  [e(Solution,Distance)|Distances]) :-
	somme_distances_limites(Solution, Milieux, Distance),
    N1 is N+1,
	sommes_distances_limites2(Solutions, Milieux, N1, Distances).

% ----------
somme_distances_limites(Solution, Domaines, Somme_distances) :-
	distances_limites_solution(Solution, Domaines, Distances),
	sum_list(Distances, Somme_distances1),
	arrondit_dixieme(Somme_distances1, Somme_distances).

% ----------
distances_limites_solution([], _Milieux, []) :-
	!.

distances_limites_solution([c(_Position, Couleur, Valeur)|Cartes], 
						   Domaines, [Distance|Distances]) :-
	Tcouleur =..[Couleur, Min, Max, Milieu],
	member(Tcouleur, Domaines),
	(
		Max == Min		
			-> Distance is 0
			; 
				Distance1 is min(Valeur-Min, Max-Valeur),
				Distance is Distance1 / (Milieu-Min)
	),
	distances_limites_solution(Cartes, Domaines, Distances). 

/* ==================== DISTANCES AU MILIEUX DES DOMAINES =================== */

solutions_plus_petites_distances_milieux(Solutions, Domaines, Distances) :-
	sommes_distances_milieux(Solutions, Domaines, Distances).

% ----------
get_distances_milieux(Solutions, Extrema_couleurs, Distances) :-
    distances_milieux(Solutions, Extrema_couleurs, Distances).

% ----------
	% retourne la somme des distances de chaque solution avec les milieux
	% des domaines de chaque variable  
	% les distances sont en ordre croissant
sommes_distances_milieux(Solutions, Extrema_couleurs, Distances) :-
	distances_aux_milieux2(Solutions, Extrema_couleurs, Distances1),
	retire_positions(Distances1, Distances2),
	sort(Distances2, Distances3),
	sort(2, @=<, Distances3, Distances).
	
% ----------
	% Pour chaque solution calcule la distance de ses valeurs aux milieux
distances_aux_milieux2([], _Milieux, []) :-
	!.

distances_aux_milieux2([Solution|Solutions], Milieux, 
					   [e(Solution, Distance1)|Distances]) :-
	somme_distances_milieux(Solution, Milieux, Distance1),
	distances_aux_milieux2(Solutions, Milieux, Distances).

% ----------
	% retourne la distance moyenne de chaque solution avec les milieux
	% des domaines de chaque variable    
	% les distances sont en ordre croissant
distances_milieux(Solutions, Extrema_couleurs, Distances) :-
	distances_milieux2(Solutions, Extrema_couleurs, 1, Distances1),
	sort(2, @=<, Distances1, Distances).
	
% ----------
	% Pour chaque solution calcule la distance de ses valeurs aux milieux
distances_milieux2([], _Milieux, _N, []) :-
	!.

distances_milieux2([Solution|Solutions], Milieux, N, 
                   [d(N,Distance)|Distances]) :-
	distances_solution_milieux(Solution, Milieux, Distances_sol),
	sum_list(Distances_sol, Distance),
    N1 is N+1,
	distances_milieux2(Solutions, Milieux, N1, Distances).

% ----------
	% retourne la distance relative moyenne des valeurs des carte
	% avec le milieu de leur domaine
somme_distances_milieux(Cartes, Milieux, Somme_distances) :-
	distances_solution_milieux(Cartes, Milieux, Distances),
	sum_list(Distances, Somme_distances1),
	arrondit_dixieme(Somme_distances1, Somme_distances).
	
% ----------
distances_solution_milieux([], _Milieux, []) :-
	!.

distances_solution_milieux([c(_Position, Couleur, Valeur)|Cartes], 
						   Milieux, [Distance|Distances]) :-
						   
	Tcouleur =..[Couleur, Min, Max, Milieu],
	member(Tcouleur, Milieux),
	(
		Max == Min		% pas de milieu
			-> Distance is 1		% convention plus grande valeur possible
			; Distance is abs(Valeur-Milieu)/(Milieu-Min)
	),
	distances_solution_milieux(Cartes, Milieux, Distances). 

/* ================================ DIVERS ================================== */

arrondit_dixieme(X, Y) :-
    Y is round(X * 10) / 10.

% ----------
	% retire les positions des solutions dans Distances
retire_positions([], []) :-
	!.

retire_positions([e(Solution, Distance)|Distances], 
				 [e(Solution2, Distance)|Distances1]) :-
	retire_positions_solution(Solution, Solution1),
	sort(1, @<, Solution1, Solution2),
	retire_positions(Distances, Distances1).

% ----------
retire_positions_solution([], []) :-
	!.

retire_positions_solution([c(_Position, Couleur, Valeur)|Cartes], 
                         [c(Couleur, Valeur)|Cartes1]) :-
	retire_positions_solution(Cartes, Cartes1).

/* ============================== FIN LISTING =============================== */
