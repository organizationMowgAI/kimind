:- 
    use_module(fonctions_somme),
    use_module(bk_somme),
    use_module(liste).

testA :-
	gtrace,
	difficulty_sum(5, Difficulty, 5),
	writeln(Difficulty),
	halt(0).

test :-
    nl,
    nl,
    writeln('********** AVEC LES POSITIONS *************'),
    nl,
    fonctions_somme:difficultes_sommes_positions(5, Partition_sommes_positions_5),
    liste:affiche_liste(Partition_sommes_positions_5),
    nl,
    nl,    
    fonctions_somme:difficultes_sommes_positions(3, Partition_sommes_positions_3),
    liste:affiche_liste(Partition_sommes_positions_3),
    nl,
    nl,
    writeln('********** SANS LES POSITIONS ************'),
    nl,
    fonctions_somme:difficultes_sommes(5, Partition_sommes_5),
    liste:affiche_liste(Partition_sommes_5),
    nl,
    fonctions_somme:seuils(Partition_sommes_5, Seuils_5),
    writeln(Seuils_5),
    nl,    
    fonctions_somme:difficultes_sommes(3, Partition_sommes_3),
    liste:affiche_liste(Partition_sommes_3),
    nl,
    fonctions_somme:seuils(Partition_sommes_3, Seuils_3),
    writeln(Seuils_3),
    halt.

test1 :-
    bk_somme:difficulty_sum(10, Difficulty10, 3),
    writeln(Difficulty10),
    bk_somme:difficulty_sum(11, Difficulty11, 3),
    writeln(Difficulty11),
    bk_somme:difficulty_sum(16, Difficulty16, 3),
    writeln(Difficulty16),
    bk_somme:difficulty_sum(17, Difficulty17, 3),
    writeln(Difficulty17),
    halt.

test2 :-
    bk_somme:difficulty_sum(7, Difficulty7, 5),
    writeln(Difficulty7),
    bk_somme:difficulty_sum(8, Difficulty8, 5),
    writeln(Difficulty8),
    bk_somme:difficulty_sum(11, Difficulty11, 5),
    writeln(Difficulty11),
    bk_somme:difficulty_sum(12, Difficulty12, 5),
    writeln(Difficulty12),
    bk_somme:difficulty_sum(15, Difficulty15, 5),
    writeln(Difficulty15),
    bk_somme:difficulty_sum(16, Difficulty16, 5),
    writeln(Difficulty16),
    bk_somme:difficulty_sum(18, Difficulty18, 5),
    writeln(Difficulty18),
    bk_somme:difficulty_sum(19, Difficulty19, 5),
    writeln(Difficulty19),
    halt.

test3 :-
    bk_somme:difficulty_sum(34, Difficulty34, 3),
    writeln(Difficulty34),
    bk_somme:difficulty_sum(33, Difficulty33, 3),
    writeln(Difficulty33),
    bk_somme:difficulty_sum(28, Difficulty28, 3),
    writeln(Difficulty28),
    bk_somme:difficulty_sum(27, Difficulty27, 3),
    writeln(Difficulty27),
    halt.

test4 :-
    bk_somme:difficulty_sum(37, Difficulty37, 5),
    writeln(Difficulty37),
    bk_somme:difficulty_sum(36, Difficulty36, 5),
    writeln(Difficulty36),
    bk_somme:difficulty_sum(33, Difficulty33, 5),
    writeln(Difficulty33),
    bk_somme:difficulty_sum(32, Difficulty32, 5),
    writeln(Difficulty32),
    bk_somme:difficulty_sum(29, Difficulty29, 5),
    writeln(Difficulty29),
    bk_somme:difficulty_sum(28, Difficulty28, 5),
    writeln(Difficulty28),
    bk_somme:difficulty_sum(26, Difficulty26, 5),
    writeln(Difficulty26),
    bk_somme:difficulty_sum(25, Difficulty25, 5),
    writeln(Difficulty25),
    halt.

test5 :-
    fonctions_somme:affiche_solutions_toutes_sommes(4, 40, 4, 1, 10),
	halt(0).

/* ============================= FIN LISTING ================================ */
