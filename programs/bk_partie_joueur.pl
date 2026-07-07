% ============================================================================ %
%             BK SUR LA CARACTERISATION DE LA DIFFICULTE D'UNE PARTIE          %
%                 EN FONCTION DE LA FACON DE JOUER D'UN JOUEUR                 %
% ============================================================================ %
  
:- module(bk_partie_joueur, 
          [
			player_game_difficulty/4
			% player_game_difficulties/4
          ]
         ).
 
:-
    use_module(fonctions_partie_joueur),
    use_module(bk_solution),
    use_module(bk_partie),
    use_module(bk_enonce),
    use_module(qualitative_reasoning).

/* ================================ RULES =================================== */

% ---------- 
	% Couleurs croissantes
	% Si le joueur suit l'ordre des couleurs de l'enonce et que la solution aussi,
	% alors la difficulte de la partie pour ce joueur se resume a la difficulte de
	% la partie en considerant le nombre de solutions sans prendre en compte les
	% positions
player_game_difficulty(follows_colours_order, Game, Solution, 
					   same_colours_order(Player_difficulty)) :-
    solution_follows_colours_order(Game, Solution),
	!,
	no_position_difficulty(Game, Player_difficulty).

	% Couleurs décroissantes
	% (idem le joueur determine immediatement la position des cartes)
player_game_difficulty(follows_reversed_colours_order, Game, Solution, 
					   reversed_colours_order(Player_difficulty)) :-
    solution_follows_reversed_colours_order(Game, Solution),
	!,
	no_position_difficulty(Game, Player_difficulty).

% ---------- 
	% Sommes plus difficiles en termes de calcul mental
player_game_difficulty(struggles_with_higher_numbers,
                       Game, _Solution, 
					   high_sum(Player_difficulty)) :-
	struggling_with_higher_numbers_difficulty(Game, Player_difficulty). 

% ----------
	% le joueur n'a aucune facilite ou difficulte particuliere
	% sa difficulte est celle de la partie
/*
player_game_difficulty(_, Game, _Solution, Difficulty) :-
    difficulty_instance(pos, Game, 5, Difficulty).
*/


% ----------
player_game_difficulty(confusion_between_6_and_9,
					   Game, _Solution,
					   confusion_6_9(Player_difficulty)) :-
	confusion_6_9(Game, Player_difficulty). 

% ----------
	% Preferences de valeurs
/*
player_game_difficulty(value_tendency(Player, 0, Value), _Instance, 
					   [c(0,_Colour,Value), _, _, _], very_easy) :-
    !.

player_game_difficulty(value_tendency(Player, 1, Value), _Instance, 
					   [_, c(0,_Colour,Value), _, _], very_easy) :-
    !.

player_game_difficulty(value_tendency(Player, 2, Value), _Instance, 
					   [_, _, c(0,_Colour,Value), _], very_easy) :-
    !.

player_game_difficulty(value_tendency(Player, 3, Value), _Instance, 
					  [_, _, _, c(0,_Colour,Value)], very_easy).
*/

/* -------------------------------------------------------------------------- */
/* 	   RAISONNEMENT QUALITATIF POUR QUALIFIER LA DIFFICULTE D'UNE PARTIE      */ 
/*             EN FONCTION DES CARACTERISTIQUES D'UN JOUEUR                   */  
/* -------------------------------------------------------------------------- */




/* =============================== FIN LISTING ============================== */
