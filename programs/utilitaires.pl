/* =============================== UTILITAIRES ============================== */

:- module(
          utilitaires, 
         [
            change_operateur/2,
            get_position/2,
            remplace_operateur_equivalence/2,
            comparaison_couleurs/1,
            comparaison_valeurs/1,
            degroupe/2,
            formate_ordre_couleurs/2,
            formate_contrainte_couleurs/2
         ]
		 ).

:- 
   use_module(library(clpfd)),
   use_module(donnees_contraintes),
   use_module(operateurs).

% ---------
change_operateur(avant, <) :-
    !.
    
change_operateur(meme_rang, =) :-
    !.
    
change_operateur(avant_meme_rang, =<).
    

% ------        
get_position(couleur(P, _Id_couleur, _Couleur, _Rep_couleur), P) :-
    !.
    
get_position(valeur(P, _Valeur, _Rep_valeur), P).


% ---------
remplace_operateur_equivalence([], []) :-
	!.

remplace_operateur_equivalence([A <=> B|Contraintes], 
							    [A #<==>B |Contraintes1]) :-
	!,
	remplace_operateur_equivalence(Contraintes, Contraintes1).
	
remplace_operateur_equivalence([Contrainte|Contraintes], 
							    [Contrainte|Contraintes1]) :-
	remplace_operateur_equivalence(Contraintes, Contraintes1).

  
% ---------  
comparaison_couleurs(Comparaison) :-
    Comparaison =..[Comp, C1, C2],
    atom(C1),
    atom(C2),
    member(Comp, [meme_rang, avant, \=]),
    !.                         % retire point de choix sur member
    
comparaison_valeurs(Comparaison) :-
    Comparaison =..[Comp, V1, V2],
    atom(V1),
    atom(V2),
    member(Comp, [<, =<, =, \=]),
    !.                         % retire point de choix sur member
    
% ---------
    % remet les contraintes a plat (hors de groupes)
degroupe([], []) :-
    !.
    
degroupe([Groupe|Groupes], Contraintes_out) :-
    degroupe_groupe(Groupe, Contraintes),
    degroupe(Groupes, Contraintes1),
    append(Contraintes, Contraintes1, Contraintes_out).
     
% ---------
degroupe_groupe(co(Contraintes), Contraintes) :-
    !.

degroupe_groupe(co(_Carte, Contraintes), Contraintes) :-
    !.

degroupe_groupe(co(_Carte1, _Carte2, Contraintes), Contraintes).
    
% --------- 
    % pour les couleurs remplace avant par < et meme_rang par =
formate_ordre_couleurs([],  []) :-
    !.
    
formate_ordre_couleurs([Contrainte|Contraintes], [Contrainte1|Contraintes1]) :-
    formate_contrainte_couleurs(Contrainte, Contrainte1),
    formate_ordre_couleurs(Contraintes, Contraintes1).
      
% ---------
formate_contrainte_couleurs(Comp_couleurs <=> Comp_valeurs, 
                            Comp_couleurs1 <=> Comp_valeurs) :-
    contraintes:comp_ordre_couleurs(Comp_couleurs),
    !,
    Comp_couleurs =..[Op, C1, C2],
    change_operateur(Op, Op1),
    Comp_couleurs1 =..[Op1, C1, C2].
    
formate_contrainte_couleurs(Comp_valeurs <=> Comp_couleurs, 
                            Comp_couleurs1 <=> Comp_valeurs) :-
    !,
    Comp_couleurs =..[Op, C1, C2],
    change_operateur(Op, Op1),
    Comp_couleurs1 =..[Op1, C1, C2].
    
formate_contrainte_couleurs(avant(C1, C2), C1 < C2) :-
	!.
	
formate_contrainte_couleurs(avant_meme_rang(C1, C2),  C1 =< C2) :-
	!.
	
formate_contrainte_couleurs(meme_rang(C1, C2),  C1 = C2) :-
	!.
	
   % pas de comparaisons entre couleurs
formate_contrainte_couleurs(Contrainte, Contrainte).
    
/* ============================  FIN LISTING ================================ */
