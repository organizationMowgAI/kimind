/* ========================================================================== */
/*                  ANALYSE UNE PARTIE KIMIND (format prolog)                 */
/* ========================================================================== */

:- module(
          analyse_enonce, 
          [
            analyse_enonce/6
          ]
	     ).

:-
   use_module(library(clpfd)),
   use_module(library(lists)),
   use_module(prolog),
   use_module(liste),
   use_module(bk),
   use_module(affichage_contraintes),
   use_module(bk_contraintes),
   use_module(bk_strategie).

:- set_prolog_flag(stack_limit, 4_294_967_296).

    % ---   
analyse_enonce(Nb_cartes, Domaine_couleurs, Domaine_valeurs,
               Positions, Somme, _Cartes_jouees) :-

    construit_contraintes:construit_contraintes(Nb_cartes,
                                                       Domaine_couleurs, 
                                                       Domaine_valeurs, 
                                                       Positions,
                                                       Somme,
                                                       Cartes),
                        % toutes les solutions initiales
    bk_contraintes:calcule_solutions(Cartes, Solutions),
    length(Solutions, Nb_solutions),
    write(Nb_solutions),
    writeln(' solutions initiales'),

    % get_coup_joueur(Cartes_jouees, Nb_cartes, Coup, _Cartes_jouees1),        
    % retire_reponse(Coup, Coup1),

    Best_qualite_vue is Nb_solutions * Nb_solutions,        % pire cas
    writeln('pire qualite possible :'),
    writeln(Best_qualite_vue),
    nl,

    qualites_coups(Solutions, Solutions, 1, Best_qualite_vue, [], absolu,
                   parametres(Nb_cartes, Domaine_couleurs, Domaine_valeurs,
                              Positions, Somme), 
                   Best_qualite, Meilleurs_coups),
    nl,
    nl, 
    writeln('meilleure qualite :'),
    writeln(Best_qualite),
    liste:display_liste('meilleurs coups :', Meilleurs_coups).
   

    % ---
    % calcule les qualites de tous les premiers coups possibles
    % (chaque solution est un coup possible)
qualites_coups([], _Solutions, _C, Best_qualite, Meilleurs_coups, 
               _Mode, _Parametres, Best_qualite, Meilleurs_coups) :-
    !.

qualites_coups([Coup|Coups], Solutions, C, Best_qualite_vue, 
               Meilleurs_coups_vus,Mode, Parametres, Best_qualite, 
               Meilleurs_coups) :-
    write('calcul de la qualite du coup '),
    writeln(C),
    writeln(Coup),
    qualite_coup(Solutions, Coup, Best_qualite_vue, 0, Mode, 
                 Parametres, Qualite),
    write('qualite : '),
    writeln(Qualite),
    nl,
    C1 is C+1, 
    check_qualite_coup(Coup, Best_qualite_vue, Qualite, Meilleurs_coups_vus,
                       Best_qualite_vue1, Meilleurs_coups_vus1),
    qualites_coups(Coups, Solutions, C1, Best_qualite_vue1, Meilleurs_coups_vus1,
                   Mode, Parametres, Best_qualite, Meilleurs_coups).

    % ---
    % Qualite est la meilleure qualite jusqu'ici
    % c'est le premier coup associe a cette qualite
check_qualite_coup(Coup, Best_qualite_vue, Qualite, _Meilleurs_coups,
                   Qualite, [Coup]) :-
    Qualite < Best_qualite_vue,
    !.

    % Qualite est egale a la meilleure qualite vue on
    % conserve le coup
check_qualite_coup(Coup, Best_qualite_vue, Qualite, Meilleurs_coups,
                   Best_qualite_vue, [Coup|Meilleurs_coups]) :-
    Qualite == Best_qualite_vue,
    !.

check_qualite_coup(_Coup, Best_qualite_vue, _Qualite, Meilleurs_coups,
                   Best_qualite_vue, Meilleurs_coups).


    % ---
    % mesure la qualite du coup joue comme le nombre 
    % de solutions possibles restantes
    % (somme des solutions restantes si le coup est jouee,
    %  face aux solutions possibles)
qualite_coup([], _Coup_joue, _Best_qualite_vue, Qualite, 
             _Mode, _Parametres, Qualite) :-
    !.

    % on ne cherche pas la qualite absolue
    % juste savoir si le coup est meilleur ou moins bon
    % que le meilleur coup jusqu'ici
qualite_coup(_Solutions, _Coup_joue, Best_qualite_vue, 
             Qualite, relatif, _Parametres, Qualite) :-
    Qualite >= Best_qualite_vue,
    !.
    
    % le coup joue est la solution envisagee 
qualite_coup([Coup_joue|Solutions], Coup_joue, Best_qualite_vue, 
             Qualite_actuelle, Mode, Parametres, Qualite) :-
    % writeln('1 solution'),
    Qualite_actuelle1 is Qualite_actuelle + 1,
    qualite_coup(Solutions, Coup_joue, Best_qualite_vue, Qualite_actuelle1,
                 Mode, Parametres, Qualite).
    
    % le coup joue n'est pas la solution
    % on calcule le nombre de solutions restantes
    % en supposante que Solution est la solution
qualite_coup([Solution|Solutions], Coup_joue, Best_qualite_vue,
              Qualite_actuelle, Mode, 
               parametres(Nb_cartes, Domaine_couleurs, Domaine_valeurs,
                         Positions, Somme),
              Qualite) :-
            % on ajoute a Coup_joue la reponse du systeme
            % si la solution est Solution
            % les contraintes sont modifiees
     Parametres =  parametres(Nb_cartes, Domaine_couleurs, Domaine_valeurs,
                              Positions, Somme),

     construit_contraintes:construit_contraintes(Nb_cartes,
                                                        Domaine_couleurs, 
                                                        Domaine_valeurs, 
                                                        Positions,
                                                        Somme,
                                                        Cartes),
    % nl,
    % writeln('===================== solution envisagee ======================='),
    % nl,
    % writeln(Solution),
                            % ajoute la reponse du systeme au coup
    bk:reponse_coup(Coup_joue, Solution, Coup_joueA),  
    bk:ordonne_cartes(Coup_joueA, Coup_joue1),

    % nl,
    % writeln('coup jouee :'),
    % writeln(Coup_joue1),
    analyse_coup(Coup_joue1, Cartes),
           % analyse_coup a change les contraintes associees a Cares
    % affichage_contraintes:affiche_domaines(Cartes),
    % affichage_contraintes:display_contraintes_from_cartes(Cartes),
    bk_contraintes:calcule_solutions(Cartes, Solutions_coup),
    length(Solutions_coup, N),
    % write(N),
    % writeln(' solution(s) restante(s)'),
    Qualite_actuelle1 is Qualite_actuelle + N,
    qualite_coup(Solutions, Coup_joue, Best_qualite_vue, Qualite_actuelle1, 
                 Mode, Parametres, Qualite).
    
    % retire les reponses au coup
retire_reponse([], []) :-
    !.

retire_reponse([c(Position, Couleur, Valeur, _, _, _)|Cartes],
               [c(Position, Couleur, Valeur)|Cartes1]) :-
    retire_reponse(Cartes, Cartes1).    
 

    % analyse les reponses du systeme
analyse_coup([], _Cartes) :-  
    !.  
    
analyse_coup([Carte_jouee|Cartes_jouees], Cartes) :-
    analyse_reponse(Carte_jouee, Cartes),
    analyse_coup(Cartes_jouees, Cartes). 

 
    % ---   
analyse_reponse(c(Position, Couleur_jouee, Valeur_jouee, _, 
                Rep_couleur, Rep_valeur), Cartes) :-          
    member(c(Position, Var_couleur, Var_valeur), Cartes), 
    get_id_couleur(Couleur_jouee, Id_couleur),   
    analyse_reponse_couleur(Var_couleur, Id_couleur,  Rep_couleur),
    analyse_reponse_valeur(Var_valeur, Valeur_jouee, Rep_valeur).

   
    % couleur devinee 
analyse_reponse_couleur(Var_couleur, Id_couleur, oui) :-
    !,
    Var_couleur #= Id_couleur.

analyse_reponse_couleur(Var_couleur, Id_couleur, non) :-
    Var_couleur #\= Id_couleur.

    % ---
    % valeur cachee devinee 
analyse_reponse_valeur(Var_valeur, Valeur_jouee, oui) :-
    !,                   
    Var_valeur #= Valeur_jouee.   
    
    % valeur_cachee < Valeur 
analyse_reponse_valeur(Var_valeur, Valeur_jouee, moins) :-
    !,                   
    Var_valeur #< Valeur_jouee. 
    
   % valeur_cachee > Valeur
analyse_reponse_valeur(Var_valeur, Valeur_jouee, plus) :-                
    Var_valeur #> Valeur_jouee.     
       

    % recupere le coup jouee
get_coup_joueur(Cartes, Nb_cartes_a_deviner, Coup, Cartes_out) :-
    select_n_first(Cartes, Nb_cartes_a_deviner, Cartes_out, Coup).
                           
/* ============================== FIN LISTING =============================== */
