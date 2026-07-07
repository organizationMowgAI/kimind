#! /usr/bin/env swipl

/* ========================================================================== */
/*                      RECHERCHE STRATEGIES D'UN JOUEUR                      */
/*                         AU PREMIER COUP DE KIMIND                          */
/* ========================================================================== */

:- initialization top.

top :- 
    current_prolog_flag(argv, [Prefixe_parties, Debut_a, Fin_a]),
    initialisation_modules,
    atom_number(Debut_a, Debut),
    atom_number(Fin_a, Fin),
    Nb_parties is Fin - Debut + 1,
    kimind_json:charge_parties(Prefixe_parties, 
                               Debut, Fin, Parties),     
    analyse_premiers_coups(Parties, Debut, Ordre, Inverse, Distribution,
                           Ordre_couleurs, Somme_valeurs,
                           Nb_limite,  Nb_milieu, Strategie),                                                             
    affiche_resultats(Nb_parties, Ordre, Inverse, Distribution, 
                      Ordre_couleurs, Somme_valeurs,
                      Nb_limite, Nb_milieu, Strategie),
    halt(0).
    
% ----------
initialisation_modules :-
    use_module(library(clpfd)),
    use_module(bk_strategie),
    use_module(kimind_json),
    use_module(kimind_prolog),
    use_module(kimind_bk),
	use_module(affichage),
    use_module(liste),
    use_module(initialisation),
	use_module(partie).
                    
% -------------
analyse_premiers_coups(Parties, Debut, Ordre, Inverse, Distribution, 
                       Ordre_couleurs, Somme_valeurs,
                       Nb_limite, Nb_milieu, Strategie) :-     
    get_parametres_parties(Parties, Parametres),
    get_infos_cartes_jouees(Parametres, Infos),
    etudie_premiers_coups(Infos, Debut, Ordre, Inverse, Distribution,
                          Ordre_couleurs, Somme_valeurs,
                          Nb_limite, Nb_milieu, Strategie).
              
% ----------
etudie_premiers_coups(Infos, Debut, Ordre, Inverse, Distribution,
                      Ordre_couleurs, Somme_valeurs, 
                      Nb_limite, Nb_milieu, Strategie) :-
    length(Infos, N),
    premiers_coups(Infos, Debut, Ordre1, Inverse1, 
                   Ordre_couleurs1, Somme_valeurs1,
                   Nb_limite1, Nb_milieu1, Strategie_possible),                             
    Ordre is Ordre1/N,
    Inverse is Inverse1/N,
    Ordre_couleurs is Ordre_couleurs1/N,
    Somme_valeurs is Somme_valeurs1/N,
    (
        Strategie_possible > 0
           ->
               Nb_limite is Nb_limite1/Strategie_possible,
               Nb_milieu is Nb_milieu1/Strategie_possible
           ;
               Nb_limite is 0,
               Nb_milieu is 0    
    ),
    Strategie is Strategie_possible/N,
    distribution_couleurs(Infos, Distribution).
  
% ----------    
premiers_coups([], _N, 0, 0, 0, 0, 0, 0, 0) :-    
    !.
    
premiers_coups([co(Solution, Domaines, s(Sols, Sol_milieux, Sol_limites), Somme, 
                Ordre_couleurs, Partition, Couleurs_jouees, Coup)|Les_couleurs], 
               N, Nb_ordre, Nb_inverse, Nb_ordre_couleurs, 
               Nb_somme_ok, Nb_limite, Nb_milieu, Strategie_possible) :-       
               
	writeln(N), 
                        % strategies sur les couleurs                                                    
    suit_ordre_couleurs(Couleurs_jouees, Partition, Ordre_ok),
    suit_inverse_ordre_couleurs(Couleurs_jouees, Partition, Inverse_ok), 
    respecte_ordre_couleurs(Coup, Partition, Ordre_couleurs_ok),  
    
    
                        % strategies sur les valeurs
    respecte_somme_valeurs(Coup, Somme, Somme_ok),  
    ordonne_domaines(Coup, Domaines, Domaines1),
    
    ordonne_solutions(Sol_milieux, Coup, Sol_milieux1),
    ordonne_solutions(Sol_limites, Coup, Sol_limites1),
    
	bk_contraintes:retirer_positions_solutions(Sol_milieux1, Sol_milieux2),
	bk_contraintes:retirer_positions_solutions(Sol_limites1, Sol_limites2),
    
    intersection(Sol_milieux2, Sol_limites2, Inter),
    
    subtract(Sol_milieux2, Inter, Sol_milieux3),
    subtract(Sol_limites2, Inter, Sol_limites3),
    
    % kimind_bk:cartes_pcv_vers_cvp(Coup, Coup1),
    % kimind_bk_contraintes:solution_sans_positions(Coup1, Coup2),

	bk_contraintes:retirer_positions_solution(Coup, Coup1),
    check_milieux_limites(Sol_milieux3, Sol_limites3, Coup1,
                          Nb_milieu1, Nb_limite1, Strategie_possible1),
                         
    ordonne_solutions(Sols, Coup, Sols1),
    
    affiche_premier_coup(N, Solution, Strategie_possible1, Sols1, 
                         Sol_limites3, Sol_milieux3, 
                         Domaines1, Somme, Ordre_couleurs, 
                         Couleurs_jouees,
                         Ordre_ok, Inverse_ok, Ordre_couleurs_ok, 
                         Somme_ok, Nb_limite1, Nb_milieu1, Coup),
                         
    N1 is N+1,

    premiers_coups(Les_couleurs, N1, Nb_ordre2, Nb_inverse2, 
                  Ordre_couleurs_ok2, Somme_ok2, 
                  Nb_limite2, Nb_milieu2, Strategie_possible2),  
                             
    Nb_ordre is Ordre_ok + Nb_ordre2,
    Nb_inverse is Inverse_ok + Nb_inverse2,
    Nb_ordre_couleurs is Ordre_couleurs_ok + Ordre_couleurs_ok2,
    Nb_somme_ok is Somme_ok2 + Somme_ok,
    Nb_limite is Nb_limite1 + Nb_limite2,
    Nb_milieu is Nb_milieu1 + Nb_milieu2,
    Strategie_possible is Strategie_possible1 + Strategie_possible2.
    
% ----------
    % verifie si Coup est une solution dichotomique ou une solution
    % aux limites
check_milieux_limites(Sol_milieux, Sol_limites, Coup, 1, 0, 1) :-
        check_solutions(Sol_milieux, Sol_limites, Coup),
        !.
        
check_milieux_limites(Sol_milieux, Sol_limites, Coup, 0, 1, 1) :-
        check_solutions(Sol_limites, Sol_milieux, Coup),
        !.
        
check_milieux_limites(_Sol_milieux, _Sol_limites, _Coup, 0, 0, 0).
  
% ----------
    % verifie si Coup est une des solutions de Sols sans être une solution
    % de Sols_B
check_solutions([], _Sols_B, _Coup) :-
    !,
    fail.
        
check_solutions([Sol|_Sols], Sols_B, Coup) :-
    subset(Coup, Sol),     % suffisant pour assurer l'egalite Sol et Coup2   
    \+ solution(Sols_B, Coup),
    !.
    
check_solutions([_Sol|Sols], Sols_B, Coup) :-
    check_solutions(Sols, Sols_B, Coup).
    
% ----------    
    % verifie si Coup est une solution de Sols            
solution([], _Coup) :-
    !,
    fail.
 
/*       
solution([Sol|_Sols], Coup) :-
    kimind_bk:cartes_pcv_vers_cvp(Sol, Sol1),
    kimind_bk_contraintes:solution_sans_positions(Sol1, Sol2),
    subset(Coup, Sol2),     % suffisant pour assurer l'egalite Sol et Coup2     
    !.
*/

solution([Sol|_Sols], Coup) :-
    subset(Coup, Sol),     % suffisant pour assurer l'egalite Sol et Coup2     
    !.
    
solution([_Sol|Sols], Coup) :-
    solution(Sols, Coup).
 
% ----------
    % ordonne les couleurs des solutions en fonction des couleurs du Coup 
ordonne_solutions([], _Coup, []) :-
    !.
          
ordonne_solutions([Sol|Solutions], Coup, [Sol1|Solutions1]) :-
    ordonne_solution(Coup, Sol, Sol1),
    ordonne_solutions(Solutions, Coup, Solutions1).
        
    % ---
ordonne_solution([], [], []) :-
    !.
    
ordonne_solution([c(_Position, Couleur, _Valeur)|Cartes], 
                 Solution, 
                 [Term1|Solution_out]) :-            
    Term =.. [c, Couleur, Valeur1],
    select(Term, Solution, Solution1),
    !,
    Term1 =..[c, '-', Couleur, Valeur1],
    ordonne_solution(Cartes, Solution1, Solution_out).
       
ordonne_solution([c(_Position, Couleur, _Valeur)|Cartes], 
                 Solution, 
                 [Term1|Solution_out]) :-            
    Term =.. [c, Position, Couleur, Valeur1],
    select(Term, Solution, Solution1),
    !,
    Term1 =..[c, Position, Couleur, Valeur1],
    ordonne_solution(Cartes, Solution1, Solution_out).
    
% ----------
ordonne_domaines([], [], []) :-
    !.
    
ordonne_domaines([c(_Position, Couleur, _Valeur)|Cartes], Domaines, 
                 [Term|Domaines_out]) :-
    Term =.. [Couleur, _Min, _Max, _Moy],
    select(Term, Domaines, Domaines1),
    !,
    ordonne_domaines(Cartes, Domaines1, Domaines_out).
    
% ----------
    % verifie que les cartes respectent l'ordre des couleurs
respecte_ordre_couleurs(Coup, Partition, 1) :-
    check_ordre_couleurs(Partition, 0, Coup),
    !.
    
respecte_ordre_couleurs(_Coup, _Partition, 0).   
    
% ----------
check_ordre_couleurs([], _Vmin, _Coup) :-
    !.
    
check_ordre_couleurs([Partie|Partition], Vmin, Coup) :-
    check_ordre_couleurs_partition(Partie, Coup, Valeur, Coup1),
    Vmin < Valeur,
    check_ordre_couleurs(Partition, Valeur, Coup1).
    
% ----------    
    % toutes les cartes de la couleur de la partition doivent
    % avoir la meme valeur
check_ordre_couleurs_partition(Partition, Coup, Valeur, Cartes_restantes) :-
    get_cartes_partition(Partition, Coup, Cartes, Cartes_restantes),
    memes_valeurs(Cartes, Valeur).
    
% ----------   
    % recupere les cartes ayant une couleur dans Couleurs
get_cartes_partition([], Cartes, [], Cartes) :-
    !.
        
get_cartes_partition([Couleur|Couleurs], Cartes, 
                     [c(Position,Couleur,Valeur)|Cartes_select],
                     Cartes_restantes) :-
    select(c(Position, Couleur, Valeur), Cartes, Cartes_restantes1),
    get_cartes_partition(Couleurs, Cartes_restantes1, Cartes_select,
                         Cartes_restantes).
                         
% ----------
memes_valeurs([], _Valeur) :-
    !.
    
memes_valeurs([c(_Position, _Couleur, Valeur)|Cartes], Valeur) :-
    memes_valeurs2(Cartes, Valeur).

    % ---    
memes_valeurs2([], _Valeur) :-    
    !.
    
memes_valeurs2([c(_Position, _Couleur, Valeur)|Cartes], Valeur) :-
    memes_valeurs2(Cartes, Valeur).
    
% ----------    
    % verifie que la sommes des valeures est respectee
respecte_somme_valeurs(Cartes, Somme, Somme_ok) :-
    somme_cartes(Cartes, Sommes_cartes),
    somme_ok(Sommes_cartes, Somme, Somme_ok).
      
% ----------      
    % retourne la somme des valeurs des cartes  
somme_cartes([], 0) :-
    !.    
    
somme_cartes([c(_Position, _Couleur, Valeur)|Cartes], Somme) :-
    somme_cartes(Cartes, Somme1),
    Somme is Valeur + Somme1.
    
% ----------
somme_ok(Somme, Somme, 1) :-
    !.
    
somme_ok(_Somme_cartes, _Somme, 0).
                                                                     
% -------------        
suit_ordre_couleurs([], [], 1) :-    
    !.
    % ---   
suit_ordre_couleurs([Couleur|Couleurs_jouees], [Partition|Ordre_couleurs], 
                    Ordre_ok) :-
    select(Couleur, Partition, Partition1),
    !,
    check_partition(Partition1, Ordre_couleurs, Ordre_couleurs1),
    suit_ordre_couleurs(Couleurs_jouees, Ordre_couleurs1, Ordre_ok).

suit_ordre_couleurs(_Couleurs_jouees, _Ordre_couleurs, 0).

% -------------
suit_inverse_ordre_couleurs(Couleurs_jouees, Partition, Inverse_ok) :-
    reverse(Partition, Partition1),
    suit_ordre_couleurs(Couleurs_jouees, Partition1, Inverse_ok).   

% -------------
check_partition([], Ordre_couleurs, Ordre_couleurs) :-
    !.
check_partition(Partition, Ordre_couleurs, [Partition|Ordre_couleurs]).    
   
% ----------   
	% calcule les occurrences de chaque suite (Motif) de couleurs jouee      
distribution_couleurs(Infos, Distribution) :-
    distribution_couleurs2(Infos, Distribution1),
    length(Infos, N),
    pourcentage_distribution(Distribution1, N, Distribution).
    
% ----------
pourcentage_distribution([], _N, []) :-
    !.
        
pourcentage_distribution([d(Motif, K)|Distribution], N,
                         [d(Motif, K, A1)|Distribution1]) :-
    P is K*100/N,
    P1 is round(P),
    atom_number(A, P1),
    atom_concat(A, ' %', A1),
    pourcentage_distribution(Distribution, N, Distribution1).
                         
% ----------
    % calcule les occurrences de chaque suite (Motif) de couleurs jouee
distribution_couleurs2([], []) :-
    !.   
    % ---      
distribution_couleurs2([co(_Solution, _Domaines, _Best_sol, _Somme, 
                        _Ordre, _Partition, Motif, _Coup)|Infos],
                      [d(Motif, N1)|Distribution]) :-
    distribution_couleur(Infos, Motif, N, Infos1),
    N1 is N+1,
    distribution_couleurs2(Infos1, Distribution).
    
% ----------    
    % calcule les occurrence de Motif dans Couleurs
distribution_couleur([], _Motif, 0 , []) :-
    !.       
    % Motif trouve a ce coup
distribution_couleur([co(_Solution, _Domaines, _Best_sol, _Somme, 
                     _Ordre, _Partition, Motif, _Coup)|Infos], 
                     Motif, N, Infos1) :-
    !,                  
    distribution_couleur(Infos, Motif, N1, Infos1),
    N is 1 + N1.
    
    % Motif non trouve a ce coup
distribution_couleur([Info|Infos], Motif, N, [Info|Infos1]) :-
    distribution_couleur(Infos, Motif, N, Infos1).   
                              
/* ============================= AFFICHAGE ================================== */
    
% ----------
affiche_resultats(N, Ordre, Inverse, _Distribution, 
                  Ordre_couleurs, Somme_valeurs,
                  Nb_limite, Nb_milieu, Strategie) :-
    nl,
    write('================ Synthese sur '), 
    write(N),
    writeln(' parties ==================================='),
    nl,
    % '../commun/kimind_liste.pl':display_liste('distribution ordre couleurs cartes jouees',
    %                                           Distribution),
    nl,                                             
    write('couleurs croissantes          : '),
    format('~2f %', [Ordre*100]),
    nl,
    write('couleurs decroissantes        : '),
    format('~2f %', [Inverse*100]),                                                
    nl,
    write('ordre couleurs respecte       : '),
    format('~2f %', [Ordre_couleurs*100]),                                                
    nl,
    write('somme valeurs respectee       : '),
    format('~2f %', [Somme_valeurs*100]),                                                
    nl,
    nl,
    write('strategie possible            : '),
    format('~2f %', [Strategie*100]),                                                
    nl,
    write('choix valeurs limites         : '),
    format('~2f %', [Nb_limite*100]),                                                
    nl,
     write('choix valeurs dichotomiques   : '),
    format('~2f %', [Nb_milieu*100]),                                                
    nl,
    nl.
    
% ----------   
affiche_premier_coup(N, Solution, Strategie, Sols, Sol_limites, Sol_milieux,
                     Domaines, Somme, Ordre_couleurs,  
                     Couleurs_jouees, Ordre_ok, Inverse_ok, Ordre_couleurs_ok,
                     Somme_ok, Nb_limite, Nb_milieu, Coup) :-
    write('-------------------------------- partie '),
    write(N),
    writeln(' --------------------------------'),
    nl,
    write('somme                  : '),
    writeln(Somme),
    write('ordre couleurs         : '),
    writeln(Ordre_couleurs),
    write('solution               : '),
    writeln(Solution),
    nl,
    
    write('domaines couleurs      : '),
    writeln(Domaines),
    nl,
   
    write('solutions possibles    : '),
    kimind_liste:display_liste_tabulation(Sols, 25),
    nl,
    
    write('solution(s) dicho      : '),
    kimind_liste:display_liste_tabulation(Sol_milieux, 25),
    nl,
    write('solution(s) limite(s)  : '),
    kimind_liste:display_liste_tabulation(Sol_limites, 25),
    nl,
    
    write('coup joue              : '),
    writeln(Coup),
    nl,
    
    write('ordre couleurs jouees  : '),
    writeln(Couleurs_jouees),      
    write('couleurs croissantes   : '),
    ok(Ordre_ok, Ok_ordre),
    writeln(Ok_ordre),   
    write('couleurs decroissantes : '),
    ok(Inverse_ok, Ok_inverse),
    writeln(Ok_inverse),            
    write('ordre couleur respecte : '),
    ok_alerte(Ordre_couleurs_ok, Ok_ordre_couleurs),
    writeln(Ok_ordre_couleurs),
    nl,
    
    write('somme respectee        : '),
    ok_alerte(Somme_ok, Ok_somme),
    writeln(Ok_somme),
    nl,
    
    write('strategie possible     : '),
    ok(Strategie, Strat),
    writeln(Strat),
    
    write('choix valeurs limites  : '),
    ok(Nb_limite, Limite),
    writeln(Limite),
    
    write('choix valeurs dicho    : '),
    ok(Nb_milieu, Milieu),
    writeln(Milieu),
    nl.  
    
% -----------
ok(1, oui) :-
    !.
    
ok(0, non).    

% -----------
ok_alerte(1, oui) :-
    !.

ok_alerte(0, '!!! non !!!').  

/* =============================== DIVERS =================================== */ 
  
% ----------
	% arrondit V au centieme
centieme(P, P1) :-
    V is P*100,
    V1 is floor(V),
    P1 is V1/100.
      
% ----------
    % recupere l'ordre des couleurs de chaque premier coup des parteis
get_infos_cartes_jouees([], []) :-
    !.
    
get_infos_cartes_jouees(
        [p(Solution, Domaines, Best_sol, Somme, Ordre_couleurs, Coup)|Coups], 
        [co(Solution, Domaines, Best_sol, Somme,Ordre_couleurs,
        Partition,Couleurs,Coup2)|Les_couleurs]
                       ) :-
        partitionne_couleurs(Ordre_couleurs, [], Partition), 
        sort(3, <, Coup, Coup1),
        format_coup(Coup1, Coup2),
        get_couleurs_coup(Coup2, Couleurs),
        get_infos_cartes_jouees(Coups, Les_couleurs).
  
% ----------         
    % retourne l'ordre, la somme et le premier coup de chaque partie
get_parametres_parties([], []) :-
    !. 
    
get_parametres_parties([Partie|Parties], [Para|Paras]) :-
    get_parametres_partie(Partie, Para),
	supprime_parametres,
    get_parametres_parties(Parties, Paras).  
       
% ----------
supprime_parametres :-
	supprime(couleurs),
	supprime(nb_egals),
	supprime(blue),
	supprime(red),
	supprime(green),
	supprime(yellow).

% ----------
supprime(Cle) :-
	recorded(Cle, _, Ref),
	erase(Ref),
	fail ; true.

% ----------
get_parametres_partie(
                       Partie, 
                       p(Solution, Domaines, 
                         s(Solutions1, Sol_milieux, Sol_limites),
                         Somme, Ordre_couleurs, Coup)
                     ) :-
            
	partie:get_partie_prolog(nom, Partie, Nom_partie),
	writeln(Nom_partie),
	partie:get_partie_prolog(ordre_couleurs, Partie, Ordre_couleurs),
                   
    initialisation:
	initialisation_robot(Partie, Nb_cartes, Cartes, Solution, Somme),   

    
    % bk_contraintes:retrouve_couleurs_cartes(Solution, Solution1),                                     
    bk_contraintes:calcule_solutions(Cartes, Solutions),
       
    bk_strategie:get_domaines_couleurs(Solutions, Domaines),
    bk_strategie:get_distances_milieux(Solutions, Domaines, Distances),
                                         
    bk_contraintes:retirer_positions_solutions(Solutions, Solutions1),    
             
    bk_strategie:
    solutions_plus_petites_distances(Solutions, 1, Distances, 
                                     Solutions_milieux),  
    bk_contraintes:retirer_positions_solutions(Solutions_milieux, Sol_milieux),

    kimind_bk_strategie:get_distances_limites_bis(Solutions, 
                                                  Domaines, Distances_limites),
    kimind_bk_strategie:solutions_plus_petites_distances(Solutions, 1, 
                                                         Distances_limites, 
                                                         Solutions_limites),                                   
    bk_contraintes:
    retirer_positions_solutions(Solutions_limites, Sol_limites),   
	            
    partie:get_partie_prolog(cartes_jouees, Partie, Cartes_jouees),
    select_n_first(Cartes_jouees, Nb_cartes, _Reste, Coup).
  
% ----------
format_coup([], []) :-
    !.

format_coup([c(Couleur, Valeur, Position, _, _, _)|Cartes],
            [c(Position, Couleur, Valeur)|Cartes1]) :-
    format_coup(Cartes,Cartes1).
  
% ----------         
    % partitionne les couleurs par ordre croissant
    % sans les operateurs
    % les couleurs egales sont dans la meme partition
partitionne_couleurs([], Partition, [Partition]) :-
    !.   
    
    % reste dans la meme partition
partitionne_couleurs([=|L], Partition, L1) :-
    !,
    partitionne_couleurs(L, Partition, L1).     
    
   % cree nouvelle partition 
partitionne_couleurs([<|L], Partition, [Partition|L1]) :-
    !,
    partitionne_couleurs(L, [], L1).
    
   % place E dans la partition courante 
partitionne_couleurs([E|L], Partition, L1) :-
    partitionne_couleurs(L, [E|Partition], L1).
    
% ----------    
    % recupere les couleurs jouees lors d'un coup (N cartes par coup)        
get_couleurs_coup([], []) :-
    !.
        
get_couleurs_coup([c(_Position, Couleur,_Valeur)|Cartes], [Couleur|Couleurs]) :-
    get_couleurs_coup(Cartes, Couleurs).
                                       
/* ================================== FIN LISTING =========================== */
