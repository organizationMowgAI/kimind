/* ============================ GESTION DES OPERATEURS ====================== */

:- module(
           operateurs,
            [
              inverse_op/2,
              inverse_operandes/2, 
              inverse_comparaisons/3,
              
              operateurs_comparaison_numerique/1,
              op_comparaison_numerique/1,
              operateurs_valeur/1,
              
              operateurs_comparaison_compatibles/2,
              operateurs_comparaison_couleur/1,
              op_comparaison_couleur/1,
              operateurs_couleur/1,
			  operateurs_ordre_couleurs/1,
              
              operateurs_comparaison/1,
              op_comparaison/1,
              operateurs_couleur_valeur/1,
                            
              op(500, xfx, <=>),
              op(400, xfx, avant),
              op(400, xfx, avant_meme_rang),
              op(400, xfx, apres),
              op(400, xfx, apres_meme_rang),
              op(400, xfx, meme_rang),
              op(400, xfx, pas_meme_rang),
			  op(400, xfx, dans)
            ]
		 ).
		
:- op(500, xfx, <=>),
   op(400, xfx, avant),
   op(400, xfx, avant_meme_rang),
   op(400, xfx, apres),
   op(400, xfx, apres_meme_rang),
   op(400, xfx, meme_rang),
   op(400, xfx, pas_meme_rang),
   op(400, xfx, dans).
   			
% ----------
	% verifie que lorsqu'une comparaison est faite avec l'operateur de gauche,
	% alors avec les memes arguments la comparaison pourrait reussir avec
	% l'operateur de droite
	
	% =
operateurs_comparaison_compatibles(=, =).
	
operateurs_comparaison_compatibles(=, =<).
	
operateurs_comparaison_compatibles(=, >=).
	
operateurs_comparaison_compatibles(\=, \=).

operateurs_comparaison_compatibles(\=, <).
	
operateurs_comparaison_compatibles(\=, >).

operateurs_comparaison_compatibles(<, <).

operateurs_comparaison_compatibles(<, =<).
	
operateurs_comparaison_compatibles(<, \=).
	
operateurs_comparaison_compatibles(=<, =<).
		
operateurs_comparaison_compatibles(=<, =).

operateurs_comparaison_compatibles(=<, \=).

operateurs_comparaison_compatibles(=<, >=).
	
operateurs_comparaison_compatibles(>, >).

operateurs_comparaison_compatibles(>, \=).
	
operateurs_comparaison_compatibles(>, >=).
	
operateurs_comparaison_compatibles(>=, >=).
		
operateurs_comparaison_compatibles(>=, =).

operateurs_comparaison_compatibles(>=, \=).

operateurs_comparaison_compatibles(>=, =<).


	% meme_rang	
operateurs_comparaison_compatibles(meme_rang, meme_rang).
	
operateurs_comparaison_compatibles(meme_rang, avant_meme_rang).
	
operateurs_comparaison_compatibles(meme_rang, apres_meme_rang).

	% pas_meme_rang
operateurs_comparaison_compatibles(pas_meme_rang, pas_meme_rang).

operateurs_comparaison_compatibles(pas_meme_rang, avant).
	
operateurs_comparaison_compatibles(pas_meme_rang, apres).

	% avant	
operateurs_comparaison_compatibles(avant, avant).

operateurs_comparaison_compatibles(avant, avant_meme_rang).
	
operateurs_comparaison_compatibles(avant, pas_meme_rang).

	% avant_meme_rang	
operateurs_comparaison_compatibles(avant_meme_rang, avant_meme_rang).

operateurs_comparaison_compatibles(avant_meme_rang, avant).
		
operateurs_comparaison_compatibles(avant_meme_rang, meme_rang).

% operateurs_comparaison_compatibles(avant_meme_rang, pas_meme_rang).

operateurs_comparaison_compatibles(avant_meme_rang, apres_meme_rang).

	% apres	
operateurs_comparaison_compatibles(apres, apres).

operateurs_comparaison_compatibles(apres, pas_meme_rang).
	
operateurs_comparaison_compatibles(apres, apres_meme_rang).
	
	% apres_meme_rang
operateurs_comparaison_compatibles(apres_meme_rang, apres_meme_rang).

operateurs_comparaison_compatibles(apres_meme_rang, apres).
		
operateurs_comparaison_compatibles(apres_meme_rang, meme_rang).

% operateurs_comparaison_compatibles(apres_meme_rang, pas_meme_rang).

operateurs_comparaison_compatibles(apres_meme_rang, avant_meme_rang).

% ----------	
operateurs_comparaison([=, \=, <, =<, >, >=, avant, avant_meme_rang, 
                        meme_rang, pas_meme_rang, apres, apres_meme_rang]).	
    
% ----------                    
op_comparaison(Op) :-
	operateurs_comparaison(Ops),
	member(Op, Ops),
	!.     					% enleve point de choix sur member                   
      
% ----------      
operateurs_comparaison_numerique([=, \=, <, =<, >, >=]).

% ----------
op_comparaison_numerique(Op) :-
	operateurs_comparaison_numerique(Ops),
	member(Op, Ops),
	!.       

% ----------
operateurs_ordre_couleurs([avant, meme_rang]).	

% ----------	
operateurs_comparaison_couleur([avant, avant_meme_rang, 
                               meme_rang, pas_meme_rang,
                               apres, apres_meme_rang]).
% ----------                               
op_comparaison_couleur(Op) :-
	operateurs_comparaison_couleur(Ops),
	member(Op, Ops),
	!.       
                        
% ----------
operateurs_couleur_valeur(Ops) :-
    operateurs_couleur(Ops_couleur),
    operateurs_valeur(Ops_valeur),
    append(Ops_valeur, Ops_couleur, Ops).

% ---------
operateurs_valeur([=, \=, <, =<]).

% ----------
operateurs_couleur([avant, avant_meme_rang, meme_rang, pas_meme_rang]).		
	
% ----------
    % inverse les comparaisons si Couleur n'est pas le premier argument
inverse_comparaisons([], _Arg1, []) :-
    !.

inverse_comparaisons([Comp|Comps], Arg1, [Comp1|Comps1]) :-
    inverse_comparaison(Comp, Arg1, Comp1),
    inverse_comparaisons(Comps, Arg1, Comps1).

% ----------
inverse_comparaison(Comp, Arg1, Comp) :-
    Comp=..[_Op, Arg1, _Arg2],
    !.

inverse_comparaison(Comp, _Arg1, Comp1) :-
    inverse_operandes(Comp, Comp1).

% ---------
inverse_operandes(A = B, B = A) :-
    !.

inverse_operandes(A \= B, B \= A) :-
    !.

inverse_operandes(A < B, B > A) :-
    !.

inverse_operandes(A =< B, B >= A) :-
    !.

inverse_operandes(A meme_rang B, B meme_rang A) :-
    !.
    
inverse_operandes(A pas_meme_rang B, B pas_meme_rang A) :-
    !.

inverse_operandes(A avant B, B apres A) :-
    !.

inverse_operandes(A avant_meme_rang B, B apres_meme_rang A) :-
    !.

inverse_operandes(A apres B, B avant A) :-
    !.

inverse_operandes(A apres_meme_rang B, B avant_meme_rang A).
		
% ------------
 	% inverse operateur 
inverse_op(<, >=) :-
    !.
    
inverse_op(\=, \=) :-                       % X \= Y <=> Y \= x 
    !.
    
inverse_op(=, =) :-                         % X = Y <=> Y = x 
    !.
    
inverse_op(=<, >) :-
	!.

inverse_op(meme_rang, pas_meme_rang) :-
	!.

inverse_op(pas_meme_rang, meme_rang) :-
	!.

inverse_op(avant, apres_meme_rang) :-
	!.

inverse_op(avant_meme_rang, apres) :-
	!.

inverse_op(apres, avant_meme_rang) :-
	!.

inverse_op(apres_meme_rang, avant).

% ---------
traduit_op_couleur(avant, <) :-
	!.

traduit_op_couleur(avant_meme_rang, =<) :-
	!.
	
traduit_op_couleur(meme_rang, =) :-
	!.

traduit_op_couleur(pas_meme_rang, \=).

/* ================================= FIN LISTING ============================ */
