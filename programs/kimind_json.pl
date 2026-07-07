/* ========================================================================== */
/*                   RECUPERE UNE PARTIE DE MASTER MIND ECRITE en JSON        */
/* ========================================================================== */

:- module(
         kimind_json,  
         [
            charge_partie/2,
            charge_parties/2,
            charge_parties/4,
            charge_partie_json/3,
            charge_parties_dir/3
         ]
		 ).

:- use_module(library(http/json)).
:- use_module(library(http/json_convert)).
:- use_module(library(http/http_json)).
:- use_module(divers).

% ----------
    % charge des parties
charge_parties_dir(_Dir, [], []) :-   
    !.
    
charge_parties_dir(Dir, [Fichier|Fichiers], [Partie|Parties]) :-
	directory_file_path(Dir, Fichier, Chemin),
    % atom_concat(Dir, Fichier, Chemin),
    charge_partie(Chemin, Partie),
    charge_parties_dir(Dir, Fichiers, Parties).

% ----------
    % charge des parties qui ont meme prefixe et un numero en suffixe
charge_parties(_Prefix, Numero, Fin, []) :-   
    Numero > Fin,
    !.
    
charge_parties(Prefix, Numero, Fin, [Partie_prolog|Parties_prolog]) :-
    atom_concat(Prefix, Numero, Fichier1),
    atom_concat(Fichier1, '.json', Fichier),
    charge_partie(Fichier, Partie_prolog),
    Numero1 is Numero+1,
    charge_parties(Prefix, Numero1, Fin, Parties_prolog).
    
% ----------
    % charge des parties de Kimind au format Json et les convertit
    % au format interne Prolog 
charge_parties([], []) :-
    !.
        
charge_parties([Partie_json|Parties_json], [Partie_prolog|Parties_prolog]) :-
   charge_partie(Partie_json, Partie_prolog),
   charge_parties(Parties_json, Parties_prolog).

% -------------
    % charge une partie de Kimind
charge_partie(Fichier, Partie_prolog) :-
    open(Fichier, read, File),
    json_read_dict(File, Partie),
	divers:remove_suffix(Fichier, Nom_partie),
    partie_to_prolog(Partie, Nom_partie, Partie_prolog).

% ----------
charge_partie_json(Fichier, Partie) :-
    open(Fichier, read, File),
    json_read_dict(File, Partie),
    close(File).

% ----------
charge_partie_json(Directory, Fichier, Partie) :-
    directory_file_path(Directory, Fichier, Chemin_fichier),
    open(Chemin_fichier, read, File),
    json_read_dict(File, Partie),
    close(File).

% ----------
    % convertit la partie du format json au format prolog
partie_to_prolog(Partie, Nom_partie, partie(
										id(Ident),
				                        nom(Nom_partie),
				                        Jeu,
				                        Nb_cartes,
				                        Couleurs,
				                        Valeurs,
				                        Somme,
				                        Ordre_couleurs,
				                        Solution,
				                        Cartes_jouees,
				                        Resultat
                                )
                 ):-                              
    get_partie(Partie, jeu, Jeu),
    get_partie(Partie, somme, Somme), 
    get_partie(Partie, ordre_couleurs, Ordre_couleurs),
    get_partie(Partie, nb_cartes_jeu, Nb_cartes),
    get_partie(Partie, couleurs_cartes_jeu, Couleurs),
    get_partie(Partie, valeurs_cartes_jeu, Valeurs),
    get_partie(Partie, solution, Solution),
    get_partie(Partie, cartes_jouees, Cartes_jouees),
    get_partie(Partie, resultat, Resultat),
	construit_identifiant(Somme, Ordre_couleurs, Solution, Ident).

% ----------
construit_identifiant(somme(Somme), ordre_couleurs(Ordre_couleurs), 
                      solution(Solution), Ident) :-
	ordre_couleurs_id(Ordre_couleurs, Id_ordre),
	solution_id(Solution, Id_solution),
	atom_concat(Somme, Id_ordre, Id1),
	atom_concat(Id1, Id_solution, Ident).

% ----------
	% forme un identifiant a partir des elements de ordre couleurs
ordre_couleurs_id([Couleur], Couleur) :-
	!.

ordre_couleurs_id([Element|Elements], Id) :-
	ordre_couleurs_id(Elements, Id1),
	atom_concat(Element, Id1, Id).

% ----------
	% forme un identifiant a partir des elements des elements de solution
solution_id([Coup], Id_coup) :-
	coup_id(Coup, Id_coup).

solution_id([Coup|Coups], Id) :-
	solution_id(Coups, Id1),
	coup_id(Coup, Id2),
	atom_concat(Id2, Id1, Id).

%----------
coup_id(c(Position, Couleur, Valeur), Id) :-
	atom_concat(Position, Couleur, Id1),
	atom_concat(Id1, Valeur, Id).

% ----------     
    % recupere les elements de la partie
get_partie(Partie, jeu, jeu(Jeu)) :-
    !,
    atom_string(Jeu, Partie.jeu.type).

get_partie(Partie, nb_cartes_jeu, nb_cartes(Partie.jeu.nb_cartes)) :-
    !.

get_partie(Partie, ident, ident(Partie.ident)) :-
	!.

get_partie(Partie, somme, somme(Partie.jeu.somme)) :-
	!.
	
get_partie(_Partie, somme, somme(rien)) :-
	!.	

get_partie(Partie, ordre_couleurs, ordre_couleurs(Ordre)) :-
    !,
    convertit_ordre_couleurs(Partie.jeu.ordre_couleurs, Ordre). 

get_partie(_Partie, ordre_couleurs, ordre_couleurs([])) :-
    !.

get_partie(Partie, couleurs_cartes_jeu, couleurs(Couleurs)) :-
    !,
    convertit_couleurs(Partie.jeu.couleurs, Couleurs).
    
get_partie(Partie, valeurs_cartes_jeu, valeurs(Partie.jeu.valeurs)) :-
    !.

get_partie(Partie, solution, solution(Solution)) :-
    !,
    convertit_cartes(Partie.solution, Solution).

get_partie(Partie, cartes_jouees, cartes_jouees(Cartes_jouees)) :-
    !,
    convertit_cartes_jouees(Partie.cartes_jouees, Cartes_jouees).

get_partie(Partie, resultat, resultat(Resultat)) :-
    !,
    atom_string(Resultat, Partie.resultat).

% ----------
convertit_ordre_couleurs([], []) :-
    !.
    
convertit_ordre_couleurs([Carte|L], [Color|L1]) :-
    term_string(Atom, Carte),
    Atom =..[carte, Couleur],
    !,
    english_color(Couleur, Color), 
    convertit_ordre_couleurs(L, L1).
    
convertit_ordre_couleurs([Op|L], [Op1|L1]) :-
    atom_string(Op1, Op),
    convertit_ordre_couleurs(L, L1).
  
% ---------- 
english_color(jaune, yellow) :-
    !.
    
english_color(vert, green) :-
    !.
    
english_color(rouge, red) :-
    !.
    
english_color(bleu, blue).
  
    
convertit_couleurs([], []) :-
    !.
    
convertit_couleurs([Couleur|Couleurs], [Couleur1|Couleurs1]) :-
    atom_string(Couleur1, Couleur),
    convertit_couleurs(Couleurs, Couleurs1).
    
% ----------    
convertit_cartes([], []) :-
    !.
    
convertit_cartes([Carte_json|Cartes_json], [Carte|Cartes]) :-
    convert_carte(Carte_json, Carte),
    convertit_cartes(Cartes_json, Cartes).

% ---------- 
convert_carte(Carte_json, 
              c(Carte_json.position, Couleur, Carte_json.valeur)) :-
    atom_string(Couleur, Carte_json.couleur).
    
% ----------    
convertit_cartes_jouees([], []) :-
    !.
    
convertit_cartes_jouees([Carte_json|Cartes_json], [Carte|Cartes]) :-
    convert_to_carte_jouee(Carte_json, Carte),
    convertit_cartes_jouees(Cartes_json, Cartes).
    
% ----------      
convert_to_carte_jouee(Carte_json, 
                       c(Couleur, 
                         Carte_json.valeur, 
                         Carte_json.position,
                         Carte_json.duree, 
                         Couleur_devinee1,
                         Valeur_devinee1)
                      ) :-
    atom_string(Couleur, Carte_json.couleur),
    atom_string(Couleur_devinee, Carte_json.reponse.couleur_devinee),
    convert_atom(Couleur_devinee, Couleur_devinee1),
    atom_string(Valeur_devinee, Carte_json.reponse.valeur_devinee),
    convert_atom(Valeur_devinee, Valeur_devinee1),
    !.
    
convert_to_carte_jouee(Carte_json, 
                       c(Couleur, 
                         Carte_json.valeur, 
                         Carte_json.position,
                         Carte_json.duree, 
                         Couleur_devinee1)
                      ) :-
    atom_string(Couleur, Carte_json.couleur),
    atom_string(Couleur_devinee, Carte_json.reponse.couleur_devinee),
    convert_atom(Couleur_devinee, Couleur_devinee1).

% ----------    
convert_atom(true, oui) :-
    !.
    
convert_atom(false, non) :-
    !.

convert_atom(equals, oui) :-
    !.

convert_atom(more, plus) :-
    !.
    
convert_atom(less, moins).
     
/* ================================= FIN LISTING ============================ */
