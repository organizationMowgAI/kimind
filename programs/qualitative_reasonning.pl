% ============================================================================ %
%                          RAISONNEMENT QUALITATIF                       	   % 
% ============================================================================ %
  
:- module(qualitative_reasoning, 
          [
			qualities/1,
			number_qualities/1,
			quality/2,

			first_quality/1,
			last_quality/1,

			less_equal_quality/2,
			less_quality/2,
			greater_equal_quality/2,
			greater_quality/2,

			min_quality/3,
			max_quality/3,
			average_quality/3,

			next_quality/2,
			previous_quality/2
			
          ]
         ).

/* =================================== DATA  ================================= */

% ----------
qualities([very_difficult, difficult, medium, easy, very_easy]).

% ----------
number_qualities(5).

% ----------
quality(very_difficult, 1).
quality(difficult, 2).
quality(medium, 3).
quality(easy, 4).
quality(very_easy, 5).

/* =========================== GESTION DES VALEURS ========================== */

% ----------
first_quality(X) :-
	quality(X, 1).

% ----------
last_quality(X) :-
	number_qualities(RX),
	quality(X, RX).
	
% -----------
less_equal_quality(X, Y) :-
    quality(X, RX),
    quality(Y, RY),
    RX =< RY.

% ----------
less_quality(X, Y) :-
    quality(X, RX),
    quality(Y, RY),
    RX < RY.

% ----------
greater_equal_quality(X, Y) :-
    quality(X, RX),
    quality(Y, RY),
    RX >= RY.

% ----------
greater_quality(X, Y) :-
    quality(X, RX),
    quality(Y, RY),
    RX > RY.

% ----------
	% retourne la plus petite des 2 qualites X et Y 
min_quality(X, Y, X) :-
    less_equal_quality(X, Y), 
	!.

min_quality(_, Y, Y).

% ----------
	% retourne la plus grande des 2 qualityes X et Y
max_quality(X, Y, X) :-
    greater_equal_quality(X, Y), 
	!.

max_quality(_, Y, Y).

% ----------
	% retourne la qualite au milieu (si possible) de X et Y
average_quality(X, Y, Z) :-
    quality(X, RX),
    quality(Y, RY),
    RZ is round((RX + RY) / 2),
    quality(Z, RZ).

% ----------
	% retourne la qualite suivant X
next_quality(X, X) :-
	last_quality(X),
	!.

next_quality(X, Y) :-
	quality(X, RX),
	RY is RX + 1,
    quality(Y, RY).

% ----------
previous_quality(X, X) :-
	first_quality(X),
	!.

previous_quality(X, Y) :-
	quality(X, RX),
	RY is RX - 1,
	quality(Y, RY).

% ----------
improve_quality(X, Y) :-
    next_quality(X, Y).

% ----------
degrade_quality(X, Y) :-
    previous_quality(X, Y).

/* =============================== FIN LISTING ============================== */
