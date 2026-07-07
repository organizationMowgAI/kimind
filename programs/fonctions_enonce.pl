/* ========================================================================== */
/*             CALCUL ET CLASSIFICATION DES SOLUTIONS D'UN ENONCE KIMIND      */          
/* ========================================================================== */

:- module(
		  fonctions_enonce, 
          [ 
			nb_solutions_instance/3,
            difficultes_instances/2,
			solutions_all_instances/1,
			solutions_instance/2,
			solutions_instance_positions/2,
            effectifs_instances_distributions/2,
			simplify_instance/2,
			nb_equalities/2
		  ]
         ).
:-
    use_module(library(clpfd)),
    use_module(initialisation),
    use_module(kimind_json),
    use_module(partie),
    use_module(liste),
    use_module(bk_contraintes),
    use_module(fichier),
    use_module(stats),
    use_module(difficulty_partition).
	
% ----------
	% types de difficultes des enonces
instances_qualifications([easy, average, difficult]).

instances_qualifications([very_easy, easy, average, difficult, very_difficult]).

/* ================================ FONCTIONS =============================== */

% ----------
	% un probleme (instance) est de la forme
	% instance(15, 'r<b<g=y')  (couleurs dans [b,g,r,y]
nb_solutions_instance(Nb_types_difficultes, Instance, Nb_solutions) :-
		simplify_instance(Instance, Instance1),
		difficultes_enonces(Nb_types_difficultes, Partition),
		nb_solutions_instance2(Partition, Instance1, Nb_solutions1),
		Nb_solutions is Nb_solutions1 * 24.

%-----------
	% recherche le nombre de solutions d'une instance
nb_solutions_instance2([q(_Difficulty, Instances)|_Difficultes], 
                       instance(Somme, Ordre), Nb_solutions) :-
	member(e(instance(Somme, Ordre), Nb_solutions), Instances),
	!.

nb_solutions_instance2([_Partie_difficulte|Difficultes], Instance, 
                       Nb_solutions) :-
	nb_solutions_instance2(Difficultes, Instance, Nb_solutions).

% ----------
% idem sans tenir compte des positions
difficultes_instances(Nb_types_difficultes, Partition_instances) :-
    effectifs_instances_distributions(Effectifs_instances, 
                                      Effectifs_distributions),
    traite_instances(Nb_types_difficultes, Effectifs_instances, 
                     Effectifs_distributions, Partition_instances1),
    difficulty_partition:sort_partition(Partition_instances1, 
                                        Partition_instances).

% ----------
traite_instances(Nb_qualificatifs, Effectifs_instances, 
                 Effectifs_distributions, Qualifications_instances) :-
    stats:parties(Effectifs_distributions, Nb_qualificatifs, 
                  Parties_distributions),
    difficulty_partition:
    partition_instances(Effectifs_instances, Parties_distributions, 
                        Parties_instances),
    qualifie_parties(Parties_instances, Qualifications_instances).

% ----------
qualifie_parties(Parties, Parties_qualifiees) :-
    length(Parties, K),
    length(Qualifications, K),
    instances_qualifications(Qualifications),
    qualifie_parties2(Parties, Qualifications, Parties_qualifiees).

% ----------
qualifie_parties2([], [], []) :-
    !.

qualifie_parties2([Partie|Parties], [Qualif|Qualifs], 
                  [q(Qualif, Partie)|Parties_qualifiees]) :-
    qualifie_parties2(Parties, Qualifs, Parties_qualifiees).

% ---------
effectifs_instances_distributions(Effectifs_instances, 
                                  Effectifs_distributions) :-
    solutions_all_instances(Effectifs_instances), 
    stats:recupere_distributions(Effectifs_instances, Valeurs),
    msort(Valeurs, Valeurs1),
    stats:effectifs(Valeurs1, Effectifs_distributions).

% ----------
solutions_all_instances(Sum_orders) :-
	numlist(4, 40, Sums),
	findall(Order, create_order(Order), Orders),
	create_colours_orders(Orders, Colours_orders),
	create_instances(Sums, Colours_orders, Sums_orders1),
	compute_solutions(Sums_orders1, Sums_orders2),
	discard_no_solutions(Sums_orders2, Sum_orders).

% ----------
	% calcule le nombre de solutions (sans position) d'un enonce kimind
compute_solutions([], []) :-
	!.

compute_solutions([instance(Sum, Order)|Sums_orders], 
				  [e(instance(Sum, Order), Nb_solutions)|Sums_orders_solutions]) :-
	writeln(Sum),
	writeln(Order),
	nl,
	compute_solutions_instance(Sum, Order, Nb_solutions),
	compute_solutions(Sums_orders, Sums_orders_solutions).

% ----------
compute_solutions_instance(Sum, Order, Nb_solutions) :-
 	initialisation:
    initialisation_enonce(Sum, Order, 
                          [blue, green, red, yellow], [1,2,3,4,5,6,7,8,9,10], 
                          4, Cartes), 
	bk_contraintes:calcule_solutions(Cartes, SolutionsA),
	bk_contraintes:solutions_sans_positions2(SolutionsA, SolutionsB),
	sort(SolutionsB, Solutions),
	length(Solutions, Nb_solutions).		

% ----------
	% retourne les solutions d'un enonce kimind
solutions_instance_positions(instance(Somme, Ordre_couleurs), Solutions) :-                                                                                                                        
	check_ordre_couleurs(Ordre_couleurs, [b, r, y, g], [<,=], Ordre_couleurs1),
	modif_ordre_couleurs(Ordre_couleurs1, Ordre_couleurs2),
	% get_couleurs_enonce(Ordre_couleurs2, Couleurs),
    initialisation:
    initialisation_enonce(Somme, Ordre_couleurs2, 
                          [blue, green, yellow, red], [1,2,3,4,5,6,7,8,9,10], 
                          4, Cartes), 
	bk_contraintes:calcule_solutions(Cartes, Solutions).

% ----------
	% retourne les solutions sans les positions d'un enonce Kimind 
solutions_instance(Instance, Solutions) :-                                                                                                                    
	solutions_instance_positions(Instance, Solutions1),
	bk_contraintes:solutions_sans_positions2(Solutions1, Solutions2),
	sort(Solutions2, Solutions).

% ----------
	% retire les enonces sans solution
discard_no_solutions([], []) :-
	!.

discard_no_solutions([e(_Instance, 0)|Sums_orders], Sums_orders1) :-
	!,
	discard_no_solutions(Sums_orders, Sums_orders1).

discard_no_solutions([Sum_order|Sum_orders], [Sum_order1|Sums_orders1]) :-
	discard_colors(Sum_order, Sum_order1),
	discard_no_solutions(Sum_orders, Sums_orders1).

% ----------
discard_colors(e(instance(Sum, Order), Nb), e(instance(Sum, Order1), Nb)) :-
	discard_colors2(Order, Order1).

% ----------
discard_colors2([], []) :-
	!.

discard_colors2([Op|Order], [Op|Order1]) :-
	member(Op, [<,=]),
	!,
	discard_colors2(Order, Order1).

discard_colors2([_Color|Order], Order1) :-
	discard_colors2(Order, Order1).
	
% ----------
	% cree des enonces avec des couleurs
create_colours_orders([], []) :-
	!.

create_colours_orders([Order|Orders], [Colours_order|Colours_orders]) :-
	order_colours(Order, Colours_order),
	create_colours_orders(Orders, Colours_orders).

% ----------
	% introduit les couleurs dans l'ordre des couleurs
order_colours(Order, [Color|Order_colours]) :-
	colours([Color|Colors]),
	order_colours2(Colors, Order, Order_colours).

% ----------
order_colours2([], [], []) :-
	!.

order_colours2([Color|Colors], [Op|Ops], [Op, Color|Order_colours]) :-
	order_colours2(Colors, Ops, Order_colours).

% ----------
	% associe a chaque somme un ordre
create_instances([], _Orders, []) :-
	!.

create_instances([Sum|Sums], Orders, Sums_orders) :-
	create_sum_orders(Orders, Sum, Sum_orders),
	create_instances(Sums, Orders, Sums_orders1),
	append(Sum_orders, Sums_orders1, Sums_orders).

% ----------
	% associe chaque Order a Sum
create_sum_orders([], _Sum, []) :-
	!.

create_sum_orders([Order|Orders], Sum, [instance(Sum, Order)|Sums_orders]) :-
	create_sum_orders(Orders, Sum, Sums_orders).
	
% ----------
create_order(Order) :-
	create_order2([=,<], 3, Order).

% ----------
	% cree une combinaison de 3 ordres de couleurs
create_order2(_Operateurs, 0, []) :-
	!.

create_order2(Operateurs, N, [Op|Order1]) :-
	member(Op, Operateurs),
	N1 is N-1,
	create_order2(Operateurs, N1, Order1).

% ----------
	% compte le nombre d'egalites dans un enonce
nb_equalities(Instance, Nb_equalities) :-
	simplify_instance(Instance, instance(_Sum, Operators)),
	count_equalities(Operators, Nb_equalities).

% ----------
count_equalities([], 0).

count_equalities([=|Operators], Nb_equalities) :-
	count_equalities(Operators, Nb_equalities1),
	Nb_equalities is Nb_equalities1 + 1.

count_equalities([_|Operators], Nb_equalities) :-
	count_equalities(Operators, Nb_equalities).

% ----------
configure_xpce :-
	assertz(file_search_path(library,pce('prolog/lib'))),
	assertz(file_search_path(pce,swi(xpce))),
	use_module(library(pce)).

/* ================================== LECTURE =============================== */

% ----------
get_ordre_couleurs2(Ordre_couleurs, Couleurs, Operateurs) :-
	lire_string('entrer un ordre de couleurs, ex) r<g=y<b', Ordre),
	check_ordre_couleurs(Ordre, Couleurs, Operateurs, Ordre_couleurs1),
	modif_ordre_couleurs(Ordre_couleurs1, Ordre_couleurs).

% ----------
check_ordre_couleurs(Ordre, Couleurs, Operateurs, Ordre_couleurs) :-
	string_vers_liste(Ordre, Ordre_couleurs),
	check(Ordre_couleurs, couleur, Couleurs, Operateurs),
	!.

check_ordre_couleurs(_Ordre, Couleurs, Operateurs, Ordre_couleurs) :-
	get_ordre_couleurs2(Ordre_couleurs, Couleurs, Operateurs).

% ----------
check([], _Mode, _Couleurs, _Operateurs) :-
	!.

check([Couleur|Ordre], couleur, Couleurs, Operateurs) :-
	(
		select(Couleur, Couleurs, Couleurs1)
			-> 
				check(Ordre, operateur, Couleurs1, Operateurs)
			;  
				write(Couleur),
			   	write(' n''est pas dans '),
				write(Couleurs),
				writeln(' !'),
				!,
				fail
	).

check([Operateur|Ordre], operateur, Couleurs, Operateurs) :-
	(
		member(Operateur, Operateurs)
			-> 
				check(Ordre, couleur, Couleurs, Operateurs)
			;  
				write(Operateur),
			   	write(' n''est pas dans '),
				write(Operateurs),
				writeln(' !'),
				!,
				fail
	).

/* =============================== DIVERS =================================== */

% ----------
modif_ordre_couleurs([], []) :-
	!.

modif_ordre_couleurs([Operateur|Ordre_couleurs], [Operateur|Ordre_couleurs1]) :-
	member(Operateur, [<,=]),
	!,
	modif_ordre_couleurs(Ordre_couleurs, Ordre_couleurs1).

modif_ordre_couleurs([Couleur|Ordre_couleurs], [Couleur1|Ordre_couleurs1]) :-
	modif_couleur(Couleur, Couleur1),
	modif_ordre_couleurs(Ordre_couleurs, Ordre_couleurs1).

% ----------
modif_couleurs([], []) :-
	!.

modif_couleurs([Couleur|Couleurs], [Couleur1|Couleurs1]) :-
	modif_couleur(Couleur, Couleur1),
	modif_couleurs(Couleurs, Couleurs1).

% ----------
modif_couleur(r, red) :-
	!.

modif_couleur(b, blue) :-
	!.

modif_couleur(y, yellow) :-
	!.

modif_couleur(g, green).

% ----------
string_vers_liste(S, Liste) :-
	re_replace("\\s+"/g, "", S, S0),
    re_split("([<>=+-])", S0, Parts, [include_delimiters(true)]),
    maplist(string_to_atom, Parts, Liste).
	

% ----------
	% retourne les couleurs presentes dans l'enonce
get_couleurs_enonce([], []) :-
	!.

get_couleurs_enonce([Op|Ordre_couleurs], Couleurs) :-
	member(Op, [<, =]),
	!,
	get_couleurs_enonce(Ordre_couleurs, Couleurs).

get_couleurs_enonce([Couleur|Ordre_couleurs], [Couleur|Couleurs]) :-
	get_couleurs_enonce(Ordre_couleurs, Couleurs).

% ----------
get_ordre_couleurs(Ordre_couleurs) :-
	get_couleurs2([blue, green, red, yellow], couleur, Ordre_couleurs).

% ----------

get_couleurs2([Couleur], couleur, [Couleur]) :-
	!.

get_couleurs2(Couleurs, couleur, [Couleur|Ordre_couleurs]) :-
	!,
	read_couleur(Couleurs, Couleur),
	select(Couleur, Couleurs, Couleurs1),
	get_couleurs2(Couleurs1, operateur, Ordre_couleurs).

get_couleurs2(Couleurs, operateur, [Operateur|Ordre_couleurs]) :-
	read_operateur([<, =], Operateur),
	get_couleurs2(Couleurs, couleur, Ordre_couleurs).

% ----------
read_couleur(Couleurs, Couleur) :-
	write('entrer un couleur parmi '),
	writeln(Couleurs),
	lire_atome(Couleur1),
	(
		member(Couleur1, Couleurs)
			-> Couleur = Couleur1
			; 
				write(Couleur1),
				write(' n''est pas dans '),
				writeln(Couleurs),
				read_couleur(Couleurs, Couleur)
	).

% ----------
read_operateur(Operateurs, Operateur) :-
	write('entrer un operateur parmi '),
	writeln(Operateurs),
	lire_atome(Operateur1),
	(
		member(Operateur1, Operateurs)
			-> Operateur = Operateur1
			; 
				write(Operateur1),
				write(' n''est pas dans '),
				writeln(Operateurs),
				read_operateur(Operateurs, Operateurs)
	).
	
% ----------
get_somme(Somme) :-
	lire_entier('pour la somme entrer une valeur entre 4 et 40 : ', Somme1),
	check_somme(Somme1, Somme).

% ----------
check_somme(S, Somme) :-
	S < 4,
	!,
	writeln('la somme est inferieure a 4 '),
	get_somme(Somme).

check_somme(S, Somme) :-
	S > 40,
	!,
	writeln('la somme est superieure a 40 '),
	get_somme(Somme).

check_somme(Somme, Somme).

% ----------
lire_entier(Message, N) :-
    write(Message),
    flush_output(current_output),
    read_line_to_string(user_input, S),
    number_string(N, S).

% ----------
lire_string(Message, S) :-
	write(Message),
	write(' : '),
	lire_string(S).

% ----------
lire_string(S) :-
	flush_output(current_output),
    read_line_to_string(user_input, S).

% ----------
lire_atome(Atome) :-
	flush_output(current_output),
    read_line_to_string(user_input, String),
    atom_string(Atome, String).

/* =============================== AFFICHAGE ================================ */

% ----------
affiche_solutions(Solutions, Solutions_no_place) :-
	nl, 
	writeln('solutions avec cartes placees : '),
	liste:display_liste(Solutions),
	nl,
	nl,
	writeln('solutions sans placement : '),
	liste:display_liste(Solutions_no_place).

% ----------
affiche_somme(Somme) :-
	write('somme         : '),
	writeln(Somme).

% ----------
affiche_ordre_couleurs(Ordre_couleurs) :-
	write('ordre couleurs : '),
 	display_elements(Ordre_couleurs).

% ----------
display_elements([]) :-
	!,
	nl.

display_elements([X|L]) :-
	write(X),
	write(' '),
	display_elements(L).

% ----------
colours([blue, green, red, yellow]).

/* ================================ DIVERS ================================== */

% ----------
	% simplification d'une enonce en retirant les couleurs 
	% de l'ordre des couleurs
simplify_instance(instance(Sum, Order), instance(Sum, Simplified_order)) :-
	simplify_order(Order, Simplified_order).

% ----------
simplify_order(Order, Simplified_order) :-
	atom_chars(Order, Order1),
	delete_colours(Order1, Simplified_order).

% ----------
delete_colours([], []) :-
	!.

delete_colours([C|Chars], Chars1) :-
	member(C, ['b', 'g', 'r', 'y']),
	!,
    delete_colours(Chars, Chars1).

delete_colours([C|Chars], [C|Chars1]) :-
    delete_colours(Chars, Chars1).

/* =============== DIFFICULTES PRE-CALCULEES DES ENONCES ==================== */

% sans prendre en compte les positions

% ----------
	% 3 types de difficulte
difficultes_enonces(3,
	[
		q(easy, 
			[
				e(instance(4,[=,=,=]),1),
				e(instance(5,[=,=,<]),1),
				e(instance(6,[=,=,<]),1),
				e(instance(6,[=,<,=]),1),
				e(instance(7,[=,=,<]),1),
				e(instance(7,[=,<,<]),1),
				e(instance(7,[<,=,=]),1),
				e(instance(8,[=,=,=]),1),
				e(instance(8,[=,=,<]),1),
				e(instance(8,[=,<,=]),1),
				e(instance(8,[=,<,<]),1),
				e(instance(8,[<,=,<]),1),
				e(instance(9,[<,=,<]),1),
				e(instance(9,[<,<,=]),1),
				e(instance(10,[<,=,=]),1),
				e(instance(10,[<,=,<]),1),
				e(instance(10,[<,<,<]),1),
				e(instance(11,[<,=,=]),1),
				e(instance(11,[<,<,=]),1),
				e(instance(11,[<,<,<]),1),
				e(instance(12,[=,=,=]),1),
				e(instance(12,[<,<,=]),1),
				e(instance(13,[<,=,=]),1),
				e(instance(14,[<,=,=]),1),
				e(instance(14,[<,<,=]),1),
				e(instance(15,[<,=,=]),1),
				e(instance(16,[=,=,=]),1),
				e(instance(16,[<,=,=]),1),
				e(instance(17,[<,=,=]),1),
				e(instance(18,[<,=,=]),1),
				e(instance(20,[=,=,=]),1),
				e(instance(20,[=,=,<]),1),
				e(instance(20,[<,=,=]),1),
				e(instance(21,[<,=,=]),1),
				e(instance(23,[=,=,<]),1),
				e(instance(24,[=,=,=]),1),
				e(instance(24,[=,=,<]),1),
				e(instance(24,[<,=,=]),1),
				e(instance(26,[=,=,<]),1),
				e(instance(27,[=,=,<]),1),
				e(instance(28,[=,=,=]),1),
				e(instance(28,[=,=,<]),1),
				e(instance(29,[=,=,<]),1),
				e(instance(30,[=,=,<]),1),
				e(instance(30,[=,<,<]),1),
				e(instance(31,[=,=,<]),1),
				e(instance(32,[=,=,=]),1),
				e(instance(32,[=,<,<]),1),
				e(instance(33,[=,=,<]),1),
				e(instance(33,[=,<,<]),1),
				e(instance(33,[<,<,<]),1),
				e(instance(34,[=,=,<]),1),
				e(instance(34,[<,=,<]),1),
				e(instance(34,[<,<,<]),1),
				e(instance(35,[=,<,<]),1),
				e(instance(35,[<,=,<]),1),
				e(instance(36,[=,=,=]),1),
				e(instance(36,[=,<,=]),1),
				e(instance(36,[<,=,=]),1),
				e(instance(36,[<,=,<]),1),
				e(instance(36,[<,<,=]),1),
				e(instance(37,[=,=,<]),1),
				e(instance(37,[<,=,=]),1),
				e(instance(37,[<,<,=]),1),
				e(instance(38,[=,<,=]),1),
				e(instance(38,[<,=,=]),1),
				e(instance(39,[<,=,=]),1),
				e(instance(40,[=,=,=]),1)
			]
		),

		q(intermediary,
			[
				e(instance(9,[=,=,<]),2),
				e(instance(9,[=,<,<]),2),
				e(instance(10,[=,=,<]),2),
				e(instance(10,[=,<,=]),2),
				e(instance(10,[=,<,<]),2),
				e(instance(11,[=,=,<]),2),
				e(instance(11,[<,=,<]),2),
				e(instance(12,[=,=,<]),2),
				e(instance(12,[=,<,=]),2),
				e(instance(12,[<,<,<]),2),
				e(instance(13,[<,<,=]),2),
				e(instance(14,[=,=,<]),2),
				e(instance(15,[=,=,<]),2),
				e(instance(16,[=,=,<]),2),
				e(instance(16,[<,<,=]),2),
				e(instance(17,[=,=,<]),2),
				e(instance(18,[=,=,<]),2),
				e(instance(19,[=,=,<]),2),
				e(instance(19,[<,=,=]),2),
				e(instance(21,[=,=,<]),2),
				e(instance(22,[=,=,<]),2),
				e(instance(22,[<,=,=]),2),
				e(instance(23,[<,=,=]),2),
				e(instance(25,[=,=,<]),2),
				e(instance(25,[<,=,=]),2),
				e(instance(26,[<,=,=]),2),
				e(instance(27,[<,=,=]),2),
				e(instance(28,[=,<,<]),2),
				e(instance(28,[<,=,=]),2),
				e(instance(29,[<,=,=]),2),
				e(instance(30,[<,=,=]),2),
				e(instance(31,[=,<,<]),2),
				e(instance(32,[=,<,=]),2),
				e(instance(32,[<,=,=]),2),
				e(instance(32,[<,<,<]),2),
				e(instance(33,[<,=,=]),2),
				e(instance(33,[<,=,<]),2),
				e(instance(34,[=,<,=]),2),
				e(instance(34,[<,=,=]),2),
				e(instance(34,[<,<,=]),2),
				e(instance(35,[<,=,=]),2),
				e(instance(35,[<,<,=]),2),
				e(instance(12,[<,=,<]),3),
				e(instance(13,[=,=,<]),3),
				e(instance(13,[<,=,<]),3),
				e(instance(13,[<,<,<]),3),
				e(instance(14,[=,<,=]),3),
				e(instance(15,[<,<,=]),3),
				e(instance(16,[=,<,=]),3),
				e(instance(18,[<,<,=]),3),
				e(instance(26,[=,<,<]),3),
				e(instance(28,[=,<,=]),3),
				e(instance(29,[=,<,<]),3),
				e(instance(30,[=,<,=]),3),
				e(instance(31,[<,=,=]),3),
				e(instance(31,[<,=,<]),3),
				e(instance(31,[<,<,<]),3),
				e(instance(32,[<,=,<]),3),
				e(instance(11,[=,<,<]),4),
				e(instance(12,[=,<,<]),4),
				e(instance(14,[<,=,<]),4),
				e(instance(17,[<,<,=]),4),
				e(instance(18,[=,<,=]),4),
				e(instance(20,[=,<,=]),4),
				e(instance(20,[<,<,=]),4),
				e(instance(24,[=,<,=]),4),
				e(instance(24,[=,<,<]),4),
				e(instance(26,[=,<,=]),4),
				e(instance(27,[=,<,<]),4),
				e(instance(30,[<,=,<]),4),
				e(instance(32,[<,<,=]),4),
				e(instance(33,[<,<,=]),4)
			]
		),
		q(difficult,
			[
				e(instance(14,[<,<,<]),5),
				e(instance(15,[<,=,<]),5),
				e(instance(16,[<,=,<]),5),
				e(instance(19,[<,<,=]),5),
				e(instance(22,[=,<,=]),5),
				e(instance(22,[=,<,<]),5),
				e(instance(22,[<,<,=]),5),
				e(instance(25,[=,<,<]),5),
				e(instance(28,[<,=,<]),5),
				e(instance(29,[<,=,<]),5),
				e(instance(30,[<,<,<]),5),
				e(instance(13,[=,<,<]),6),
				e(instance(14,[=,<,<]),6),
				e(instance(15,[<,<,<]),6),
				e(instance(17,[<,=,<]),6),
				e(instance(18,[<,=,<]),6),
				e(instance(19,[<,=,<]),6),
				e(instance(22,[<,=,<]),6),
				e(instance(25,[<,=,<]),6),
				e(instance(26,[<,=,<]),6),
				e(instance(27,[<,=,<]),6),
				e(instance(29,[<,<,<]),6),
				e(instance(30,[<,<,=]),6),
				e(instance(31,[<,<,=]),6),
				e(instance(16,[=,<,<]),7),
				e(instance(18,[=,<,<]),7),
				e(instance(20,[=,<,<]),7),
				e(instance(20,[<,=,<]),7),
				e(instance(21,[<,=,<]),7),
				e(instance(21,[<,<,=]),7),
				e(instance(23,[=,<,<]),7),
				e(instance(23,[<,=,<]),7),
				e(instance(24,[<,=,<]),7),
				e(instance(24,[<,<,=]),7),
				e(instance(26,[<,<,=]),7),
				e(instance(28,[<,<,=]),7),
				e(instance(15,[=,<,<]),8),
				e(instance(21,[=,<,<]),8),
				e(instance(23,[<,<,=]),8),
				e(instance(29,[<,<,=]),8),
				e(instance(16,[<,<,<]),9),
				e(instance(17,[=,<,<]),9),
				e(instance(19,[=,<,<]),9),
				e(instance(25,[<,<,=]),9),
				e(instance(27,[<,<,=]),9),
				e(instance(28,[<,<,<]),9),
				e(instance(17,[<,<,<]),10),
				e(instance(27,[<,<,<]),10),
				e(instance(18,[<,<,<]),13),
				e(instance(26,[<,<,<]),13),
				e(instance(19,[<,<,<]),14),
				e(instance(25,[<,<,<]),14),
				e(instance(20,[<,<,<]),16),
				e(instance(21,[<,<,<]),16),
				e(instance(23,[<,<,<]),16),
				e(instance(24,[<,<,<]),16),
				e(instance(22,[<,<,<]),18)
			]
		)
	]
).

% ---------- 
	% 5 types de difficultes
difficultes_enonces(5,
	[
		q(very_easy,
			[
				e(instance(4,[=,=,=]),1),
				e(instance(5,[=,=,<]),1),
				e(instance(6,[=,=,<]),1),
				e(instance(6,[=,<,=]),1),
				e(instance(7,[=,=,<]),1),
				e(instance(7,[=,<,<]),1),
				e(instance(7,[<,=,=]),1),
				e(instance(8,[=,=,=]),1),
				e(instance(8,[=,=,<]),1),
				e(instance(8,[=,<,=]),1),
				e(instance(8,[=,<,<]),1),
				e(instance(8,[<,=,<]),1),
				e(instance(9,[<,=,<]),1),
				e(instance(9,[<,<,=]),1),
				e(instance(10,[<,=,=]),1),
				e(instance(10,[<,=,<]),1),
				e(instance(10,[<,<,<]),1),
				e(instance(11,[<,=,=]),1),
				e(instance(11,[<,<,=]),1),
				e(instance(11,[<,<,<]),1),
				e(instance(12,[=,=,=]),1),
				e(instance(12,[<,<,=]),1),
				e(instance(13,[<,=,=]),1),
				e(instance(14,[<,=,=]),1),
				e(instance(14,[<,<,=]),1),
				e(instance(15,[<,=,=]),1),
				e(instance(16,[=,=,=]),1),
				e(instance(16,[<,=,=]),1),
				e(instance(17,[<,=,=]),1),
				e(instance(18,[<,=,=]),1),
				e(instance(20,[=,=,=]),1),
				e(instance(20,[=,=,<]),1),
				e(instance(20,[<,=,=]),1),
				e(instance(21,[<,=,=]),1),
				e(instance(23,[=,=,<]),1),
				e(instance(24,[=,=,=]),1),
				e(instance(24,[=,=,<]),1),
				e(instance(24,[<,=,=]),1),
				e(instance(26,[=,=,<]),1),
				e(instance(27,[=,=,<]),1),
				e(instance(28,[=,=,=]),1),
				e(instance(28,[=,=,<]),1),
				e(instance(29,[=,=,<]),1),
				e(instance(30,[=,=,<]),1),
				e(instance(30,[=,<,<]),1),
				e(instance(31,[=,=,<]),1),
				e(instance(32,[=,=,=]),1),
				e(instance(32,[=,<,<]),1),
				e(instance(33,[=,=,<]),1),
				e(instance(33,[=,<,<]),1),
				e(instance(33,[<,<,<]),1),
				e(instance(34,[=,=,<]),1),
				e(instance(34,[<,=,<]),1),
				e(instance(34,[<,<,<]),1),
				e(instance(35,[=,<,<]),1),
				e(instance(35,[<,=,<]),1),
				e(instance(36,[=,=,=]),1),
				e(instance(36,[=,<,=]),1),
				e(instance(36,[<,=,=]),1),
				e(instance(36,[<,=,<]),1),
				e(instance(36,[<,<,=]),1),
				e(instance(37,[=,=,<]),1),
				e(instance(37,[<,=,=]),1),
				e(instance(37,[<,<,=]),1),
				e(instance(38,[=,<,=]),1),
				e(instance(38,[<,=,=]),1),
				e(instance(39,[<,=,=]),1),
				e(instance(40,[=,=,=]),1)
			]
		),
		q(easy,
			[
				e(instance(9,[=,=,<]),2),
				e(instance(9,[=,<,<]),2),
				e(instance(10,[=,=,<]),2),
				e(instance(10,[=,<,=]),2),
				e(instance(10,[=,<,<]),2),
				e(instance(11,[=,=,<]),2),
				e(instance(11,[<,=,<]),2),
				e(instance(12,[=,=,<]),2),
				e(instance(12,[=,<,=]),2),
				e(instance(12,[<,<,<]),2),
				e(instance(13,[<,<,=]),2),
				e(instance(14,[=,=,<]),2),
				e(instance(15,[=,=,<]),2),
				e(instance(16,[=,=,<]),2),
				e(instance(16,[<,<,=]),2),
				e(instance(17,[=,=,<]),2),
				e(instance(18,[=,=,<]),2),
				e(instance(19,[=,=,<]),2),
				e(instance(19,[<,=,=]),2),
				e(instance(21,[=,=,<]),2),
				e(instance(22,[=,=,<]),2),
				e(instance(22,[<,=,=]),2),
				e(instance(23,[<,=,=]),2),
				e(instance(25,[=,=,<]),2),
				e(instance(25,[<,=,=]),2),
				e(instance(26,[<,=,=]),2),
				e(instance(27,[<,=,=]),2),
				e(instance(28,[=,<,<]),2),
				e(instance(28,[<,=,=]),2),
				e(instance(29,[<,=,=]),2),
				e(instance(30,[<,=,=]),2),
				e(instance(31,[=,<,<]),2),
				e(instance(32,[=,<,=]),2),
				e(instance(32,[<,=,=]),2),
				e(instance(32,[<,<,<]),2),
				e(instance(33,[<,=,=]),2),
				e(instance(33,[<,=,<]),2),
				e(instance(34,[=,<,=]),2),
				e(instance(34,[<,=,=]),2),
				e(instance(34,[<,<,=]),2),
				e(instance(35,[<,=,=]),2),
				e(instance(35,[<,<,=]),2)
			]
		),
		q(intermediary,
			[
				e(instance(12,[<,=,<]),3),
				e(instance(13,[=,=,<]),3),
				e(instance(13,[<,=,<]),3),
				e(instance(13,[<,<,<]),3),
				e(instance(14,[=,<,=]),3),
				e(instance(15,[<,<,=]),3),
				e(instance(16,[=,<,=]),3),
				e(instance(18,[<,<,=]),3),
				e(instance(26,[=,<,<]),3),
				e(instance(28,[=,<,=]),3),
				e(instance(29,[=,<,<]),3),
				e(instance(30,[=,<,=]),3),
				e(instance(31,[<,=,=]),3),
				e(instance(31,[<,=,<]),3),
				e(instance(31,[<,<,<]),3),
				e(instance(32,[<,=,<]),3)
			]
		),
		q(difficult,
			[
				e(instance(11,[=,<,<]),4),
				e(instance(12,[=,<,<]),4),
				e(instance(14,[<,=,<]),4),
				e(instance(17,[<,<,=]),4),
				e(instance(18,[=,<,=]),4),
				e(instance(20,[=,<,=]),4),
				e(instance(20,[<,<,=]),4),
				e(instance(24,[=,<,=]),4),
				e(instance(24,[=,<,<]),4),
				e(instance(26,[=,<,=]),4),
				e(instance(27,[=,<,<]),4),
				e(instance(30,[<,=,<]),4),
				e(instance(32,[<,<,=]),4),
				e(instance(33,[<,<,=]),4),
				e(instance(14,[<,<,<]),5),
				e(instance(15,[<,=,<]),5),
				e(instance(16,[<,=,<]),5),
				e(instance(19,[<,<,=]),5),
				e(instance(22,[=,<,=]),5),
				e(instance(22,[=,<,<]),5),
				e(instance(22,[<,<,=]),5),
				e(instance(25,[=,<,<]),5),
				e(instance(28,[<,=,<]),5),
				e(instance(29,[<,=,<]),5),
				e(instance(30,[<,<,<]),5),
				e(instance(13,[=,<,<]),6),
				e(instance(14,[=,<,<]),6),
				e(instance(15,[<,<,<]),6),
				e(instance(17,[<,=,<]),6),
				e(instance(18,[<,=,<]),6),
				e(instance(19,[<,=,<]),6),
				e(instance(22,[<,=,<]),6),
				e(instance(25,[<,=,<]),6),
				e(instance(26,[<,=,<]),6),
				e(instance(27,[<,=,<]),6),
				e(instance(29,[<,<,<]),6),
				e(instance(30,[<,<,=]),6),
				e(instance(31,[<,<,=]),6)
			]
		),
		q(very_difficult,
			[
				e(instance(16,[=,<,<]),7),
				e(instance(18,[=,<,<]),7),
				e(instance(20,[=,<,<]),7),
				e(instance(20,[<,=,<]),7),
				e(instance(21,[<,=,<]),7),
				e(instance(21,[<,<,=]),7),
				e(instance(23,[=,<,<]),7),
				e(instance(23,[<,=,<]),7),
				e(instance(24,[<,=,<]),7),
				e(instance(24,[<,<,=]),7),
				e(instance(26,[<,<,=]),7),
				e(instance(28,[<,<,=]),7),
				e(instance(15,[=,<,<]),8),
				e(instance(21,[=,<,<]),8),
				e(instance(23,[<,<,=]),8),
				e(instance(29,[<,<,=]),8),
				e(instance(16,[<,<,<]),9),
				e(instance(17,[=,<,<]),9),
				e(instance(19,[=,<,<]),9),
				e(instance(25,[<,<,=]),9),
				e(instance(27,[<,<,=]),9),
				e(instance(28,[<,<,<]),9),
				e(instance(17,[<,<,<]),10),
				e(instance(27,[<,<,<]),10),
				e(instance(18,[<,<,<]),13),
				e(instance(26,[<,<,<]),13),
				e(instance(19,[<,<,<]),14),
				e(instance(25,[<,<,<]),14),
				e(instance(20,[<,<,<]),16),
				e(instance(21,[<,<,<]),16),
				e(instance(23,[<,<,<]),16),
				e(instance(24,[<,<,<]),16),
				e(instance(22,[<,<,<]),18)
			]
		)
	]
).

/* =============================== FIN LISTING ============================== */ 
