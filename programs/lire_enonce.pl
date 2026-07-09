% ============================================================================ %
%                       PREDICATS EFFECTUANT LA LECTURE                        %
%                       INTERACTIVE D'UN ENONCE KIMIND                         %
% ============================================================================ %
  
:- module(lire_enonce, 
          [
          	get_enonce/3,
          	get_data/2,
          	get_solution/1
          ]
         ).
 
:-
    use_module(library(clpfd)),
    use_module(liste),
    use_module(fichier).
	
/* ================================ FONCTIONS =============================== */

% ----------
get_data(Somme, Ordre_couleurs) :-
	get_somme(Somme),
	nl,
	nl,
	get_ordre_couleurs2(Ordre_couleurs, [b, r, y, g], [<,=]),
	nl,
	nl.
	
% ----------	
	% demande une solution et retrouve la somme et l'ordre des couleurs
get_enonce(Solution, Somme, Ordre_couleurs) :-
	get_solution(Solution),
	calculer_somme(Solution, Somme),
	recupere_ordre_couleurs(Solution, Ordre_couleurs).
	
% ----------
calculer_somme([], 0) :-
	!.
	
calculer_somme([c(_Pos, _Couleur, Valeur)|Cartes], Somme) :-
	calculer_somme(Cartes, Somme1),
	Somme is Valeur + Somme1.
	
/*
 Somme = 34
 Ordre  = [blue,<,red,<,green,<,yellow]
 Solution =  [c(0, blue, 7), c(1, red, 8), c(2, green, 9), c(3, yellow, 10)]
 */
% ----------
recupere_ordre_couleurs(Cartes, [Couleur|Ordre_couleurs]) :-   
	  sort(3,  @=<, Cartes, [c(_Pos, Couleur, Valeur)|Cartes1]),
	  recupere_ordre_couleurs2(Cartes1, Valeur, Ordre_couleurs).
	  
% ----------
recupere_ordre_couleurs2([], _Valeur, []) :-
	!.
	
	% carte precedente a la meme valeur que la carte courante
recupere_ordre_couleurs2([c(_Pos, Couleur, Valeur)|Cartes], Valeur, 
						 [=, Couleur|Ordre]) :-
	!,
	recupere_ordre_couleurs2(Cartes, Valeur, Ordre).
	
	% carte precedente a valeur inferieure a la carte courante
recupere_ordre_couleurs2([c(_Pos, Couleur, Valeur)|Cartes], _Val_pred, 
						 [<, Couleur|Ordre]) :-
	!,
	recupere_ordre_couleurs2(Cartes, Valeur, Ordre).
	
/* ================================== LECTURE =============================== */

% ----------
get_solution(Solution) :-
	nl,
	writeln('entrer la solution sous la forme '),
	writeln('[c(0, blue, 7), c(1, red, 8), c(2, green, 9), c(3, yellow, 10)].'),
	writeln('(mettre un point (.) a la fin)'),
	read(Solution).

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

/* =============================== FIN LISTING ============================== */ 
