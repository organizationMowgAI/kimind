/* ========================== GERE DES TABULATIONS ========================== */

:- module(tabulation,
          [
            tab/1,
            tab_plus/3,
            tab_plus/2,
            tab_moins/2
          ]
          ).

% ----------
tab(Tab) :-
	write(Tab).

% ----------
tab_plus(Tab, Tab1) :-
	atom_concat(Tab, '       ', Tab1).

% ----------
tab_moins(Tab, Tab1) :-
	tab_plus(Tab1, Tab).

% ----------
tab_plus(Tab, N, Tab1) :-
	n_blancs(N, Atom),
	atom_concat(Tab, Atom, Tab1).

% --------
	% cree un atome compose de n caracteres ' '
n_blancs(0, '') :-
	!.

nb_blancs(N, Atom) :-
	N1 is N-1,
	nb_blancs(N1, Atom1),
	atom_concat(' ', Atom1, Atom).
	
/* ============================== FIN LISTING =============================== */

