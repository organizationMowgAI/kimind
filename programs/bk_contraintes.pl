/* ============================== GERE DES CONTRAINTES ====================== */

:- module(
          bk_contraintes, 
          [
            domaines_par_couleur/2,
            integers_dom/2,

    		dom_integers/2,
    		domaine/2,
    		domaine_carte/2,
    		domaines_cartes/2,
    		get_domaines/2,
    		domaine_couleur/2,
    		domaine_valeur/2,
            
            carte_position_devinee/1,
            
			nombre_solutions/3,
			solutions_sans_positions2/2,
			solutions/2,
            solutions_sans_positions/2,
            solution_sans_positions/2,
            solutions_compatibles_positions/3,
            calcule_solutions/2,
			retirer_positions_solutions/2,
			retirer_positions_solution/2,

            contrainte_domaine_couleurs/2,
		    contrainte_domaine_variable/2,
		    contrainte_domaine_variables/2,

		    set_ids_couleurs/1,
            set_ids_couleurs/2,
		    get_ids_des_couleurs/1,

		    get_couleur/2,
		    get_couleurs/2,
            get_id_couleur/2,

            couleurs_domaines_positions/2,
            retrouve_couleurs/2,
            retrouve_couleurs_listes/2,
            retrouve_couleurs_listes_cartes/2,
 			retrouve_couleurs_cartes/2,
 			retrouve_couleur_carte/2,
 			
		    get_les_couleurs/1,

		    convertit_ordre_couleurs/2,
		    convertit_cartes_jouees/2,
		    convertit_cartes/2,
		    convertit_solution/2,
		    convertit_cartes_pcv/2,
		    convertit_couleurs_cartes/2,
		    convertit_couleur_carte/2
          ]
		 ).

:- use_module(library(clpfd)),
   use_module(library(lists)).

/* ================================= SOLUTIONS ============================== */

% ----------
retirer_positions_solutions([], []) :-
	!.

retirer_positions_solutions([Solution|Solutions], [Solution1|Solutions1]) :-
	retirer_positions_solution(Solution, Solution1),
	retirer_positions_solutions(Solutions, Solutions1).

% ----------
retirer_positions_solution([], []) :-
	!.

retirer_positions_solution([c(_Position, Couleur,Valeur)|Coups], 
                            [c(Couleur, Valeur)|Coups1]) :-
	retirer_positions_solution(Coups, Coups1).
	
% -------------
    % calcule les solutions en fonction des variables des triplets
    % p(1, c1, v1), etc...
calcule_solutions(Cartes, Solutions) :-
   findall(
             Cartes,
             (           
                term_variables(Cartes, Var_cartes),                                
                label(Var_cartes)
             ), 
             Solutions1
            ),     
   retrouve_couleurs_listes_cartes(Solutions1, Solutions).
    
% ----------
	% retourne toutes les Solutions
solutions(Cartes, Solutions) :-
	findall(Cartes, (term_variables(Cartes, Var_cartes), 
                              label(Var_cartes)),
            Solutions1),
    retrouve_couleurs_cartes_solutions(Solutions1, Solutions).

% ----------
nombre_solutions(Cartes, Nb_solutions, Nb_solutions_sans_positions) :-
	solutions(Cartes, Solutions),
	length(Solutions, Nb_solutions),
	solutions_sans_positionsA(Solutions, Solutions_sans_positions),
	length(Solutions_sans_positions, Nb_solutions_sans_positions).

% -------------
solutions_sans_positions(Cartes, Solutions_out):-
    solutions(Cartes, Solutions),
	solutions_sans_positionsA(Solutions, Solutions_out).	

% ----------
solutions_sans_positionsA(Solutions, Solutions_out) :-
	solutions_sans_positions2(Solutions, Solutions1),
	sort(Solutions1, Solutions_out).

% -------------
solutions_sans_positions2([], []) :-
	!.

solutions_sans_positions2([Solution|Solutions], [Solution2|Solutions1]) :-
	solution_sans_positions(Solution, Solution1),
	sort(Solution1, Solution2),
	solutions_sans_positions2(Solutions, Solutions1).
	
% ----------
solution_sans_positions([], []) :-
	!.

solution_sans_positions([c(_Position_, Couleur, Valeur)|Cartes],
                        [c(Couleur,Valeur)|Cartes1]) :-                  
	solution_sans_positions(Cartes, Cartes1).	
	
% ----------	
    % recherche parmi les solutions retenues celles dont les positions
    % sont compatibles avec ce qu''on connait sur les positions
solutions_compatibles_positions([], _Cartes_positions, []) :-
    !.
    
solutions_compatibles_positions([Solution|Solutions], Cartes_positions,
                              [Solution|Solutions1]) :-
    solution_compatible_positions(Solution, Cartes_positions),
    solutions_compatibles_positions(Solutions, Cartes_positions, Solutions1).
    
solutions_compatibles_positions([_Solution|Solutions], Cartes_positions,
                                Solutions1) :-
    solutions_compatibles_positions(Solutions, Cartes_positions, Solutions1).
    
% ----------                                  
    % verifie que la solution est compatible avec Cartes_positions
solution_compatible_positions([], _Cartes_positions) :-
    !.
    
solution_compatible_positions([c(Couleur, Valeur, Position)|Cartes], 
                               Cartes_positions) :-                          
    member(c(Position, Couleur1, Valeur1), Cartes_positions),
                                          % pour eviter point de choix inutile
    fd_dom(Couleur1, Dom_couleur),
    dom_integers(Dom_couleur, Dom_couleur1),
    member(Couleur, Dom_couleur1),         % Couleur ok pour cette position
  
    fd_inf(Valeur1, Min),
    fd_sup(Valeur1, Max),                 
    Valeur >= Min,
    Valeur =< Max,                        % Valeur ok pour cette position
    !,
    solution_compatible_positions(Cartes, Cartes_positions).
                                 	           
/* ================================ COULEURS ================================ */
 
% ----------
couleurs_domaines_positions([], []) :-
    !.
    
couleurs_domaines_positions([c(P, D, V)|L], [c(P, D1, V) |L1]) :-
    retrouve_couleurs(D, D1),
    couleurs_domaines_positions(L, L1).
 
% ----------
	% retrouve les couleurs correspondant aux code
retrouve_couleurs([], []) :-
    !.
    
retrouve_couleurs([Id_couleur|L], [Couleur|LCouleurs]) :-
    get_couleur(Id_couleur, Couleur),
    retrouve_couleurs(L, LCouleurs).
    
 % ----------   
retrouve_couleurs_listes([], []) :-
    !.
    
retrouve_couleurs_listes([L|LL], [L1|LL1]) :-
    retrouve_couleurs(L, L1),
    retrouve_couleurs_listes(LL, LL1).
 
% ---------- 
retrouve_couleurs_listes_cartes([], []) :-
    !.    
    
retrouve_couleurs_listes_cartes([LCartes|LLCartes], [LCartes1|LLCartes1]) :-
    retrouve_couleurs_cartes(LCartes, LCartes1),
    retrouve_couleurs_listes_cartes(LLCartes, LLCartes1).
    
% ----------
retrouve_couleurs_cartes([], []) :-
	!.
  
retrouve_couleurs_cartes([Carte|Cartes],[Carte1|Cartes1]) :-
	retrouve_couleur_carte(Carte, Carte1),
	retrouve_couleurs_cartes(Cartes, Cartes1).             
 
% ----------
   % retrouve la couleur d''une carte a partir de son Id 
retrouve_couleur_carte(Carte, Carte1) :-
    Carte =..[Pred, Position, Id_couleur, Valeur, Temps, Rep_couleur, Rep_valeur],
    !,
    get_couleur(Id_couleur, Couleur),
    Carte1 =..[Pred, Position, Couleur, Valeur, Temps, Rep_couleur, Rep_valeur].
    
retrouve_couleur_carte(Carte, Carte1) :-
    Carte =..[Pred, Position, Id_couleur, Valeur],
    !,
    get_couleur(Id_couleur, Couleur),
    Carte1 =..[Pred, Position, Couleur, Valeur].
    
retrouve_couleur_carte(Carte, Carte1) :-
    Carte =..[Pred, Id_couleur, Valeur],
    !,
    get_couleur(Id_couleur, Couleur),
    Carte1 =..[Pred, Couleur, Valeur].    
    
% ---------- 
retrouve_couleurs_cartes_solutions([], []) :-
	!.

retrouve_couleurs_cartes_solutions([Solution|Solutions], [Solution1|Solutions1]) :-
	retrouve_couleurs_cartes(Solution, Solution1),
	retrouve_couleurs_cartes_solutions(Solutions, Solutions1).


% --- convertit les couleurs en entier
convertit_ordre_couleurs([], []) :-
    !.
   
convertit_ordre_couleurs([Comp|Ordre_couleurs], [Comp|Ordre_couleurs1]) :-
    member(Comp, [<, =]),
    !,
    convertit_ordre_couleurs(Ordre_couleurs, Ordre_couleurs1).
    
convertit_ordre_couleurs([Couleur|Ordre_couleurs], 
                         [Id_couleur|Ordre_couleurs1]) :-
    get_id_couleur(Couleur, Id_couleur),
    convertit_ordre_couleurs(Ordre_couleurs, Ordre_couleurs1).
  
% --- convertit les couleurs en entier
convertit_solution([], []) :-
    !.
   
convertit_solution([c(Position, Id_couleur, Valeur)|Cartes],
                   [c(Position, Couleur, Valeur)|Cartes1]) :-
    !,
    get_id_couleur(Couleur, Id_couleur),
    convertit_solution(Cartes, Cartes1).    
 
% ----------                      
   % convertit les couleurs des cartes en entier
convertit_couleurs_cartes([], []) :-
    !.
   
convertit_couleurs_cartes([Carte|Cartes],
                          [Carte1|Cartes1]) :-
    convertit_couleur_carte(Carte, Carte1),
    convertit_couleurs_cartes(Cartes, Cartes1).   
    
% ----------    
    % convertit la couleur d''une carte en entier
convertit_couleur_carte(Carte, Carte1) :-
    Carte =..[Pred, Position, Couleur, Valeur],
    get_id_couleur(Couleur, Id_couleur),
    !,
    Carte1 =..[Pred, Position, Id_couleur, Valeur].
    
convertit_couleur_carte(Carte, Carte1) :-
    Carte =..[Pred, Couleur, Valeur, Position],
    get_id_couleur(Couleur, Id_couleur),
    Carte1 =..[Pred, Id_couleur, Valeur, Position].
    
% ----------   
   % convertit les couleurs en entier
convertit_cartes([], []) :-
    !.
   
convertit_cartes([c(Couleur, Valeur, Position)|Cartes],
                   [c(Id_couleur, Valeur, Position)|Cartes1]) :-
    !,
    get_id_couleur(Couleur, Id_couleur),
    convertit_cartes(Cartes, Cartes1).         
 
% ---------- 
   % convertit les couleurs en entier
   % les cartes sont au format c(Position, Valeur, Couleur) (pcv)
convertit_cartes_pcv([], []) :-
    !.
   
convertit_cartes_pcv([c(Position, Couleur, Valeur)|Cartes],
                     [c(Position, Id_couleur, Valeur)|Cartes1]) :-
    !,
    get_id_couleur(Couleur, Id_couleur),
    convertit_cartes_pcv(Cartes, Cartes1).       
 
% ----------        
    % convertit les couleurs en entier
convertit_cartes_jouees([], []) :-
    !.
   
convertit_cartes_jouees([c(Couleur, Valeur, Position, Temps, Rep_couleur, Rep_valeur)|Cartes],
                        [c(Id_couleur, Valeur, Position, Temps,Rep_couleur, Rep_valeur)|Cartes1]) :-
    !,
    get_id_couleur(Couleur, Id_couleur),
    convertit_cartes_jouees(Cartes, Cartes1).

% ----------
get_les_couleurs(Couleurs) :-
    running_game:couleurs(Couleurs).

% ----------
set_ids_couleurs(_Couleurs, Ordre_couleurs) :-
    compte_egalites(Ordre_couleurs, Nb_egals),
    running_game:assert(nb_egals(Nb_egals)),
    set_ids_couleurs3(Ordre_couleurs, 100, Nb_egals).
  
% ----------
set_ids_couleurs3([], _N, _Nb_egals) :-
	!.

set_ids_couleurs3([=|L], N, Nb_egals) :-
    !,
    N1 is N+1,
    set_ids_couleurs3(L, N1, Nb_egals).

set_ids_couleurs3([<|L], N, Nb_egals) :-
    !,
    N1 is N+1+Nb_egals,
    set_ids_couleurs3(L, N1, Nb_egals).

set_ids_couleurs3([Couleur|L], N, Nb_egals) :-
    running_game:assert(couleur(Couleur,N)),
    set_ids_couleurs3(L, N, Nb_egals).

% ----------
compte_egalites([], 0) :-
    !.

compte_egalites([=|L], N) :-
    !,
    compte_egalites(L, N1),
    N is 1 + N1.

compte_egalites([_|L], N) :-
    compte_egalites(L, N).
    
% ----------
	% affecte a chaque couleur un identifiant entier
	% (afin d''utiliser un CSP sur les entiers)
set_ids_couleurs(Couleurs) :-
    running_game:assert(couleurs(Couleurs)),
	set_ids_couleurs2(Couleurs, 100).
  
% ----------
set_ids_couleurs2([], _N) :-
	!.

set_ids_couleurs2([Couleur|Couleurs], N) :-
	running_game:assert(couleur(Couleur, N)),
	N1 is N+1,
	set_ids_couleurs2(Couleurs, N1).

% ----------
get_ids_des_couleurs(Ids_couleurs) :-
   running_game:couleurs(Couleurs),
   get_ids_couleurs2(Couleurs, Ids_couleurs).
   
% ----------
get_ids_couleurs2([], []) :-
    !.  
   
get_ids_couleurs2([Couleur|Couleurs], [Id_couleur|Ids_couleurs]) :-
	running_game:couleur(Couleur, Id_couleur),
    get_ids_couleurs2(Couleurs, Ids_couleurs).
    
% ----------
get_id_couleur(Couleur, Id_couleur) :-
	running_game:couleur(Couleur, Id_couleur).

% ----------
    % retrouve les couleurs a partir de leur Ids
get_couleurs([], []) :-
    !.
    
get_couleurs([Id_couleur|Ids_couleurs], [Couleur|Couleurs]) :-
    get_couleur(Id_couleur, Couleur),
    get_couleurs(Ids_couleurs, Couleurs).
    
% ----------
	% retrouve la couleur d''identifiant Id_couleur
get_couleur(Id_couleur, Couleur) :-
	get_les_couleurs(Couleurs),
    get_couleur2(Couleurs, Id_couleur, Couleur).

get_couleur2([Couleur|_Couleurs], Id_couleur, Couleur) :-
	running_game:couleur(Couleur, Id_couleur),
	!.

get_couleur2([_Couleur1|Couleurs], Id_couleur, Couleur) :-
	get_couleur2(Couleurs, Id_couleur, Couleur).   
  
/* ================================ DOMAINES ================================ */

% ----------
    % convertit un domaine en liste d'entiers
dom_integers(D, Is) :- phrase(dom_integers_(D), Is).

% ----------
dom_integers_(I)      --> { integer(I) }, [I].
dom_integers_(L..U)   --> { numlist(L, U, Is) }, Is.
dom_integers_(D1\/D2) --> dom_integers_(D1), dom_integers_(D2).

% ----------
    % convertit une liste d'entier en domaine
integers_dom([X], X) :-
    !.

integers_dom([X|L], X \/ D) :-
    integers_dom(L, D).
    
% ----------    
domaine_couleur(Var_couleur, Domaine) :-
    fd_dom(Var_couleur, Dc),
    dom_integers(Dc, Dci),
    retrouve_couleurs(Dci, Domaine).
    
% ----------
domaine_valeur(Var_valeur, Domaine) :-
    fd_dom(Var_valeur, Dv),
    dom_integers(Dv, Domaine).   

% ----------
get_domaines(Cartes, Domaines) :-
    domaines_cartes(Cartes, Domaines1),
    couleurs_domaines_positions(Domaines1, Domaines).

% ----------
domaines_par_couleur(Solutions, Domaines) :-
    domaines_par_couleur2(Solutions, Domaines1),
    sort_domaines_couleurs(Domaines1, Domaines).
    
% ---------- 
domaines_par_couleur2([], []) :-
	!.

domaines_par_couleur2([Solution|Solutions], Domaines) :-
    domaines_par_couleur_solution(Solution, Domaines_solution),
	domaines_par_couleur2(Solutions, Domaines1),
    maj_domaines_couleurs(Domaines_solution, Domaines1, Domaines).

% ----------
	% recupere les valeurs associees aux couleurs au sein de la Solution
domaines_par_couleur_solution([], []) :-
	!. 

domaines_par_couleur_solution([c(Couleur, Valeur, _Position)|Cartes], 
							  [Couleur_t|Couleurs_t]) :-
	Couleur_t =..[Couleur, [Valeur]],
	domaines_par_couleur_solution(Cartes, Couleurs_t).

% ----------
maj_domaines_couleurs(Domaines, [], Domaines) :-
	!.

maj_domaines_couleurs([], Domaines, Domaines) :-
	!.

maj_domaines_couleurs([Couleur_t|Couleurs_t], Domaines, Domaines_out) :-
	Couleur_t =.. [Couleur, Valeur],
	Couleur_t1 =.. [Couleur, Valeurs],			% Valeurs non instantiee ici
	select(Couleur_t1, Domaines, Domaines1),
	!,											
	append(Valeur, Valeurs, Valeurs1),
	Couleur_t2 =..[Couleur, Valeurs1],
	maj_domaines_couleurs(Couleurs_t, [Couleur_t2|Domaines1], Domaines_out).

% ----------
sort_domaines_couleurs([], []) :-
    !.
    
sort_domaines_couleurs([Couleur|Couleurs], [Couleur1|Couleurs1]) :-
    Couleur =..[Pred, Valeurs],
    sort(Valeurs, Valeurs1),
    Couleur1 =..[Pred,Valeurs1],
    sort_domaines_couleurs(Couleurs, Couleurs1).

% ----------
carte_position_devinee(c(_Position, Couleur, Valeur)) :-
    fd_size(Couleur, 1),
    fd_size(Valeur, 1).
    
% ----------
    % retourne le domaine d'un ensemble de couleurs (entiers)
contrainte_domaine_couleurs(Constantes_couleurs, Couleurs) :-
    integers_dom(Constantes_couleurs, Domaine),
    Couleurs ins Domaine.

    % ajoute une contrainte de domaine a Variable
contrainte_domaine_variable(Domaine, Variable) :-
    min_member(Vmin, Domaine),
    max_member(Vmax, Domaine),
    Variable in Vmin..Vmax.  
    
% ----------    
    % ajoute des contraintes de domaine (commun) aux Variables
contrainte_domaine_variables(Domaine, Variables) :-
    min_member(Vmin, Domaine),
    max_member(Vmax, Domaine),
    Variables ins Vmin..Vmax.  

% ----------    
    % retourne les domaines des cartes couleurs
domaines_cartes([], []) :-
    !.
        
domaines_cartes([Carte|L], 
                [c(P, Da, Db)|L1]) :-
    Carte =..[_Pred, P, A, B],          
    domaine(A, Da),
    domaine(B, Db),
    domaines_cartes(L, L1).

% ----------
domaine_carte(c(Position, Couleur, Valeur), c(Position, D_couleur, D_valeur)) :-
    domaine(Couleur, D_couleur1),
    get_ids_couleurs(D_couleur1, D_couleur),
    domaine(Valeur, D_valeur).
    
% ----------
    % retourne le domaine d'une variable
domaine(Var, Domaine) :-
    fd_dom(Var, D),
    dom_integers(D, Domaine).
    
/* ================================= DIVERS ================================= */

% ----------
    % si un groupe contient A comparaison B et une equivalence
    %  E1 <=> A comparaison2 B, et que 
    % A comparaison2 B,  incompatible avec A comparaison B
    % alors on retire l'equivalence  
simplifie_comparaisons_equivalences([], []) :-
    !.

    % contrainte porte sur toutes les cartes
simplifie_comparaisons_equivalences([co(Contraintes)|Groupes], 
                                    [co(Contraintes)|Groupes1]) :-
    !,
    simplifie_comparaisons_equivalences(Groupes, Groupes1).
    
simplifie_comparaisons_equivalences([Groupe|Groupes], [Groupe1|Groupes1]) :-
    comparaisons_equivalences(Groupe, Groupe1),                                
    !,
    simplifie_comparaisons_equivalences(Groupes, Groupes1).
           
% ------------        
comparaisons_equivalences(co(Carte, Contraintes), co(Carte, Contraintes1)) :-
    !,
    comp_equivalence(Contraintes, Contraintes1).
    
comparaisons_equivalences(co(Carte1, Carte2, Contraintes), 
                          co(Carte1, Carte2, Contraintes1)) :-
    comp_equivalence(Contraintes, Contraintes1).
    
% ----------
comp_equivalence(Contraintes, [Comp|Contraintes_out]) :-
    select_comp(Contraintes, Comp, Contraintes1),
    !,
    check_equivalences(Comp, Contraintes1, Contraintes_out).
    
comp_equivalence(Contraintes, Contraintes).

% ----------
    % recherche une comparaison
select_comp([], rien, []) :-
    !,
    fail.
    
select_comp([Comp|Contraintes], Comp, Contraintes) :-
    functor(Comp, Op, _Arity),
    member(Op, [<, =<]),
    !.
    
select_comp([Contrainte|Contraintes], Comp, [Contrainte|Contraintes1]) :-
    select_comp(Contraintes, Comp, Contraintes1).
    
/* ============================== FIN LISTING =============================== */
