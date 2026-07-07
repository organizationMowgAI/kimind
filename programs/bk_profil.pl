:- module(
        bk_profil,
        [
            profil/2

        ]
    ).
:- style_check(-discontiguous).
:- set_prolog_flag(encoding, utf8).
:- use_module(library(csv)).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% CARACTERISTIQUES CONSTANTES %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% ============================================= Démographie ============================================= %

player(id1).
name(id1, ronald).
age(id1, 25).
gender(id1, male).
birth_country(id1, france).
birth_city(id1, paris).
residence_country(id1, france).
matrimonial_state(id1, married).
religion(id1, christianism).
profession(id1, research_engineer).

% ============================================ Personnalité ============================================= %

% Five Factor Model
openness(id1, low).
conscientiousness(id1, high).
extraversion(id1, low).
agreeableness(id1, medium).
neuroticism(id1, low).

emotivity(id1, high).
experience(id1, low).
agressivity(id1, medium).
discipline(id1, medium).
creativity(id1, high).
risk_aversion(id1, low).
individualism(id1, high).
altruism(id1, low).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% CARACTERISTIQUES CONTEXTUELLES %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

emotional_state(id1, calm, 1).
physical_state(id1, tired, 1).
cognitive_state(id1, focused, 1).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%% LIENS ENTRE CARACTERISTIQUES CONSTANTES ET CONTEXTUELLES %%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

easily_bored(Player) :- young_child(Player).
young_child(Player) :- age(Player, Age), Age < 10.
easily_angry(Player) :- neuroticism(Player, high).
easily_sad(Player) :- neuroticism(Player, high).
easily_motivated(Player) :- openness(Player, high).
easily_sad(Player) :- emotivity(Player, high), failure(Game, Player, T), failure(Game, Player, T-1).
%emotional_state(Player, sad, T) :- easily_sad(Player), failure(Game, Player, T), failure(Game, Player, T-1).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% DEFINITION DE TRAITS %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


fear_of_failure(Player) :- average_response_time(Player, T), high_response_time(T).
high_response_time(T) :- T > 30.
self_confidence(Player) :- average_response_time(Player, T), low_response_time(T).
low_response_time(T) :- T > 10.
self_control(Player) :- average_response_time(Player, T), high_response_time(T), error_rate(Player, R), low_error_rate(R).
low_error_rate(R) :- R < 0.05.      % Avec "error rate" j'entends le pourcentage d'erreurs qui auraient pu 
                                    % être évitées, pas le taux de réponses "no", "more" ou "less" de
                                    % l'ordinateur
processing_speed(Player) :- average_response_time(Player, T), low_response_time(T), error_rate(Player, R), low_error_rate(R).
impulsivity(Player) :- average_response_time(Player, T), low_response_time(T), error_rate(Player, R), high_error_rate(R).
high_error_rate(R) :- R > 0.2.


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% STATISTIQUES SUR LES PARTIES %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Détermine si un coup est valide en ce qui concerne la somme
erreur_somme(Partie, coup(_, Cartes)) :-
    maplist(arg(2), Cartes, Valeurs),  % récupère le 2e argument de chaque c/6
    writeln(Valeurs),
    sum_list(Valeurs, S),
    somme(Partie, Somme),
    S =\= Somme.

% Détermine si un coup est valide en ce qui concerne l'ordre sur les couleurs
erreur_ordre_couleurs(Partie, Coup) :-
    ordre_couleurs(Partie, Ordre),
    \+ respecte_ordre_couleurs(Coup, Ordre).

respecte_ordre_couleurs(_, Reste) :- 
    length(Reste, 1),
    !.

respecte_ordre_couleurs(coup(_, Cartes), [C1, <, C2 | Reste]) :-
    valeurs_cartes(C1, C2, Cartes, V1, V2),
    V1 < V2,
    !,
    respecte_ordre_couleurs(coup(_, Cartes), [C2 | Reste]).

respecte_ordre_couleurs(coup(_, Cartes), [C1, =, C2 | Reste]) :-
    valeurs_cartes(C1, C2, Cartes, V1, V2),
    V1 == V2,
    respecte_ordre_couleurs(coup(_, Cartes), [C2 | Reste]).

% Permet de relier la couleur et la valeur d'une carte parmi les cartes jouées
valeurs_cartes(C1, C2, Cartes, V1, V2) :-
        valeur_carte(C1, Cartes, V1),
        valeur_carte(C2, Cartes, V2).
valeur_carte(Couleur, Cartes, Valeur) :-
    member(c(Couleur, Valeur, _, _, _, _), Cartes).

% Détermine si un coup est valide en ce qui concerne les réponses du système
%erreur_reponse_systeme(Partie, Carte, Coup) :-
%    cartes_jouees(Partie, Coups),
%    \+ respecte_reponse_systeme(Carte, Coup, Coups).
%
%respecte_reponse_systeme(Carte, coup(NumCoup, Cartes), Coups) :-
%    coups_precedents(NumCoup, CoupsPrecedents),
%
%coups_precedents(NumCoup, CoupsP)


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% PROFILS KIMIND %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


rapide(infos(TempsMoyenGlobal, TempsMoyenJoueur, _NbCoupsMoyenGlobal, _NbCoupsMoyenJoueur)) :-
    TempsMoyenJoueur < TempsMoyenGlobal.

lent(infos(TempsMoyenGlobal, TempsMoyenJoueur, _NbCoupsMoyenGlobal, _NbCoupsMoyenJoueur)) :-
    TempsMoyenJoueur >= TempsMoyenGlobal.

bon(infos(_TempsMoyenGlobal, _TempsMoyenJoueur, NbCoupsMoyenGlobal, NbCoupsMoyenJoueur)) :-
    NbCoupsMoyenJoueur < NbCoupsMoyenGlobal.

mauvais(infos(_TempsMoyenGlobal, _TempsMoyenJoueur, NbCoupsMoyenGlobal, NbCoupsMoyenJoueur)) :-
    NbCoupsMoyenJoueur >= NbCoupsMoyenGlobal.

profil(Infos, confiant) :-
    rapide(Infos),
    bon(Infos).

profil(Infos, impulsif) :-
    rapide(Infos),
    mauvais(Infos).

profil(Infos, reflechi) :-
    lent(Infos),
    bon(Infos).

profil(Infos, distrait) :-
    lent(Infos),
    mauvais(Infos).
