/* ========================================================================== */
/*                          UPDATE THE BK OF A PLAYER             	  		  */
/* ========================================================================== */

:- use_module(gestion_bk_joueur).

% ----------
	% modifie la BK du joueur
	% (si la BK du joueur n'existe pas elle est creee)
	% les modification ont le format : 
	% [
	%  s(fast_player(toto), fast_play(titi)),		% s : modifie un atome 
	%  a(strong_player(jean)),						% a : ajoute un atome		
	%  r(age(jean, 31))								% r : retire un atome
    % ]
	% exemple d'appel :
	% swipl -s update_bk_player 
	%       -g "update_player_characteristics(../bk_joueurs, 'jean', [age(toto,31])"



% ----------
update_bk_player(Directory, Player, Modifs_characteristics, Modifs_stragies) :-
	update_player_characteristics(Directory, Player, Modifs_characteristics),
	update_player_strategies(Directory, Player, Modifs_strategies).
    
% ----------
update_player_characteristics(Directory, Player, Modifications) :-
	gestion_bk_joueur:
	modify_bk_characteristics(Directory, Player, Modifications),
	halt(0).

% ----------
	% modifie la BK du joueur (partie strategies) 
	% (si la BK du joueur n'existe pas elle est creee)
update_player_strategies(Directory, Player, Modifications) :-
	gestion_bk_joueur:
	modify_bk_strategies(Directory, Player, Modifications),
	halt(0).

/* ============================ FIN LISTING ================================= */
