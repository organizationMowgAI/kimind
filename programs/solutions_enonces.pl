/* ========================================================================== */
/*                 CALCUL DES SOLUTIONS D'UN ENONCE KIMIND                    */  
/*                  COMPOSE DE SOMME + ORDRE DES COULEURS                     */
/*                                                                            */
/*                           PREDICATS DISPONIBLES :                          */
/*                                                                            */                    
/* -  solutions(Somme, Ordre_couleurs, Nb_solutions, Solutions,               */
/*              Nb_solutions_no_place, Solutions_no_place)                    */
/* 	  calcule les Solutions avec positions et sans positions                  */
/*    d'un enonce Kimind compose de Somme 
% ----------
permute_listes([], []) :-
    !.

permute_listes([L|LL], Permutations) :-
    permute_liste(L, Permutations),
    permute_listes(LL, Permutations1),
    append(Permutations, Permutations1, Permutations).

% ----------
    % donne toutes les permutations de la liste L
permute_liste([X], [[X]]) :-
    !.

    % L contient au moins 2 elements
permute_liste(L, Permutations) :-
    findall(Sol1, select(Elt, Sol, Sol1), L1),
    permute_listes(L1, Permutations1),
    ajoute_elt(Permutations1, Elt, Permutations).

% ----------
    % ajoute Elt a chaque liste 
ajoute_elt([], _Elt, []) :-
    !.

ajoute_elt([L|Ls], Elt, [[Elt|L]|Ls1]) :-
    ajoute_elt(Ls, Elt, Ls1).et Ordre_couleurs                   */
/*    Ordre_couleurs est une liste. ex)                                       */
/*                                                                            */
/* -  get_somme(Somme)                                                        */
/*    saisit une somme au claver (verifie qu'elle est en tre 4 et 40)         */
/*                                                                            */
/* -  get_ordre_couleurs(Ordre_couleurs)                                      */
/*    saisit et retourne un ordre couleur sous la forme d'une liste           */
/*    ex) [r,<,b,<,g,<y]                                                      */
/*                                                                            */
/* -  get_somme_ordre_couleurs(Somme, Ordre_couleurs)                         */
/*    saisit une Somme et un Ordre_couleurs au clavier                        */
/*                                                                            */
/* -  affiche_solutions(Solutions, Solutions_no_place)                        */
/*    affiche proprement les deux ensemble de Solutions                       */	
/* ========================================================================== */

:- module(solutions_enonces,
		  [
			get_somme/1,
			get_ordre_couleurs/1,
			get_somme_ordre_couleurs/2, 

			solutions_enonces_positions/4,
            solutions_enonces/4,

			affiche_solutions/2
		  ]
		  ).

:-
    use_module(library(clpfd)),
    use_module(liste),
    use_module(fonctions_somme).

/* ================================ PREDICATS =============================== */

% ----------
	% calcule les Solutions avec et sans positions d'un enonce Kimind
	% compose de Somme et Ordre_couleurs
/*
solutions(Somme, Ordre_couleurs, Nb_solutions, Solutions, 
          Nb_solutions_no_place, Solutions_no_place) :-
	check_ordre_couleurs2(Ordre_couleurs, [b, r, y, g], [<,=], Ordre_couleurs1),
    initialisation:
    initialisation_enonce(Somme, Ordre_couleurs1, 
                          [blue, green, yellow, red], [1,2,3,4,5,6,7,8,9,10], 
                          4, Cartes), 
	bk_contraintes:calcule_solutions(Cartes, Solutions),
	length(Solutions, Nb_solutions),
	bk_contraintes:solutions_sans_positions2(Solutions, Solutions1),
	sort(Solutions1, Solutions_no_place),
	length(Solutions_no_place, Nb_solutions_no_place).
*/

% ----------
solutions_enonces_positions(Somme, Ordre_couleurs, Nb_solutions, Solutions) :-
    solutions_enonces(Somme, Ordre_couleurs, _Nb, Solutions1),
    permute_listes(Solutions1, Solutions),
    length(Solutions, Nb_solutions).
    
% ----------
    % calcul des solutions (sans positions) sans faire appel au solver
solutions_enonces(Somme, Ordre_couleurs, Nb_solutions, Solutions) :-
    fonctions_somme:solutions_somme(Somme, 4, 1, 10, 
                                    _Nb_sols, Solutions_somme),
    check_ordre_couleurs2(Ordre_couleurs, [b, r, y, g], [<,=], Ordre_couleurs1),
    select_operateurs(Ordre_couleurs1, Operateurs),
    filtre_solutions(Solutions_somme, Operateurs, Solutions1),
    select_couleurs(Ordre_couleurs1, Couleurs),
    cree_solutions_couleurs(Solutions1, Couleurs, Solutions),
    length(Solutions, Nb_solutions).

% ----------
    % selectionne les operateurs dans Ordre_couleurs
select_operateurs([], []) :-
    !.

select_operateurs([Op|Ordre_couleurs], [Op|Operateurs]) :-
    member(Op, [=,<]),
    !,
    select_operateurs(Ordre_couleurs, Operateurs).

select_operateurs([_Couleur|Ordre_couleurs], Operateurs) :-
    select_operateurs(Ordre_couleurs, Operateurs).

% ----------
    % selectionne les operateurs dans Ordre_couleurs
select_couleurs([], []) :-
    !.

select_couleurs([Couleur|Ordre_couleurs], [Couleur|Couleurs]) :-
    \+ member(Couleur, [=,<]),
    !,
    select_couleurs(Ordre_couleurs, Couleurs).

select_couleurs([_Operateur|Ordre_couleurs], Couleurs) :-
    select_couleurs(Ordre_couleurs, Couleurs).

% -----------
    % elimine les solutions ne respectant pas l'ordre des couleurs
    % chaque solution est une liste ordonnée (ordre croissant) de valeurs
filtre_solutions([], _Operateurs, []) :-
    !.

filtre_solutions([Solution|Solutions], Operateurs, [Solution|Solutions1]) :-
    solution_ok(Solution, Operateurs),
    !,
    filtre_solutions(Solutions, Operateurs, Solutions1).

filtre_solutions([_Solution|Solutions], Operateurs, Solutions1) :-
    filtre_solutions(Solutions, Operateurs, Solutions1).

% ----------
    % verifie si Solution respecte les Operateurs
solution_ok(_, []) :-
    !.

solution_ok([X,Y|Solution], [Operateur|Operateurs]) :-
    respecte_operateur(X,Y, Operateur),
    solution_ok([Y|Solution], Operateurs).

% ----------
respecte_operateur(X, Y, <) :-
    !,
    X < Y.

respecte_operateur(X, Y, =) :-
    X == Y.

% ----------
    % cree des solutions a partie des nombres dans Sols et de Couleurs
cree_solutions_couleurs([], _Couleurs, []) :-
    !.

cree_solutions_couleurs([Sol|Sols], Couleurs, [Sol1|Sols1]) :-
    cree_solution_couleurs(Sol, Couleurs, Sol1),
    cree_solutions_couleurs(Sols, Couleurs, Sols1).

% ----------
cree_solution_couleurs([], [], []) :-
    !.

cree_solution_couleurs([Valeur|Valeurs], [Couleur|Couleurs], 
                       [c(Couleur, Valeur)|Solutions]) :-
    cree_solution_couleurs(Valeurs, Couleurs, Solutions).

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

/* ======================== SAISIE ORDRE DES COULEURS ======================= */

% ----------
get_somme_ordre_couleurs(Somme, Ordre_couleurs) :-
	get_somme(Somme),
	nl,
	nl,
	get_ordre_couleurs2(Ordre_couleurs, [b, r, y, g], [<,=]),
	affiche_ordre_couleurs(Ordre_couleurs),
	nl,
	nl.

% ----------
get_ordre_couleurs2(Ordre_couleurs, Couleurs, Operateurs) :-
	lire_string('entrer un ordre de couleurs, ex) r<g=y<b', Ordre),
	check_ordre_couleurs(Ordre, Couleurs, Operateurs, Ordre_couleurs1),
	modif_ordre_couleurs(Ordre_couleurs1, Ordre_couleurs).

% ----------
check_ordre_couleurs2(Ordre_couleurs, Couleurs, Operateurs, Ordre_couleurs2) :-
	check_ordre_couleurs(Ordre_couleurs, Couleurs, Operateurs, Ordre_couleurs1),
	modif_ordre_couleurs(Ordre_couleurs1, Ordre_couleurs2).
	
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
get_ordre_couleurs(Ordre_couleurs) :-
	get_couleurs([blue, green, red, yellow], couleur, Ordre_couleurs).

% ----------
get_couleurs([Couleur], couleur, [Couleur]) :-
	!.

get_couleurs(Couleurs, couleur, [Couleur|Ordre_couleurs]) :-
	!,
	read_couleur(Couleurs, Couleur),
	select(Couleur, Couleurs, Couleurs1),
	get_couleurs(Couleurs1, operateur, Ordre_couleurs).

get_couleurs(Couleurs, operateur, [Operateur|Ordre_couleurs]) :-
	read_operateur([<, =], Operateur),
	get_couleurs(Couleurs, couleur, Ordre_couleurs).

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
	
/* ======================== SAISIT DE LA SOMME ============================== */

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

/* =================================== DIVERS =============================== */
	
% ----------
permute_listes([], []) :-
    !.

permute_listes([L|LL], Permutations) :-
    permute_liste(L, Permutations1),
    permute_listes(LL, Permutations2),
    append(Permutations1, Permutations2, Permutations).

% ----------
    % donne toutes les permutations de la liste L
permute_liste([X], [[X]]) :-
    !.

    % L contient au moins 2 elements
permute_liste(L, Permutations) :-
    findall(e(Elt, L1), select(Elt, L, L1), L1s),
    permute_listes2(L1s, Permutations).

% ----------
permute_listes2([], []) :-
    !.

permute_listes2([e(Elt,L)|Listes], Permutations) :-
    permute_liste(L, Permutations_L),
    ajoute_elt(Permutations_L, Elt, Permutations_L1),
    permute_listes2(Listes, Permutations1),
    append(Permutations_L1, Permutations1, Permutations).

% ----------
    % ajoute Elt a chaque liste 
ajoute_elt([], _Elt, []) :-
    !.

ajoute_elt([L|Ls], Elt, [[Elt|L]|Ls1]) :-
    ajoute_elt(Ls, Elt, Ls1).

% ----------
configure_xpce :-
	assertz(file_search_path(library,pce('prolog/lib'))),
	assertz(file_search_path(pce,swi(xpce))),
	use_module(library(pce)).

/* =============================== FIN LISTING ============================== */ 
