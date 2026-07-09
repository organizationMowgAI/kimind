/* ========================================================================== */
/*                       GERE PARTIE KIMIND (format prolog)                   */
/* ========================================================================== */
 
:- module(
        partie, 
         [ 
			recupere_partie/3,         
            get_partie_prolog/3,
			get_partie_prolog2/3,
			get_partie_prolog3/3,
			get_partie_prolog4/3,
          
            assert_partie2/3,
			assert_partie/2,
            sauvegarde_partie_enrichie/3,
            sauvegarde_partie_json_enrichie/3,

			lit_parties/4,
			lit_parties_dir/3,
			lit_partie/3,

            construit_identifiant/4,
			construit_identifiant_prolog/4
         ]
		 ).

:- 
    use_module(kimind_prolog),
    use_module(library(http/json)),
    use_module(library(http/json_convert)),
    use_module(library(http/http_json)),
    use_module(divers).
	 
% ----------
recupere_partie(Fichier, 
				Module, 
				 partie(
						ident(N, Ident),
						joueur(N,Joueur),
						partie(N, Partie),
						somme(N, Somme_cartes),
						ordre_couleurs(N,Ordre_couleurs),
						solution(N, Solution),
						cartes_jouees(Cartes_jouees),
						resultat(Resultat) 
                    )
                ) :-
	Module:numero(Fichier, N),
	Module:ident(N, Ident),
	Module:joueur(N,Joueur),
	Module:partie(N, Partie),
    Module:somme(N, Somme_cartes),
    Module:ordre_couleurs(N,Ordre_couleurs),
    Module:solution(N, Solution),
    Module:cartes_jouees(N, Cartes_jouees),
    Module:resultat(N, Resultat).
	
% ----------		
    % ecrit la partie dans un module prolog
assert_partie2(Fichier, 
              partie(
                     joueur(N,Joueur),
                     Partie,
                     Somme_cartes,
                     Ordre_couleurs,
                     Solution,
                     Cartes_jouees,
                     Resultat
                    ),
              Module
              ) :-
	construit_identifiant(Somme_cartes, Ordre_couleurs, Solution, Ident),
	Module:assert(numero(Fichier, N)),
	Module:assert(Ident),
	Module:assert(joueur(N,Joueur)),
	Module:assert(Partie),
    Module:assert(Somme_cartes),
    Module:assert(Ordre_couleurs),
    Module:assert(Solution),
    Module:assert(Cartes_jouees),
    Module:assert(Resultat),
	Module:assert(domaines([])),
	Module:assert(contraintes([])).

% ----------
lit_parties_dir([], _Dir, []) :-
	!.

lit_parties_dir([Fichier|Fichiers], Dir, [Partie|Parties]) :-
	lit_partie(Dir, Fichier, Partie),
	lit_parties_dir(Fichiers, Dir, Parties).

% ----------
lit_parties([], _N, _Joueur, []) :-
	!.

lit_parties([Fichier|Fichiers], N, Joueur, [Partie1|Parties]) :-
	lit_partie(Fichier, Partie),
	Partie =..[Pred|Args],
	Partie1 =..[Pred|[N, Joueur|Args]],
	assert(Partie1),
	N1 is N + 1,
	lit_parties(Fichiers, N1, Joueur, Parties).

% ----------
	% Pour les cas où les parties sont déjà sous forme d'atome
lit_partie(Directory, Fichier, Partie) :-
	directory_file_path(Directory, Fichier, Nom_partie),
	open(Nom_partie, read, File),
	read(File, Partie),
	Partie = partie(_, _, _, _, _, _, _, _),			% Si on peut unifier la ligne comme ça, c'est que c'est au format d'atome
	!,
	close(File).

% ----------
lit_partie(Directory,
           Fichier, 
				  partie(
				             Identifiant,
							 Joueur,
							 Partie,
				             Somme_cartes,
				             Ordre_couleurs,
				             Solution,
				             Cartes_jouees,
				             Resultat
                       	)
                 ) :-
	directory_file_path(Directory, Fichier, Nom_partie),
	open(Nom_partie, read, File),
	read(File, Identifiant),
	read(File, Joueur),
	read(File, Partie),
	read(File, Somme_cartes),
	read(File, Ordre_couleurs),
	read(File, Solution),
	read(File, Cartes_jouees),
	read(File, Resultat),
	close(File).

% ----------
sauvegarde_partie_enrichie(Destination, Fichier, Partie) :-			  
        % constitution du nom du fichier enrichi
	atom_concat(Nom, '.pl', Fichier),
    atom_concat(Nom, '_plus', Fichier2),
    atom_concat(Fichier2, '.pl', Fichier3),

    directory_file_path(Destination, Fichier3, Fichier4),
	open(Fichier4, write, File),
	fichier:writeq_point(File, Partie),
	close(File).

% ----------
sauvegarde_partie_json_enrichie(Destination, Fichier, Partie) :-			  
        % constitution du nom du fichier enrichi
	atom_concat(Nom, '.json', Fichier),
    atom_concat(Nom, '_plus', Fichier2),
    atom_concat(Fichier2, '.json', Fichier3),

    directory_file_path(Destination, Fichier3, Fichier4),
	open(Fichier4, write, File),
	json_write_dict(File, Partie),
	close(File).

% ----------
	% sauvegarde une partie prolog avec des enrichissements
	% nombre de solutions et solutions avant et apres chaque coup
sauvegarde_partie(Nom_partie, Joueur,
				  partie(
				             nom(Chemin_partie),
				             _Jeu,
				             _Nb_cartes,
				             _Couleurs,
				             _Valeurs,
				             Somme_cartes,
				             Ordre_couleurs,
				             Solution,
				             Cartes_jouees,
				             Resultat
                    	),
					N
                 ) :-

	atom_concat(Nom_partie, '.pl', Nom_fichier),
	open(Nom_fichier, write, File),

	file_base_name(Chemin_partie, Partie),

	fichier:writeq_nl_point(File, joueur(N, Joueur)),
	fichier:writeq_nl_point(File, partie(N, Partie)),
	ajoute_premier_argument(Somme_cartes, N, Somme_cartes1),
	fichier:writeq_nl_point(File, Somme_cartes1),
	ajoute_premier_argument(Ordre_couleurs, N, Ordre_couleurs1),
	fichier:writeq_nl_point(File, Ordre_couleurs1),
	ajoute_premier_argument(Solution, N, Solution1),
	fichier:writeq_nl_point(File, Solution1),
	fichier:writeq_nl_point(File, cartes_jouees(N, Cartes_jouees)),
	ajoute_premier_argument(Resultat, N, Resultat1),
	fichier:writeq_nl_point(File, Resultat1),

	close(File).

% -----------
	% ajouter N comme premier argument de Terme
ajoute_premier_argument(Terme, N, Terme1) :-
	Terme =..[Pred|Args],
	Terme1 =..[Pred|[N|Args]].

%% ----------		
    % ecrit la partie dans un module prolog
assert_partie(partie(
					 Ident,
                     Nom,
                     Jeu,
                     Nb_cartes,
                     couleurs(Couleurs),
                     Valeurs,
                     Somme_cartes,
                     Ordre_couleurs,
                     Solution,
                     Cartes_jouees,
                     Resultat
                    ),
              Module
              ) :-
	Module:assert(Ident),
	Module:assert(Nom),
	Module:assert(couleurs(Couleurs)),
	length(Couleurs, Nb_couleurs),
	Module:assert(nb_couleurs(Nb_couleurs)),
    Module:assert(Jeu),
    Module:assert(Nb_cartes),
    Module:assert(Valeurs),
    Module:assert(Somme_cartes),
    Module:assert(Ordre_couleurs),
    Module:assert(Solution),
    Module:assert(Cartes_jouees),
    Module:assert(Resultat),
	Module:assert(domaines([])),
	Module:assert(contraintes([])).
    
% ----------
construit_identifiant_prolog(Somme, Ordre_couleurs, Solution, Ident) :-
	ordre_couleurs_id(Ordre_couleurs, Id_ordre),
	solution_id(Solution, Id_solution),
	atom_concat(Somme, Id_ordre, Id1),
	atom_concat(Id1, Id_solution, Ident).

% ----------
construit_identifiant(somme(N, Somme), ordre_couleurs(N, Ordre_couleurs), 
                      solution(N, Solution), ident(N,Ident)) :-
	ordre_couleurs_id(Ordre_couleurs, Id_ordre),
	solution_id(Solution, Id_solution),
	atom_concat(Somme, Id_ordre, Id1),
	atom_concat(Id1, Id_solution, Ident).


% ----------
construit_identifiant_json(somme(Somme), ordre_couleurs(Ordre_couleurs), 
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
get_partie_prolog(ident,
				  partie(ident(Ident),_ ,_, _, _, _, _ , _, _ , _ ,_),
				  Ident) :-
	!.

    % recupere les elements d'une partie 
get_partie_prolog(nom, 
				  partie(_, nom(Partie) ,_, _, _, _, _ , _, _ , _ ,_), 
				  Partie) :-
    !.
  
get_partie_prolog(jeu, 
				 partie(_, _, jeu(Jeu), _, _, _, _ , _, _ , _ ,_), 
				 Jeu) :-
    !.
    
get_partie_prolog(nb_cartes, 
				  partie( _, _, _, nb_cartes(Nb_cartes), _, _, _ , _, _, _, _), 
                  Nb_cartes) :-
    !.
    
get_partie_prolog(couleurs, 
                  partie(_, _, _, _, couleurs(Couleurs), _, _, _, _ , _, _), 
                  Couleurs) :-
    !.
    
get_partie_prolog(valeurs, 
                  partie(_, _, _, _, _, valeurs(Valeurs), _, _, _, _, _), 
                  Valeurs) :-
    !.

get_partie_prolog(somme, 
                  partie(_, _, _, _, _, _, somme(Somme), _, _, _, _), 
                  Somme) :-
    !.
    
get_partie_prolog(ordre_couleurs, 
                  partie(_, _, _, _, _, _, _, ordre_couleurs(Ordre_couleurs), _, _, _), 
                  Ordre_couleurs) :-
    !.

get_partie_prolog(solution, 
                  partie(_, _, _, _, _, _, _, _, solution(Solution), _, _), 
                  Solution) :-
    !.

get_partie_prolog(cartes_jouees, 
                  partie(_, _, _, _, _, _, _, _, _, cartes_jouees(Cartes_jouees), _), 
                  Cartes_jouees) :-
    !.

get_partie_prolog(resultat, 
                  partie(_, _, _, _, _, _, _, _, _, _, resultat(Resultat)), 
                  Resultat).

% --------------------------
    % recupere les elements d'une partie 

get_partie_prolog2(ident, 
                   partie(ident(Ident), _, _, _, _, _, _, _, _, _, _, _), 
				   Ident) :-
	!.

get_partie_prolog2(joueur, 
                   partie(_, joueur(Joueur), _, _, _, _, _, _, _, _, _, _), 
				   Joueur) :-
	!.

get_partie_prolog2(partie, 
				   partie(_, _, partie(Partie),_, _, _, _, _ , _, _ , _ ,_), 
				   Partie) :-
    !.
  
get_partie_prolog2(jeu, 
				   partie(_ ,_, _, jeu(Jeu), _, _, _, _ , _, _ , _ ,_), 
				   Jeu) :-
    !.
    
get_partie_prolog2(nb_cartes, 
				  partie(_, _, _, _, nb_cartes(Nb_cartes), _, _, _ , _, _, _ , _), 
                  Nb_cartes) :-
    !.
    
get_partie_prolog2(couleurs, 
                   partie(_, _, _, _, _, couleurs(Couleurs), _, _, _, _ , _, _), 
                   Couleurs) :-
    !.
    
get_partie_prolog2(valeurs, 
                   partie(_, _, _, _, _, _, _, valeurs(Valeurs), _, _, _, _, _), 
                   Valeurs) :-
    !.

get_partie_prolog2(somme, 
                   partie(_, _, _, _, _, _, _, _, somme(Somme), _, _, _, _), 
                   Somme) :-
    !.
    
get_partie_prolog2(ordre_couleurs, 
                   partie(_, _, _, _, _, _, _, _, ordre_couleurs(Ordre_couleurs), _, _, _), 
                   Ordre_couleurs) :-
    !.

get_partie_prolog2(solution, 
                   partie(_, _, _, _, _, _, _, _, _, solution(Solution), _, _), 
                   Solution) :-
    !.

get_partie_prolog2(cartes_jouees, 
                   partie(_, _, _, _, _, _, _, _, _, _, cartes_jouees(Cartes_jouees), _), 
                   Cartes_jouees) :-
    !.

get_partie_prolog2(resultat, 
                   partie(_, _, _, _, _, _, _, _, _, _, _, resultat(Resultat)), 
                   Resultat).

% --------------------------
    % recupere les elements d'une partie 

get_partie_prolog3(ident, 
                   partie(ident(_Num_partie, Ident), _, _, _, _, _, _, _), 
				   Ident) :-
	!.

get_partie_prolog3(num_partie, 
                   partie(ident(Num_partie, _Ident), _, _, _, _, _, _, _), 
				   Num_partie) :-
	!.

get_partie_prolog3(joueur, 
                   partie(_, (_Num_partie, Joueur), _, _, _, _, _, _), 
				   Joueur) :-
	!.

get_partie_prolog3(partie, 
				   partie(_, _, partie(_Num_partie, Partie),_, _, _, _, _), 
				   Partie) :-
    !.

get_partie_prolog3(somme, 
				   partie(_, _, _, somme(_Num_partie, Somme), _, _, _, _), 
				   Somme) :-
    !.

get_partie_prolog3(ordre_couleurs, 
                   partie(_, _, _, _, ordre_couleurs(_Num_partie, Ordre_couleurs), _, _, _), 
                   Ordre_couleurs) :-
    !.

get_partie_prolog3(solution, 
                   partie(_, _, _, _, _, solution(_Num_partie, Solution), _, _), 
                   Solution) :-
    !.

get_partie_prolog3(cartes_jouees, 
                   partie(_, _, _, _, _, _, cartes_jouees(_Num_partie, Cartes_jouees), _), 
                   Cartes_jouees) :-
    !.

get_partie_prolog3(resultat, 
                   partie(_, _, _, _, _, _, _, (Resultat)), 
                   Resultat).

% --------------------------
    % recupere les elements d'une partie 

get_partie_prolog4(num_partie, 
                   partie(joueur(Num_partie, _Joueur), _, _, _, _, _, _, _), 
				   Num_partie) :-
	!.

get_partie_prolog4(joueur, 
                   partie(joueur(_Num_partie, Joueur), _, _, _, _, _, _, _), 
				   Joueur) :-
	!.

get_partie_prolog4(partie, 
				   partie(_, (_Num_partie, Partie),_, _, _, _, _, _), 
				   Partie) :-
    !.

get_partie_prolog4(somme, 
				   partie(_, _, somme(_Num_partie, Somme), _, _, _, _, _), 
				   Somme) :-
    !.

get_partie_prolog4(ordre_couleurs, 
                   partie(_, _, _, ordre_couleurs(_Num_partie, Ordre_couleurs), _, _, _, _), 
                   Ordre_couleurs) :-
    !.

get_partie_prolog4(solution, 
                   partie(_, _, _, _, solution(_Num_partie, Solution), _, _, _), 
                   Solution) :-
    !.

get_partie_prolog4(cartes_jouees, 
                   partie(_, _, _, _, _, cartes_jouees(_Num_partie, Cartes_jouees), _, _), 
                   Cartes_jouees) :-
    !.

get_partie_prolog4(resultat, 
                   partie(_, _, _, _, _, _, (Resultat), _), 
                   Resultat).

/* ============================ FIN LISTING ================================= */
