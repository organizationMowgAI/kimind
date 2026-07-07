/* =========================================================================== */
/*                         QUALIFIE UNE DIFFICULTE D'UN ENONCE                 */
/*                         (SOMME ou SOMME + ORDRE COULEURS)                   */
/* =========================================================================== */

:- module(difficulty_partition,
          [
            partition_instances/3,
            affiche_partition/1,
            sort_partition/2
          ]
          ).

:- use_module(liste).

% ----------
    % on partitionne les instances en fonction de la place de leur distribution
    % D dans Parties_distributions
partition_instances(Effectifs_instances, Parties_distributions, 
                    Parties_instances) :-
    length(Parties_distributions, K),
    listes_vides(K, Parties_instances1),
    partition_instances2(Effectifs_instances, Parties_distributions, 
                         Parties_instances1, Parties_instances).
    
% ----------
partition_instances2([], _Parties_distributions, Parties_instances,  
                     Parties_instances) :-
    !.

partition_instances2([e(S, D)|Instances], Parties_distributions, 
                     Parties_instances, Parties_instances_out) :-
    insere_dans_partie(Parties_distributions, Parties_instances, e(S, D), 
                       Parties_instances1),
    partition_instances2(Instances, Parties_distributions, 
                         Parties_instances1, Parties_instances_out).

% ----------
    % insere e(S,D) dans la partie en fonction du nombre de distributions D
insere_dans_partie([Partie_dis|_Parties_dis], [Partie_inst|Parties_inst], 
                   e(S, D), [Partie_inst1|Parties_inst]) :-
    member(e(D, _), Partie_dis),
    !,
    append(Partie_inst, [e(S,D)], Partie_inst1).

insere_dans_partie([_Partie_dis|Parties_dis], [Partie_inst|Parties_inst], Elt,
                   [Partie_inst|Parties_instances]) :-
  insere_dans_partie(Parties_dis, Parties_inst, Elt, Parties_instances).

/* ================================= AFFICHAGE ============================== */

% ----------
affiche_partition([]) :-
    !.

affiche_partition([q(Difficulty, Partie)|Partition]) :-
    nl,
    nl,
    writeln(Difficulty),
    liste:affiche_liste(Partie),
    affiche_partition(Partition).
 
/* ================================== DIVERS ================================ */

% ----------
sort_partition([], []) :-
    !.

sort_partition([q(Difficulty, Partie)|Partition],
               [q(Difficulty, Partie1)|Partition1]) :-
    sort(2, @=<, Partie, Partie1),
    sort_partition(Partition, Partition1).

% ----------
listes_vides(0, []) :-
    !.

listes_vides(N, [[]|R]) :-
    N > 0,
    N1 is N - 1,
    listes_vides(N1, R).

/* ================================= FIN LISTING ============================ */
