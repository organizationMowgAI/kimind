/* ========================================================================== */
/*                 CALCUL DES SOLUTIONS D'UN ENONCE KIMIND                    */  
/*                  COMPOSE DE SOMME + ORDRE DES COULEURS                     */
/*                                                                            */
/*                           PREDICATS DISPONIBLES :                          */
/*                                                                            */                    
/* -  solutions(Somme, Ordre_couleurs, Nb_solutions, Solutions,               */
/*              Nb_solutions_no_place, Solutions_no_place)                    */
/* 	  calcule les Solutions avec positions et sans positions                  */
/*    d'un enonce Kimind compose de Somme et Ordre_couleurs                   */
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

:- module(solutions,
		  [
			get_somme/1,
			get_ordre_couleurs/1,
			get_somme_ordre_couleurs/2, 
			solutions/6,
			affiche_solutions/2
		  ]
		  ).

:-
    use_module(library(clpfd)),
    use_module(initialisation),
    use_module(kimind_json),
    use_module(partie),
    use_module(liste),
    use_module(bk_contraintes),
    use_module(fichier).

/* ================================ PREDICATS =============================== */

% ----------
	% calcule les Solutions avec et sans positions d'un enonce Kimind
	% compose de Somme et Ordre_couleurs
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
configure_xpce :-
	assertz(file_search_path(library,pce('prolog/lib'))),
	assertz(file_search_path(pce,swi(xpce))),
	use_module(library(pce)).

/* =============================== FIN LISTING ============================== */ 
