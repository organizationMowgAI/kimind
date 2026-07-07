#!/usr/bin/env swipl

/* ========================================================================== */
/*                             GERE UN COUP KIMIND                            */
/* ========================================================================== */

:- module(
          coup, 
          [
		    cartes_vers_coups/2,
			cartes_vers_coups_joues/2,
		    get_coup_clavier/2
          ]
		 ).
		 

% ----------
	% transforme la liste des cartes jouees en liste de coups
	% conserve toutes les informations initiales
cartes_vers_coups_joues(Cartes, Coups) :-
	cartes_vers_coups_joues2(Cartes, 1, [], Coups).

% ----------
cartes_vers_coups_joues2([], _N, [], []) :-
	!.

cartes_vers_coups_joues2([], N, Cartes_jouees, [coup(N, Cartes_jouees)]) :-
	!.

	% on retrouve une carte d'une position deja joue => coup suivant
cartes_vers_coups_joues2([c(Couleur, Valeur, Position, T, RC, RV)|Cartes], 
				   N, Cartes_jouees, [coup(N, Cartes_jouees)|Coups]) :-
	member(c(Position, _Coul, _Val, _T, _RC, _RV), Cartes_jouees),
	!,
	N1 is N + 1,
	cartes_vers_coups_joues2(Cartes, N1, 
							 [c(Position, Couleur,Valeur, T, RC, RV)], 
							 Coups).

	% coup en cours
cartes_vers_coups_joues2([c(Couleur, Valeur, Position, T, RC, RV)|Cartes], 
				   N, Cartes_jouees, Coups) :-
	append(Cartes_jouees, [c(Position, Couleur, Valeur, T, RC,RV)], 
		   Cartes_jouees1),
	cartes_vers_coups_joues2(Cartes, N, Cartes_jouees1, Coups).

% ----------
	% transforme la liste des cartes jouees en liste de coups
cartes_vers_coups(Cartes, Coups) :-
	cartes_vers_coups2(Cartes, 1, [], Coups).

% ----------
cartes_vers_coups2([], _N, [], []) :-
	!.

cartes_vers_coups2([], N, Cartes_jouees, [coup(N, Cartes_jouees)]) :-
	!.

	% on retrouve une carte d'une position deja joue => coup suivant
cartes_vers_coups2([c(Couleur, Valeur, Position, _T, _RC, _RV)|Cartes], 
				   N, Cartes_jouees, [coup(N, Cartes_jouees)|Coups]) :-
	member(c(Position, _Coul, _Val), Cartes_jouees),
	!,
	N1 is N + 1,
	cartes_vers_coups2(Cartes, N1, [c(Position, Couleur,Valeur)], Coups).

	% coup en cours
cartes_vers_coups2([c(Couleur, Valeur, Position, _T, _RC, _RV)|Cartes], 
				   N, Cartes_jouees, Coups) :-
	append(Cartes_jouees, [c(Position, Couleur, Valeur)], Cartes_jouees1),
	cartes_vers_coups2(Cartes, N, Cartes_jouees1, Coups).

 % ---------- 
get_coup_clavier(Cartes, Coup) :-
    nl,
    writeln('Entrez votre coup :'),
    couleurs(Couleurs),
    get_coup_clavier2(Cartes, Couleurs, Coup).
    
% ---------- 
    % demande a l'utilisateur d'entrer un coup
get_coup_clavier2([], _Couleurs, []) :-
    !.
    
get_coup_clavier2([Carte|Cartes], Couleurs, [Carte1|Cartes1]) :-
    get_coup_carte(Carte, Couleurs, Carte1, Couleurs1),
    get_coup_clavier2(Cartes, Couleurs1, Cartes1).
    
% ----------
get_coup_carte(c(Position, _Code_couleur, _Valeur), Couleurs, 
               c(Position, Couleur_jouee, Valeur_jouee), Couleurs1) :-
    nl,
    write('position    : '),
    writeln(Position),
    read_couleur(Couleurs, Couleur_jouee),
    select(Couleur_jouee, Couleurs, Couleurs1),
    read_valeur(Valeur_jouee).

% ---------
read_couleur(Couleurs, Couleur_jouee) :-
    % kimind_bk_contraintes:domaine_couleur(Code_couleur, Couleurs),
    write('entrez la premiere lettre de la couleur parmi '),
    writeln(Couleurs),
    get_single_char(Code),
    char_code(Char, Code),
    (
        (lit_couleur(Char, Couleur1), member(Couleur1, Couleurs)) 
        -> 
             Couleur_jouee = Couleur1
         ; 
            write('couleur non repertoriee dans '),
            writeln(Couleurs),
            writeln('entrez une nouvelle couleur '),
            read_couleur(_Couleur1, Couleurs, Couleur_jouee)
    ).
                
% ----------    
read_valeur(Valeur) :-
    valeurs(Valeurs),
    write('valeur parmi '),
    write(Valeurs),
    writeln(' (taper 0 pour 10) ? '),
    get_single_char(Code),
    lit_valeur(Code, Valeur1),
    (
        member(Valeur1, Valeurs)
         -> Valeur = Valeur1
         ; 
            write(Valeur1),
            write(' n''est pas dans '),
            writeln(Valeurs),
            writeln('entrez une nouvelle valeur '),
            read_valeur(Valeurs, Valeur)
    ).
    
% ----------
prefixes_couleurs([], []) :-
    !.
    
prefixes_couleurs([Couleur|Couleurs], [Couleur1|Couleurs1]) :-
    prefixe_atom(Couleur, Couleur1),
    prefixes_couleurs(Couleurs, Couleurs1).
    
% ----------
    % entoure la premiere lettre de Atom avec des parentheses
prefixe_atom(Atom, Atom2) :-
    atom_codes(Atom, [P|Codes]),
    atom_codes(PA, [P]),
    atom_concat('(', PA, P1),
    atom_concat(P1, ')', Prefix),
    atom_codes(Atom1, Codes),
    atom_concat(Prefix, Atom1, Atom2).    
    
% ----------
lit_couleur('g', green) :-
    !.
    
lit_couleur('y', yellow) :-
    !.    
    
lit_couleur('r', red) :-
    !.
    
lit_couleur('b', blue).

% ----------
lit_valeur(48, 10) :-
    !.
    
lit_valeur(Code, Valeur) :-
    char_to_digit(Code, Valeur).

% ----------
char_to_digit(Code, Digit) :-
    Code >= 48, Code =< 57,       % Vérifie que le code ASCII est un chiffre (0-9)
    Digit is Code - 48.  
    
% -------------    
lit_entier(Entier) :-
    read_line_to_string(current_input, S_valeur),
    number_string(Entier, S_valeur).
    
% -------------    
lit_atom(Atom) :-
    read_line_to_string(current_input, S_valeur),
    atom_string(Atom, S_valeur).
    
/* ============================= FIN LISTING ================================ */
