/* ========================= SUPPRESSION CONTRAINTES ======================== */

:- module(
% ---------
          supprime_contraintes,
          [
           supprime_contraintes_inutiles/5,
           retire_contraintes_inutiles/4,
           supprime_contraintes_domaines/5,
           supprime_contrainte/4,
           contrainte_superflue/2
          ]
		 ).
		 
:-   
   use_module(library(lists)),
   use_module(liste),
   use_module(bk),
   use_module(ajout_suppression_contraintes),
   use_module(donnees_contraintes),
   use_module(recupere_contraintes),
   use_module(domaines),
   use_module(operateurs).

% ----------
        % retire certaines contraintes et les explications associees
supprime_contraintes_inutiles(Contraintes, Domaines, Explications,
							  Contraintes_out, Explications_out) :-
    supprime_contraintes_domaines(Contraintes, Domaines, Explications, 
								  Contraintes1, Explications1),
    retire_contraintes_inutiles(Contraintes1, Explications1, 
								Contraintes_out, Explications_out).
    
% ---------
    % supprime les contraintes deja assurees par les domaines des variables
    % qu'elles contiennent
supprime_contraintes_domaines([], _Domaines, Explications, [], Explications) :-
    !.
    
supprime_contraintes_domaines([Contrainte|Contraintes], Domaines, Explications,
                               Contraintes_out, Explications_out) :-
    supprime_contrainte(Contrainte, Domaines, Explications, Explications1),
    !,
    supprime_contraintes_domaines(Contraintes, Domaines, Explications1,
								  Contraintes_out, Explications_out).
    
supprime_contraintes_domaines([Contrainte|Contraintes], Domaines, Explications, 
                              [Contrainte|Contraintes_out], Explications_out) :-               
    supprime_contraintes_domaines(Contraintes, Domaines, Explications,
								  Contraintes_out, Explications_out).
  	
% ---------
contrainte_superflue(Contrainte, Domaines) :-
    Contrainte =..[Op, Var, Var1],
    operateurs:operateurs_couleur_valeur(Ops),
    member(Op, Ops),
    (number(Var) ; atom(Var)),
    (number(Var1) ; atom(Var1)),
    domaine(Var, Domaines, Domaine),
    domaine(Var1, Domaines, Domaine1),
    domaines_assurent_contrainte(Op, Domaine, Domaine1),
    !.
    
% ----------
supprime_contrainte(Contrainte, _Domaines, Explications, Explications) :-
    check_arguments:variables_impliquees(Contrainte, []),
    !.

% ----------
supprime_contrainte(Contrainte, Domaines, Explications, [Exp|Explications1]) :-
	Contrainte =..[Op, Var, Var1],
    operateurs:operateurs_couleur_valeur(Ops),
    member(Op, Ops),
    (number(Var) ; atom(Var)),
    (number(Var1) ; atom(Var1)),
    domaine(Var, Domaines, Domaine),
    domaine(Var1, Domaines, Domaine1),
    domaines_assurent_contrainte(Op, Domaine, Domaine1),
    ajout_suppression_contraintes:
    	suppression_contrainte_domaines(Contrainte, Domaine, Domaine1, Exp),
	gere_deductions:
		supprime_deduction(Explications, Contrainte, Explications1).
    
% ---
    	% verifie que tous les couples de Domaine X Domaine1
    	% assurent la contrainte (sans enumerer Domaine x Domaine1)
domaines_assurent_contrainte(= , [V], [V]) :-
    !.
    
    % valable pour couleur et valeur
domaines_assurent_contrainte(\=, [V], Domaine1) :-
    \+ member(V, Domaine1),
    !.

    % valable pour couleur et valeur
domaines_assurent_contrainte(\=, Domaine, [V]) :-
    \+ member(V, Domaine),
    !.

domaines_assurent_contrainte( < , Domaine, Domaine1) :-
    domaines:compare_domaines_valeur(Domaine, Domaine1, <),
    !.

domaines_assurent_contrainte( =< , Domaine, Domaine1) :-
    domaines:compare_domaines_valeur(Domaine, Domaine1, =<),
    !.

domaines_assurent_contrainte( > , Domaine, Domaine1) :-
    domaines:compare_domaines_valeur(Domaine, Domaine1, >),
    !.

domaines_assurent_contrainte( >=, Domaine, Domaine1) :-
    domaines:compare_domaines_valeur(Domaine, Domaine1, >=),
    !.

% ---------- traitement des couleurs

domaines_assurent_contrainte(meme_rang , [V], [V]) :-
    !.  

domaines_assurent_contrainte( avant , Domaine, Domaine1) :-
    domaines:compare_domaines_couleur(Domaine, Domaine1, avant),
    !.

domaines_assurent_contrainte( avant_meme_rang, Domaine, Domaine1) :-
    domaines:compare_domaines_couleur(Domaine, Domaine1, avant_meme_rang),
    !.

domaines_assurent_contrainte( apres , Domaine, Domaine1) :-
    domaines:compare_domaines_couleur(Domaine, Domaine1, apres),
    !.

domaines_assurent_contrainte( apres_meme_rang, Domaine, Domaine1) :-
    domaines:compare_domaines_couleur(Domaine, Domaine1, apres_meme_rang).

/* ======================== retire contraintes inutiles ===================== */

% ----------
retire_contraintes_inutiles(Contraintes, Explications, 
							Contraintes_out, Explications_out) :-
	retire_contraintes_inutiles2(Contraintes, [], Explications, Contraintes1,
								 Explications_out),
	modifie_contraintes2(Contraintes1, [], Contraintes_out).
	
% ----------	
retire_contraintes_inutiles2([], _Traites, Explications, [], Explications) :-
	!.
	
	% Contrainte deja traitee, on termine
retire_contraintes_inutiles2([Contrainte|Contraintes], Traites, Explications,
							 [Contrainte|Contraintes], Explications) :-
	member(Contrainte, Traites),
	!.	
			
retire_contraintes_inutiles2([Contrainte|Contraintes], Traites, Explications,
							  Contraintes_out, Explications_out) :-
	check_contraintes_inutiles(Contraintes, Contrainte, Explications,
								Contraintes1, Explications1),
	append(Contraintes1, [Contrainte], Contraintes2),
	retire_contraintes_inutiles2(Contraintes2, [Contrainte|Traites],
	                             Explications1, 
								 Contraintes_out, Explications_out).
	
% ----------
check_contraintes_inutiles([], _Contrainte, Explications, [], Explications) :-
	!.

check_contraintes_inutiles([Contrainte1|Contraintes], Contrainte, Explications,
                            Contraintes_out, Explications_out) :-
	contrainte_inutile(Contrainte, Contrainte1),
	!,
	gere_deductions:
		supprime_deduction(Explications, Contrainte, Explications1),
	check_contraintes_inutiles(Contraintes, Contrainte, Explications1, 
							   Contraintes_out, Explications_out).	
	
check_contraintes_inutiles([Contrainte1|Contraintes], Contrainte, Explications,
                           [Contrainte1|Contraintes_out], Explications_out) :-
	check_contraintes_inutiles(Contraintes, Contrainte, Explications,
                               Contraintes_out, Explications_out).
	
% ----------
	% verifie si la contrainte en position 2 est inutile
	% (entre 2 contraintes, la moins forte (si comparable) est inutile
contrainte_inutile(Contrainte, Contrainte) :-
	!.
	
contrainte_inutile(X < Y, Y > X) :-
	!.	
	
contrainte_inutile(X < Y, X =< Y) :-
	!.

contrainte_inutile(X < Y, X \= Y) :-
    !.

contrainte_inutile(X < Y, Y \= X) :-
    !.

contrainte_inutile(X = Y, Y = X) :-
	!.
	
contrainte_inutile(X = Y, X =< Y) :-
	!.
	
contrainte_inutile(X = Y, X >= Y) :-
	!.

contrainte_inutile(X > Y, Y < X) :-
	!.	
		
contrainte_inutile(X > Y, X >= Y) :-
	!.

contrainte_inutile(X > Y, Y \= X) :-
	!.	
		
contrainte_inutile(X > Y, X \= Y) :-
    !.

contrainte_inutile(X >= Y, Y =< X) :-
	!.	
	
    % --- couleurs
contrainte_inutile(X avant Y, Y apres X) :-
	!.	

contrainte_inutile(X avant Y, Y pas_meme_rang X) :-
    !.

contrainte_inutile(X avant Y, X pas_meme_rang Y) :-
    !.
	
contrainte_inutile(X avant Y, X avant_meme_rang Y) :-
	!.
	
contrainte_inutile(X meme_rang Y, Y meme_rang X) :-
	!.
	
contrainte_inutile(X meme_rang Y, X avant_meme_rang Y) :-
	!.
	
contrainte_inutile(X meme_rang Y, X apres_meme_rang Y) :-
	!.

contrainte_inutile(X apres Y, Y avant X) :-
	!.	

contrainte_inutile(X apres Y, X pas_meme_rang Y) :-
    !.

contrainte_inutile(X apres Y, Y pas_meme_rang X) :-
    !.
		
contrainte_inutile(X apres Y, X apres_meme_rang Y) :-
	!.
	
contrainte_inutile(X apres_meme_rang Y, Y avant_meme_rang X).

% ----------	
	% reecrit les contraintes de la forme 
	%  X >= Y et X <= Y 
	%      ---> X = Y
modifie_contraintes2([], _Traites, []) :-
	!.
	
	% contrainte deja traitee
modifie_contraintes2([Contrainte|Contraintes], Traites, 
                     [Contrainte|Contraintes]) :-
    member(Contrainte, Traites),
    !.
    
modifie_contraintes2([Contrainte|Contraintes], Traites, Contraintes_out) :-
	modifie_les_contraintes(Contraintes, Contrainte, Contraintes1),
	append(Contraintes1, [Contrainte], Contraintes2),
	modifie_contraintes2(Contraintes2, [Contrainte|Traites], Contraintes_out).
	
% ----------
	% Contrainte n'a pas donne lieu a une modification
modifie_les_contraintes([], _Contrainte, []) :-
	!.

modifie_les_contraintes([Contrainte1|Contraintes], Contrainte, 
                        [Contrainte2|Contraintes]) :-
	modifie_contrainte(Contrainte, Contrainte1, Contrainte2),
	!.
	
modifie_les_contraintes([Contrainte1|Contraintes], Contrainte,
                         [Contrainte1|Contraintes_out]) :-
	modifie_les_contraintes(Contraintes, Contrainte, Contraintes_out).
	
% ----------
modifie_contrainte(X >= Y, X =< Y, X = Y) :-
	!.
	
modifie_contrainte(X =< Y, X >= Y, X = Y) :-
	!.
	
modifie_contrainte(X apres_meme_rang Y, X avant_meme_rang Y, X meme_rang Y) :-
	!.
	
modifie_contrainte(X avant_meme_rang Y, X apres_meme_rang Y, X meme_rang Y) :-
	!.

/* ============================= FIN LISTING ================================ */
