/* ========================================================================== */
/*                            GESTION DE LISTES                               */
/* ========================================================================== */

:- module(
         liste, 
         [
			strictement_inclus/2,

			convertit_liste_atome/2,

         	append_listes/2,
         
            egales/2,
            length_sort/2,             
         
                    % sous_listes
            select_n_first/4,
            select_n_last/3,
            
                    % supprimer elements
			retire_listes_vides/2,
            retire_doublons_variables/2,        
            retire_valeurs_superieures/3,
            conserve_elements/3,
            elimine_elements/3,
            elems_inf_valeur/3,
            elems_inf_egal_valeur/3,
            elems_sup_valeur/3,
            elems_sup_egal_valeur/3,
           
                    % construire liste 
            liste_ordre_croissant/3,
			liste_ordre_decroissant/3,
            remplit_liste/3,
            
                    % ajouter elements 
            ajouter_elt/3,
            
                    % recherche dans liste 
			nombre_elt/3,
			strict_member/2,
            dernier_element/2,

                    % affichage
            affiche_liste/1,
			display_liste_tab/2,
            display_liste/1,
            display_liste/2,
            display_liste_tabulation/2,
            
            		% divers
            singleton/1

         ]
		 ).

:- op(400, xfx, <=>).		

/* =============================== SOUS LISTE =============================== */

% ----------
strictement_inclus(L1, L2) :-
	subset(L1, L2),
	\+ subset(L2, L1). 

/* ================================= APPEND ================================= */

% ---------
	% ajoute toutes les listes de L en une liste
	% aucun doublon en sortie
    % l'ordre des listes est volontairement preserve
	
% ---------
append_listes([], []) :-
	!.
	
append_listes([L|LL], L_out) :-
	append_listes(LL, L1),
	append(L, L1, L_out).
		 
/* ================================ COMPARAISON ============================== */

egales(L1, L2) :-
    subset(L1, L2),
    subset(L2, L1).
		 
/* ================================ TRIER =================================== */

    % ---
    % retire les doublons de variables dans la liste de variables L
retire_doublons_variables([], []) :-
    !.

retire_doublons_variables([X|L], Lout) :-
    strict_select(X, L, L1),
    !,
    retire_doublons_variables(L1, Lout).

retire_doublons_variables([X|L], [X|Lout]) :-
    retire_doublons_variables(L, Lout).
    

    % trie une liste de listes par ordre de taille croissante
length_sort(LL, LL_out) :-
    get_length(LL, LL1),
    sort(2, @=<, LL1, LL2),
    get_listes(LL2, LL_out).
    
   % --- 
get_length([], []) :-
    !.
    
get_length([L|LL], [len(L, N)|LL1]) :-
    length(L, N),
    get_length(LL, LL1).

    % ---    
get_listes([], []) :-
    !.
       
get_listes([len(_N, L)|LL], [L|LL1]) :-
    get_listes(LL, LL1).

/* ============================== AFFICHER ================================== */

write_infix(L) :-
    is_list(L),
    !,
    write(L).

    % les operations binaires sont ecrites en mode infixe
write_infix(Expr) :-
    (   
        compound(Expr) 
        ->
            functor(Expr, Functor, Arity),
            (   
                    Arity =:= 2 
                        ->
                            arg(1, Expr, Left),
                            arg(2, Expr, Right),
                            write_infix(Left),
                            write(' '), 
                            write(Functor), 
                            write(' '),
                            write_infix(Right)
                        ;   
                            write(Expr) 
            )
            ;   
                write(Expr)
    ).
		
% ----------
display_liste_tab([], _Tab) :-
    !.

display_liste_tab([X], Tab) :-
	!,
	write(Tab),
    write(X),
    nl.

display_liste_tab([X|L], Tab) :-
	write(Tab),	
	write(X),  
	writeln(','),
	display_liste_tab(L, Tab).
	
% ----------
    % pas d'ecriture infixe
affiche_liste(L) :-
    length(L, N),
    write(N),
    writeln(' element(s)'),
	writeln('['),
 	affiche_liste2(L),
	writeln(']').

% ----------

affiche_liste2([]) :-
    !.

affiche_liste2([X]) :-
	!,
	write('   '),
    write(X),
    nl.

affiche_liste2([X|L]) :-
	write('   '),	
	write(X),  
	writeln(','),
	affiche_liste2(L).
	
% ----------
	% affiche liste avec une ligne par element
display_liste(Message, L) :-
    writeln(Message),
    display_liste(L).
	
% ----------
display_liste(L) :-
    length(L, N),
    write(N),
    writeln(' element(s)'),
	writeln('['),
 	display_liste2(L),
	writeln(']').

% ----------
display_liste2([]) :-
    !.

display_liste2([X]) :-
	!,
	write('   '),
    write_infix(X),
    nl.

display_liste2([X|L]) :-
	write('   '),	
	write_infix(X),  
	writeln(','),
	display_liste2(L).
	
% ---------
    % affiche un element par ligne precede d'une tabulation de N blancs
    % le premier element n'est pas tabule	
display_liste_tabulation([], _N) :-
    !,
    writeln('[]').
   
display_liste_tabulation([X|L], N) :-
    writeln(X),
    display_liste_tabulation2(L, N).
    
% ---------        
display_liste_tabulation2([], _N) :-
    !.
    
display_liste_tabulation2([X], N) :-
    !,
	tabule(N),
	writeln(X).
		    
display_liste_tabulation2([X|L], N) :-
	tabule(N),
	writeln(X),
	display_liste_tabulation2(L, N).
	
    % ---	
tabule(0) :-
    !.
    
tabule(N) :-
    write(' '),
    N1 is N-1,
    tabule(N1).
    	
/* ============================== CONSTRUIRE ================================ */

	% construit une liste [Min,...,Max] 
liste_ordre_croissant(Max, Max, [Max]) :-
	!.

liste_ordre_croissant(Min, Max, [Min|L]) :-
	Min1 is Min+1,
	liste_ordre_croissant(Min1, Max, L).


	% construit une liste [Max,...,Min] 
liste_ordre_decroissant(Min, Min, [Min]) :-
	!.

liste_ordre_decroissant(Max, Min, [Max|L]) :-
	Max1 is Max-1,
	liste_ordre_decroissant(Max1, Min, L).
	
/* ========================== SUPPRIMER ELEMENTS ============================ */

% ----------
	% retire les listes vides dans la liste de listes L
retire_listes_vides(LL, LL_out) :-
	delete(LL, [], LL_out).
	
% ---------
    % retourne une liste formee des elements de la liste L (triee par ordre
    % croissant) inferieurs a Valeur
elems_inf_valeur([], _Valeur, []) :-
    !.

elems_inf_valeur([X|L], Valeur, [X|L1]) :-
    X < Valeur,
    elems_inf_valeur(L, Valeur, L1).

elems_inf_valeur(_L, _Valeur, []).


% ---------
    % retourne une liste formee des elements de la liste L (triee par ordre
    % croissant) inferieurs ou egaux a Valeur
elems_inf_egal_valeur([], _Valeur, []) :-
    !.

elems_inf_egal_valeur([X|L], Valeur, [X|L1]) :-
    X =< Valeur,
    elems_inf_egal_valeur(L, Valeur, L1).

elems_inf_egal_valeur(_L, _Valeur, []).

% ---------
    % retourne une liste formee des elements de la liste L (triee par ordre
    % croissant) superieurs a Valeur
elems_sup_valeur([], _Valeur, []) :-
    !.

elems_sup_valeur([X|L], Valeur, L1) :-
    X =< Valeur,
    elems_sup_valeur(L, Valeur, L1).

elems_sup_valeur(L, _Valeur, L).


    % retourne une liste formee des elements de la liste L (triee par ordre
    % croissant) superieurs ou egaux a Valeur
elems_sup_egal_valeur([], _Valeur, []) :-
    !.

elems_sup_egal_valeur([X|L], Valeur, L1) :-
    X < Valeur,
    elems_sup_egal_valeur(L, Valeur, L1).

elems_sup_egal_valeur(L, _Valeur, L).


   % ---
    % vrai si Term apparait dans L, avec les memes variables (strictement)
strict_select(_E, [], []) :-
    !,
    fail.
    
strict_select(E, [E1|L], L) :-
    E == E1,
    !.
    
strict_select(E, [E1|L], [E1|L1]) :-
    strict_select(E, L, L1).
    
	
	% conserve de L, tous les elements de Elements
elimine_elements([], _Elements, []) :-	
    !.
	
elimine_elements([X|L], Elements, L1) :-
    member(X,Elements),
    !,
    elimine_elements(L, Elements, L1).
	    
elimine_elements([X|L], Elements, [X|L1]) :-
    elimine_elements(L, Elements, L1).   	
	
		
	% conserve de L, tous les elements de Elements
conserve_elements([], _Elements, []) :-	
    !.
	
conserve_elements([X|L], Elements, [X|L1]) :-
    member(X,Elements),
    !,
    conserve_elements(L, Elements, L1).
	    
 conserve_elements([_X|L], Elements, L1) :-
    conserve_elements(L, Elements, L1).   
	    
	    
    % retire de la liste ordonnee (ordre decroissant) L
    % toutes les valeurs supperieures à Vmax		
retire_valeurs_superieures([], _Vmax, []) :-
    !.
		 
retire_valeurs_superieures([X|L], Vmax, L1) :-
    X > Vmax,
    retire_valeurs_superieures(L, Vmax, L1).
    
retire_valeurs_superieures(L, _Vmax, L).

/* ============================ SOUS LISTES ================================= */
		 
select_n_last(L, N, N_last) :-
    length(L, K),
    N1 is K-N,
    select_first(L, N1, N_last, _).		 
	
		 
    % retourne une liste composee des N premiers elements de L
    % L1 est la liste sans les N premiers elements
select_n_first(L, N, _L1, _N_first) :-
    length(L, N1),
    N > N1,
    !,
    fail.
    
select_n_first(L, 0, L, []) :-
    !.

select_n_first([X|L], N, L1, [X|N_first]) :-
    N1 is N-1,
    select_n_first(L, N1, L1, N_first).
    
/* ========================= AJOUTER ELEMENTS =============================== */    

    % retourne une liste avec N fois la valeur V
remplit_liste(0, _V, []) :-
    !.
    
remplit_liste(N, V, [V|L]) :-
    N1 is N-1,
    remplit_liste(N1, V, L).

    % ajoute X a chaque liste de LL     
ajouter_elt(_X, [], []) :-
    !.
    
ajouter_elt(X, [L|LL], [[X|L]|LL1]) :-
    ajouter_elt(X, LL, LL1).
    
/* ============================== RECHERCHE ================================= */	

% ---------  
dernier_element([X], X) :-
    !.
    
dernier_element([_X|L], D) :-
    dernier_element(L, D).

% ---------
    % vrai si Term apparait dans L, avec les memes variables (strictement)
strict_member(_E, []) :-
    !,
    fail.
    
strict_member(E, [E1|_L]) :-
    E == E1,
    !.
    
strict_member(E, [_E1|L]) :-
    strict_member(E, L).


	% retourne N, le nombre d'occurrences de X dans L		
nombre_elt([], _X, 0) :-
	!.

nombre_elt([X|L], X, N) :-
	!,
	nombre_elt(L, X, N1),
	N is N1+1.

nombre_elt([_|L], X, N) :-
	nombre_elt(L, X, N).
	
	
/* ================================ DIVERS ================================== */

% ----------
convertit_liste_atome(L, Atom) :-
	convertit_liste_atome2(L, A),
	atom_concat('[', A, A1),
	atom_concat(A1, ']', Atom).

% ----------
convertit_liste_atome2([], '') :-
	!.

convertit_liste_atome2([X], X) :-
	!.

convertit_liste_atome2([X|L], Atom) :-
	convertit_liste_atome2(L, A),
	atom_concat(X, ',', X1),
	atom_concat(X1, A, Atom).

% ----------   
singleton([_X]).

/* ============================== FIN LISTING =============================== */
