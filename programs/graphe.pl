/* ========================== GESTION D'UN GRAPHE =========================== */

:- module(graphe,
          [
            couches/2
          ]
          ).

:- 
    use_module(library(ugraphs)),
    use_module(liste).
        
% ----------
    % retourne une liste contenant les couches du Graphe
couches([], []) :-
    !.

couches(Graphe, [Couche|Couches]) :-
    select_premiere_couche(Graphe, [], Couche),
    retire_couche(Graphe, Couche, Graphe1),
    couches(Graphe1, Couches).

% ----------
select_premiere_couche([], _Couche_precedente, []) :-
    !.   

select_premiere_couche([Noeud-_Fils|_Graphe], Predecesseurs, []) :-
    a_pere(Predecesseurs, Noeud),
    !.

select_premiere_couche([Noeud_fils|Graphe], Predecesseurs,
                       [Noeud_fils|Couche]) :-
    select_premiere_couche(Graphe, [Noeud_fils|Predecesseurs], Couche).

% ----------
retire_couche(G, Couche, G_out) :-
    subtract(G, Couche, G_out).

% ----------
    % vrai si Noeud est fils d'un des Noeuds de Couche
a_pere([], _Noeud) :-
    !,
    fail.

a_pere([Noeud-Fils|_Couche], Noeud) :-
    member(Noeud, Fils),
    !.

a_pere([_|Couche], Noeud) :-
    a_pere(Couche, Noeud).


% ----------
generer_dot_oriente(Nom_graphe) :-
    atom_concat(Nom_graphe, '.dot', Nom_graphe_dot),
    open(Nom_graphe_dot, write, Stream),
    write(Stream, 'digraph G {\n'),
    forall(edge(X,Y), format(Stream, '  ~w -> ~w;\n', [X,Y])),
    write(Stream, '}\n'),
    close(Stream).

% ----------
    % Génération du fichier DOT pour un graphe non orienté
generer_dot_non_oriente(Nom_graphe) :-
    atom_concat(Nom_graphe,'.dot', Nom_graphe_dot),
    open(Nom_graphe_dot, write, Stream),
    write(Stream, 'graph G {\n'),
            % Pour éviter les doublons (a-b et b-a), on impose un ordre
    forall((edge(X, Y), X @< Y), format(Stream, '  ~w -- ~w;\n', [X, Y])),
    write(Stream, '}\n'),
    close(Stream).
 
% ----------
dessiner_graphe_oriente(Nom_graphe) :-
    generer_dot_oriente(Nom_graphe),
    shell('dot -Tpng graphe.dot -o graphe.png'),
    shell('xdg-open graphe.png').  % remplace par "eog graphe.png" si nécessaire

% ----------
dessiner_graphe_non_oriente(Nom_graphe) :-
    generer_dot_non_oriente(Nom_graphe),
    shell('dot -Tpng graphe.dot -o graphe.png'),
    shell('xdg-open graphe.png').  % Sur Ubuntu ; sinon "eog graphe.png"

/* =============================== FIN LISTING ============================== */
