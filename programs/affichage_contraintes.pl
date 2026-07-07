/* ============================== AFFICHAGE ================================= */

:- module(
         affichage_contraintes,
         [
			affiche_solutions_domaines/1,

            affiche_contraintes_domaines/1,
            
            display_contraintes/2,
            display_groupes_contraintes_domaines/2,
            display_groupes_contraintes/1,
            display_contraintes_from_cartes/1,
			
            affiche_domaines/1,
            affiche_domaines_carte/1,
            affiche_domaines_cartes/1,

			swi_display_groupes_contraintes_domaines/1,		
			swi_affiche_domaines_contraintes/1,
			swi_affiche_solutions_domaines/1,
			swi_display_contraintes_from_cartes/1,
			swi_affiche_domaines/1,
            swi_display_solutions_sans_positions/1,

            display_solutions/1,
            display_solutions_sans_positions/1,
            
			affiche_coup/1,
            display_cartes_devinees/2,
            affiche_carte_jouee/1,
            affiche_une_carte_jouee/2,
            affiche_carte_jouee_domaine/2,
            affiche_coup_contraintes/2        
         ]
		 ).

:- use_module(liste),
   use_module(divers),
   use_module(bk),
   use_module(bk_contraintes),
   use_module(contraintes),
   use_module(kimind_prolog),
   use_module(fichier).

:- op(400, xfx, <=>).

/* =============================== CONTRAINTES ============================== */

% ----------
display_contraintes(Contraintes, Swi_exp) :-
	!,
	display_groupes_contraintes_domaines(Contraintes, Swi_exp).

% ----------
swi_display_contraintes_from_cartes(Cartes) :-
    contraintes:get_contraintes(Cartes, Contraintes),
	fichier:set_sortie_swi,
    swi_display_groupes_contraintes_domaines(Contraintes),
	fichier:retour_sortie_precedente.

% ----------
display_contraintes_from_cartes(Cartes) :-
    contraintes:get_contraintes(Cartes, Contraintes),
    swi_display_groupes_contraintes_domaines(Contraintes).

   % ---
swi_display_groupes_contraintes_domaines(Contraintes) :-
	nl,
    write(' ------------------------- CONTRAINTES SWI ----------------------'),
    nl,
	enleve_domaines(Contraintes, Contraintes1),
	display_groupes_contraintes(Contraintes1).

   % ---
display_groupes_contraintes_domaines(Domaines, Contraintes) :-
    nl,

    write(' ------------------------- CONTRAINTES EXP -----------------------'),
    nl,
    (
      Domaines == []
        -> true    
        ; 
       liste:display_liste('Domaines :', Domaines)
    ),
    display_groupes_contraintes(Contraintes),
    writeln('--------------------------------------------------------------- '),
    nl.
   
% ----------    
display_groupes_contraintes([]) :-
    !.
    
display_groupes_contraintes([co(_Carte, [])|Contraintes]) :-
    !,
    display_groupes_contraintes(Contraintes).    
    
display_groupes_contraintes([co(Carte, L)|Contraintes]) :-
    !,
    term_to_atom(Carte, Carte_a),
    atom_concat('contraintes carte ', Carte_a, Message1),
    atom_concat(Message1, ' :',  Message),
    nl,
    liste:display_liste(Message, L),
    display_groupes_contraintes(Contraintes).
    
display_groupes_contraintes([co(_Carte1, _Carte2, [])|Contraintes]) :-
    !,
    display_groupes_contraintes(Contraintes).        
    
display_groupes_contraintes([co(Carte1, Carte2, L)|Contraintes]) :-
    !,
    term_to_atom(Carte1, Carte_a1),
    term_to_atom(Carte2, Carte_a2),
    atom_concat('contraintes cartes ', Carte_a1, Message1),
    atom_concat(Message1, ' et ', Message2),
    atom_concat(Message2, Carte_a2, Message3),
     atom_concat(Message3, ' :',  Message),
    nl,
    liste:display_liste(Message, L),
    display_groupes_contraintes(Contraintes).
    
display_groupes_contraintes([co([])|Contraintes]) :-
        !,
        display_groupes_contraintes(Contraintes).
    
display_groupes_contraintes([co(L)|Contraintes]) :-
    nl,
    liste:display_liste('contraintes toutes cartes :', L),
    display_groupes_contraintes(Contraintes).
    
/* =============================== SOLUTIONS ================================ */

% ----------
swi_affiche_solutions_domaines(Cartes) :-
	fichier:set_sortie_swi,
	affiche_solutions_domaines(Cartes),
	fichier:retour_sortie_precedente.

% ----------
affiche_solutions_domaines(Cartes) :-
	display_solutions(Cartes),
	display_solutions_sans_positions(Cartes),
	affiche_domaines(Cartes).


% ----------
display_solutions(Cartes) :-
    bk_contraintes:solutions(Cartes, Solutions),
    !,
    nl,
    display_liste('solutions : ', Solutions).
    
display_solutions(Solutions) :-
    nl,
    display_liste('solutions : ', Solutions).
    
% --------
swi_display_solutions_sans_positions(Cartes) :-
	fichier:set_sortie_swi,
	display_solutions_sans_positions(Cartes),
	fichier:retour_sortie_precedente.

% ----------    
display_solutions_sans_positions(Cartes) :-
    bk_contraintes:solutions_sans_positions(Cartes, Solutions),
    !,
    nl,
    display_liste('solutions (sans positions) : ', Solutions).   
    
display_solutions_sans_positions(Solutions) :-
    nl,
    display_liste('solutions (sans positions) : ', Solutions).    
    
/* ================================= CARTES ================================= */

    % ---
display_cartes_devinees(_Joueur,[]) :-
    !.

display_cartes_devinees(_Joueur, Cartes_devinees) :-
    nl,
    writeln('les cartes suivantes ont ete decouvertes : '),
    nl,
    display_cartes_devinees2(Cartes_devinees),
    nl.

    % ---
display_cartes_devinees2([]) :-
    !.

display_cartes_devinees2([c(Position, Couleur, Valeur) |Cartes]) :-
    write(' - carte '),
    write(Position),
    write(' de couleur '),
    write(Couleur),
    write(' et de valeur '),
    writeln(Valeur),
    display_cartes_devinees2(Cartes).

% ----------
 % ---
affiche_coup([]) :-
    !.

affiche_coup([Carte|Cartes]) :-                    
    affiche_carte_jouee2(Carte),
    affiche_coup(Cartes).

   % ---
affiche_carte_jouee2(c(Position, Couleur, Valeur, _Temps,
                       Couleur_devinee, Valeur_devinee)) :-
	nl,
    write('carte '),
    writeln(Position),
	write('couleur proposee       : '),
    writeln(Couleur),
    write('couleur devinee        : '),
    writeln(Couleur_devinee),
    write('valeur proposee        : '),
    writeln(Valeur),
	write('reponse                : '),
    writeln(Valeur_devinee).
   
    % ---
affiche_une_carte_jouee(c(Position, Couleur, Valeur, _, Rep1, Rep2),
                        Cartes) :-                   
    member(c(Position, Couleur_pos, Valeur_pos), Cartes),
    affiche_carte_jouee_domaine(c(Position, Couleur, Valeur, _, Rep1, Rep2),
                                c(Position, Couleur_pos, Valeur_pos)).

    % ---
affiche_carte_jouee_domaine(c(Position, Couleur, Valeur, _Temps,
                              Couleur_devinee, Valeur_devinee),
                            c(Position, Couleurs_pos, Valeurs_pos)
                           ) :-
                           
     fd_dom(Couleurs_pos, Dom_couleurs),
     dom_integers(Dom_couleurs, Dom_couleurs1),
     get_couleurs(Dom_couleurs1, Dom_couleurs2),

     write('carte '),
     writeln(Position),
     write('couleur proposee       : '),
     write(Couleur),
     write(' (parmi '),
     write(Dom_couleurs2),
     writeln(' selon l''IA)'),
     check_value_domaine(Couleur, Dom_couleurs2),
     write('couleur devinee        : '),
     writeln(Couleur_devinee),

     fd_dom(Valeurs_pos, Dom_valeurs),
     dom_integers(Dom_valeurs, Dom_valeurs1),

     write('valeur proposee        : '),
     write(Valeur),
     write(' (parmi '),
     write(Dom_valeurs1),
     writeln(' selon l''IA)'),
     check_value_domaine(Valeur, Dom_valeurs1),
     write('valeur devinee         : '),
     writeln(Valeur_devinee),
     nl. % ---

affiche_coup_contraintes([], []) :-
    !.

affiche_coup_contraintes([c(Position, Couleur, Valeur, _, Rep1, Rep2)|Cartes_jouees],
                          Cartes) :-                    
    select(c(Position, Couleur_pos, Valeur_pos), Cartes, Cartes1),
    affiche_carte_jouee_domaine(c(Position, Couleur, Valeur, _, Rep1, Rep2),
                                c(Position, Couleur_pos, Valeur_pos)),
    affiche_coup_contraintes(Cartes_jouees, Cartes1).


% ----------
check_value_domaine(Valeur, Domaine) :-
    member(Valeur, Domaine),
    !.

check_value_domaine(_Valeur, _Domaine) :-
    writeln( '             !!! le joueur n''a pas restreint correctement le domaine !!!').

% ----------
affiche_domaines_carte((_Position, Couleurs_possibles, inter(Min, Max))) :-
	write('couleurs possibles     : '),
	writeln(Couleurs_possibles),
	write('valeurs possibles      : '),
	divers:affiche_intervalle(Min, Max),
	nl.

% -------------
affiche_carte_jouee(c(Couleur, Valeur, Position, Temps,
                    Couleur_devinee, Valeur_devinee)) :-
    nl,
    write('carte '),
    writeln(Position),
    write('valeur          : '),
    writeln(Valeur),
    write('couleur         : '),
    writeln(Couleur),
    write('position        : '),
    writeln(Position),
    write('temps           : '),
    writeln(Temps),
    write('couleur devinee : '),
    writeln(Couleur_devinee),
    write('valeur devinee  : '),
    writeln(Valeur_devinee).


/* ================================ DOMAINES ================================ */

% ----------
swi_affiche_domaines_contraintes(Cartes) :-
	swi_affiche_domaines(Cartes),
	swi_display_contraintes_from_cartes(Cartes).

% ----------
affiche_contraintes_domaines(Cartes) :-
    display_contraintes_from_cartes(Cartes),
    affiche_domaines(Cartes).

% ----------
swi_affiche_domaines(Cartes) :-
	fichier:set_sortie_swi,
	affiche_domaines(Cartes),
	fichier:retour_sortie_precedente.

% ----------
affiche_domaines(Cartes) :-
    bk_contraintes:get_domaines(Cartes, Domaines),
    nl,
    display_liste('domaines cartes :', Domaines).

affiche_domaines_cartes([]) :-
    !.

affiche_domaines_cartes([Carte|Cartes]) :-
    affiche_domaine_carte(Carte),
    affiche_domaines_cartes(Cartes).


affiche_domaine_carte(c(Position, Couleur, Valeur)) :-
     fd_dom(Couleur, Dom_couleurs),
     dom_integers(Dom_couleurs, Dom_couleurs1),
     get_couleurs(Dom_couleurs1, Dom_couleurs2),
     fd_dom(Valeur, Dom_valeurs),
     dom_integers(Dom_valeurs, Dom_valeurs1),
     write('carte '),
     writeln(Position),
     write('sa couleur est '),
     affiche_domaine(Dom_couleurs2),
     write('sa valeur est '),
     affiche_domaine(Dom_valeurs1),
     nl.

% ----------
affiche_domaine([V]) :-
    !,
    writeln(V).

affiche_domaine(D) :-
    write('dans '),
    writeln(D).

% ----------
affiche_les_domaines([], []) :-
    !.

affiche_les_domaines([Domaine|Domaines], [Domaine1|Domaines1]) :-
    affiche2_domaine(Domaine, Domaine1),
    affiche_les_domaines(Domaines, Domaines1).


% ----------
affiche2_domaine(
                  c(Position, Couleurs, inter(Min,Max)),
                  c(Position, Couleurs1, inter(Min1, Max1))
                ) :-
    nl,
    write('carte '),
    writeln(Position),
    write('couleurs restantes : '),
    write(Couleurs),
    write(' -> '),
    writeln(Couleurs1),
    write('valeurs restantes  : '),
    divers:affiche_intervalle(Min, Max),
    write(' -> '),
    divers:affiche_intervalle(Min1, Max1),
    nl.

/* ================================= DIVERS ================================= */

% ----------
enleve_domaines(Contraintes, Contraintes_out) :-
	select(dom(_Domaines), Contraintes, Contraintes_out),
	!.

enleve_domaines(Contraintes, Contraintes).
    
/* ============================== FIN LISTING =============================== */
