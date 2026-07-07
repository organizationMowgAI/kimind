#!/usr/bin/env swipl

/* ========================================================================== */
/*                     SAISIE AU CLAVIER LE COUP D'UN JOUEUR                  */
/* ========================================================================== */

:- module(
         get_coup_clavier, 
         [
		   get_coup_clavier/2
         ]
		 ).
		 
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
